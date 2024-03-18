# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions web-search)

# User configuration

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# SOURCES
source $(dirname $(gem which colorls))/tab_complete.sh

source $ZSH/oh-my-zsh.sh

# KEYBINDS
bindkey '^[[Z' autosuggest-accept # shift + tab
#bindkey '/t' menu-complete    # tab -> overrides default tab completion

# ALIASES
alias py='python3'

alias ls='colorls'                  # no flags
alias ls1='colorls -1'              # 1 entry per line
alias lsd='colorls --dirs'          # [-d] dirs only
alias lsf='colorls --files'         # [-f] files only
alias lsdf='colorls --sort-dirs'    # [-sd] dirs then files
alias lsfd='colorls --sort-files'    # [-f] files then dirs
alias lsl='colorls --long'          # [-l] long listing
alias lsa='colorls --all'           # [-a] lists all 
alias lsA='colorls --almost-all'    # [-A] lists all except ./ and ../
alias lsT='colorls --tree'          # file tree MAXDEPTH
alias lst='colorls --tree=3'        # file tree DEPTH = 3
alias lsta='colorls --tree=3 --all'        # file tree DEPTH = 3

# ranger exits to current dir
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# git aliases
alias gs='git status'

alias ff='fastfetch'
# start tmux with fastfetch
alias tff='tmux new -d && tmux send-keys "fastfetch" Enter && tmux a'

# cd home
alias h='cd ~'

# new tmux window to Game folder -- MUST have a tmux session started already
alias game='tmux new-window -c ~/Developer/GLFW/GAME; tmux rename-window GAME'
alias rv2='tmux new-window -c ~/Developer/rust/exp; tmux rename-window V2; tmux split-window -h -c "#{pane_current_path}"; tmux split-window -v -c "#{pane_current_path}"; tmux select-pane -t 0; tmux send-keys "nvim src/main.rs" Enter'
# need this so shell knows where ruby is (initially for mdless)
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export PATH=/Users/joaobrilha/apache/apache-maven-3.9.6/bin:$PATH

export PATH=$HOME/Developer/flutter/:$PATH

export FZF_DEFAULT_OPTS_FILE=~/.fzfrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joaobrilha/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joaobrilha/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joaobrilha/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joaobrilha/google-cloud-sdk/completion.zsh.inc'; fi

export DATASTORE_USE_PROJECT_ID_AS_APP_ID=true
export DATASTORE_DATASET=inspired-aria-415914
export DATASTORE_EMULATOR_HOST=localhost:8081
export DATASTORE_EMULATOR_HOST_PATH=localhost:8081/datastore
export DATASTORE_HOST=http://localhost:8081
export DATASTORE_PROJECT_ID=inspired-aria-415914
