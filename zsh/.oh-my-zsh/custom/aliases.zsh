# ~/.dotfiles/zsh/.oh-my-zsh/custom/aliases.zsh
# ─────────────────────────────────────────────────────────────

# Navegação por diretórios
alias dot='cd $DOTFILES'
alias p1='cd $P1'
alias edb2='cd $P2'
alias tcp='cd $TCC'
alias cl='cd $LAB'
alias ufrn='cd $UFRN'

# Comandos do sistema / produtividade
alias c='clear'
alias top='btm'

# Gerenciador de pacotes (nala)
alias install='sudo nala install -y'
alias uninstall='sudo nala remove -y'
alias update='sudo nala update'
alias upgrade='sudo nala upgrade'

# Manipulação de arquivos
alias mvv='mv --verbose'
alias cpv='cp --verbose'

# Visualização com eza (ls moderno)
alias ls='eza --icons --no-quotes --sort type'
alias tree='la --tree'
