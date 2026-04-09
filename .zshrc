export ZDOTDIR="${HOME}"

if [[ -r /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

[[ -r "${HOME}/.p10k.zsh" ]] && source "${HOME}/.p10k.zsh"
