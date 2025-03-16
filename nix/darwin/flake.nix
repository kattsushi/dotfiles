{
  description = "Andres's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      
      nixpkgs.config.allowUnfree = true;  
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
	  pkgs.alacritty
	  pkgs.mkalias
	  pkgs.neovim
	  pkgs.tmux
        ];

      homebrew = {
	enable = true;
	brews = [
 	  "mas"
	  "stow"
	];
	casks = [
	  "zen-browser"
	  "trae"
	  "firefox"
	];
	masApps = {
	  "CleanMyMac" = 1339170533;
	};
	onActivation.cleanup = "zap";
      };
      fonts.packages = [
      	pkgs.nerd-fonts.jetbrains-mono
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."air" = nix-darwin.lib.darwinSystem {
      modules = 
       [ 
	 mac-app-util.darwinModules.default
      	 configuration
	 nix-homebrew.darwinModules.nix-homebrew 
	  {
   	    nix-homebrew = {
	     enable = true;
	     # Apple silicon only
	     enableRosetta = true;
	     # User owning the Homebrew prexix
	     user = "andresjimenez";

	     autoMigrate = true;
	    };
	  }
       ];
    };
    # Expose the package set including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."air".pkgs;
  };
}
