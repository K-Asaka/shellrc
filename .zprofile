### PATH
path=(
    $HOME/bin(N-/)
    $HOME/.rbenv/bin(N-/)
    $HOME/.pyenv/bin(N-/)
    $HOME/Android/Sdk/platform-tools(N-/)
    $path
)

### Character set
export LC_CTYPE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

export EDITOR=vim
export VISUAL=vim

if command -v rbenv 1>/dev/null 2>&1; then eval "$(rbenv init -)"; fi
if command -v pyenv 1>/dev/null 2>&1; then eval "$(pyenv init -)"; fi

