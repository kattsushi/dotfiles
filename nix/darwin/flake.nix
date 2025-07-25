{
  description = "Andres's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    #nix-homebrew.url = "git+https://github.com/zhaofengli/nix-homebrew?ref=refs/pull/71/merge";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      
      nixpkgs.config.allowUnfree = true;  
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.mkalias
	        pkgs.neovim
	        pkgs.tmux
	        pkgs.tree
	        pkgs.fzf
	        pkgs.zoxide
          pkgs.bun
          pkgs.fnm
          pkgs.lazygit
          pkgs.oh-my-zsh
          pkgs.vscode
          pkgs.google-chrome
        ];

      homebrew = {
	      enable = true;
	      brews = [
          "mas"
	        "stow"
	      ];
	      casks = [
          "ghostty"
          "raycast"
          "zen"
	        "trae"
	        "firefox"
          "capcut"
          "orbstack"
          "protonvpn"
          "keycastr"
	      ];
	      masApps = {
	       "CleanMyMac" = 1339170533;
	      };
	      onActivation.cleanup = "zap";
	      onActivation.autoUpdate = true;
	      onActivation.upgrade = true;
        onActivation.extraFlags = [ "--verbose" ];
      };
      fonts.packages = [
      	pkgs.nerd-fonts.jetbrains-mono
      ];
      system.defaults = {
	      dock.autohide = true;
	      dock.persistent-apps = [
	        "/Applications/Ghostty.app"
	        "/Applications/Zen.app"
	        "/Applications/Trae.app"
          "/Applications/Nix Apps/Visual Studio Code.app"
	      ];
	      finder.FXPreferredViewStyle = "clmv";
	      loginwindow.GuestEnabled = false;
	      NSGlobalDomain.AppleICUForce24HourTime = true;	
	      NSGlobalDomain.AppleInterfaceStyle = "Dark";
	      NSGlobalDomain.KeyRepeat = 2;
      };

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
