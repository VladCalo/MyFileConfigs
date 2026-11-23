eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias k='kubectl'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias kc='kubectx'
alias kns='kubens'
alias l='eza'
alias gall='git fetch --prune && git pull --rebase'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log'
alias g='git'
alias gpl="git fetch --prune && git branch -vv | grep ': gone]' | awk '{print \$1}' | xargs git branch -D"
alias tf='terraform'
alias ap='ansible-playbook'
alias os="openstack"
alias claude-personal='CLAUDE_CONFIG_DIR=$HOME/.claude-personal claude'
alias claude-work='CLAUDE_CONFIG_DIR=$HOME/.claude-work claude'
alias argo-secret=' kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d'
alias ntmux='env -u TMUX tmux new-session'
alias tmux-purple='tmux set-option -t "$(tmux display-message -p '#S')" status-style "bg=blue,fg=black"'
alias tmux-green='tmux set-option -t "$(tmux display-message -p '#S')" status-style "bg=green,fg=black"'
alias vault-login-ldap='vault login -method=ldap username=vlad.calomfirescu@gcore.lu'

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export VAULT_ADDR="https://puppet-vault.gc.onl"

# Replace the static export with a function that runs kubectl with the dynamic list
kubeconfig_refresh() {
  export KUBECONFIG=$(find ~/.kube/configs -type f -name "*.yaml" | tr '\n' ':')
}
kubeconfig_refresh  # run at startup

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
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools
export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/jdk-17.0.20.1+1/Contents/Home"
export ANDROID_SDK_ROOT=$ANDROID_HOME

export TOKEN_PREPROD=1953715_ee37b7c7f4d0fd932c4f2cb519ebe014752e38a0c312768377e80f3b23b0afaabadc42fb3b4c4b899a5c0a98e873f26bf4c4f177298b63d8831ba47d46b6cc5e
export TOKEN_PREPROD=45004_44c2f7b14bedf8f9c533cffa698e064d279d12e1a76f062af26ef3058b5c31e3e4d13e9b525f13a0c4f986ca6d6495d67f4149c71aee114f7f8ecd938f14d06c
