eval "$(starship init zsh)"

alias k='kubectl'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias kc='kubectx'
alias gall='git fetch --prune && git pull --rebase'
alias gs='git status'
alias g='git'
alias gpl="git fetch --prune && git branch -vv | grep ': gone]' | awk '{print \$1}' | xargs git branch -D"


export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# kubeconfig
export KUBECONFIG=$(find ~/.kube/configs -type f -name "*.yaml" | tr '\n' ':')

# zsh completion system
autoload -Uz compinit
compinit

# kubectl autocomplete
source <(kubectl completion zsh)
compdef k=kubectl

# helm autocomplete
source <(helm completion zsh)

# terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
