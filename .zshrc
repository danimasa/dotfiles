# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
export PATH=$HOME/programs/zotero-client/app/staging/Zotero_linux-x86_64:$HOME/foam/paraview_build/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.config/zshrc.d/auto-Hypr.sh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"

alias cd="z"

eval "$(zoxide init zsh)"

alias masahome="ssh danimasa@masahome"
alias fe50="source $HOME/foam/foam-extend-5.0/etc/zshrc"
alias euler="ssh danimasa@euler.icmc.usp.br"

# export LANG="pt_BR"

# Created by `pipx` on 2025-02-16 10:59:10
export PATH="$PATH:/home/danimasa/.local/bin:/home/danimasa/.platformio/penv/bin"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
