eval "$(fnm env --use-on-cd)"

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

ZSH_THEME="powerlevel10k/powerlevel10k"

#export PNPM_HOME="/Users/andresjimenez/Library/pnpm"
#export PATH="$PNPM_HOME:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"
