ICON_LAMBDA=$'\u03bb'
ICON_BRANCH=$'\uf126'
ICON_DOT=$'\uf444'
ICON_ARROW=$'\uf432'
ICON_BLAME=$'\ue0c0'

PROMPT="%{$fg[black]%}%(?:%{$bg_bold[green]%}%1{ ${ICON_LAMBDA}%}:%{$bg_bold[red]%}%1{ ${ICON_LAMBDA}%})%{$reset_color%}" # feature lambda icon
PROMPT+="%(?:%{$fg[green]%}%1{${ICON_BLAME}%}:%{$fg[red]%}%1{${ICON_BLAME}%})%{$reset_color%} " # feature blame
PROMPT+="%{$fg[cyan]%} %c%{$reset_color%}" # current directory
PROMPT+='$(git_prompt_info)' # git prompt
PROMPT+=" %{$fg[green]%}${ICON_ARROW}  " # arrow of code

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%} on ${ICON_BRANCH} %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}%{$fg[red]%}%1{${ICON_DOT}%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

ICON_CALENDAR=$'\uf133'   # Ícone de calendário
ICON_CLOCK=$'\uf017'  # Ícone de relógio
ICON_CPU=$'\ue266'    # Ícone de CPU
ICON_RAM=$'\uefc5'    # Ícone de memória RAM
ICON_FAN=$'\uefa7'    # Ícone de ventoinha

# Funções auxiliares para obter métricas do sistema 
function cpu_percent() {
  echo $((100 - $(vmstat 1 2 | tail -1 | awk '{print $15}' | sed 's/%//')))
}

function ram_percent() {
  echo $(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d. -f1)
}

function cpu_temp() {
  if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    echo $(( $(cat /sys/class/thermal/thermal_zone0/temp) / 1000 ))
  elif [ -f /proc/acpi/thermal_zone/THM0/temperature ]; then
    awk '{print $2}' /proc/acpi/thermal_zone/THM0/temperature
  else
    echo "N/A"
  fi
}

RPROMPT='%F{blue}${ICON_CALENDAR} %F{white}%D{%d %b %Y} %F{blue}${ICON_CLOCK} %F{white}%D{%H:%M}%f'  # Data e Hora atual
# RPROMPT+=' %{$fg[yellow]%}${ICON_CPU} $(cpu_percent)%%%{$reset_color%}'  # Uso de CPU
# RPROMPT+=' %{$fg[green]%}${ICON_RAM} $(ram_percent)%%%{$reset_color%}'  # Uso de RAM
# RPROMPT+=' %{$fg[red]%}${ICON_FAN} $(cpu_temp)°C%{$reset_color%}'  # Temperatura da CPU
