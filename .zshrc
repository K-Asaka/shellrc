bindkey -v
ttyctl -f

autoload -Uz compinit; compinit
autoload -U promptinit && promptinit
autoload -Uz colors && colors
zstyle ':completion:*:default' menu select=2
local DEFAULT=%{$reset_color%}
local RED=%{$fg[red]%}
local GREEN=%{$fg[green]%}
local YELLOW=%{$fg[yellow]%}
local BLUE=%{$fg[blue]%}
local PURPLE=%{$fg[purple]%}
local CYAN=%{$fg[cyan]%}
local WHITE=%{$fg[white]%}

setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt completealiases
setopt pushd_ignore_dups
setopt IGNOREEOF
setopt print_eight_bit
setopt nolistbeep
setopt no_beep

ZSH_SYNTAX_HL="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [[ -f $ZSH_SYNTAX_HL ]]; then
    source $ZSH_SYNTAX_HL
fi

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
MAILCHECK=0

test $REMOTEHOST
case $? in
    0) PROMPT="$USER@%m:%c%(!.#.$)%u ";;
    1) PROMPT="$USER:%c%(!.#.$)%u ";;
esac
RPROMPT="[%m]"
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [No/Yes/Abort/Edit]"

if [ "$TERM" = "kterm" ] || [ "$TERM" = "xterm" ] || [ "$TERM" = "screen" ]; then
    precmd()  { print -Pn "\e]0;%c %n@%m\a" }
    preexec() { print -Pn "\e]0;[$1] %n%m\a" }
fi

### History
setopt HIST_IGNORE_DUPS
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

if [ $UID = 0 ]; then
    unset HISTFILE
    SAVEHIST=0
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/asaka/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/asaka/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/asaka/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/asaka/google-cloud-sdk/completion.zsh.inc'; fi

if command -v vim 1>/dev/null 2>&1; then eval "alias vz='vim ~/.zsh/.zshrc'"; fi
if command -v brew 1>/dev/null 2>&1; then eval "alias brew=\"PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew\""; fi

