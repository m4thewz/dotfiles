if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/matheus/.oh-my-zsh"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

plugins=(git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_STYLES[comment]='fg=7,bg=8'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=10'
ZSH_HIGHLIGHT_STYLES[default]='fg=15'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=15,bg=1,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=10,bold'

ZSH_HIGHLIGHT_STYLES[alias]='fg=2'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=2'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=2'

ZSH_HIGHLIGHT_STYLES[function]='fg=2,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=2'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=10,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=2'

ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=5,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=1,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=9,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=1,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=9,bold'

ZSH_HIGHLIGHT_STYLES[path]='fg=4,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=4,underline'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=4,underline'

ZSH_HIGHLIGHT_STYLES[globbing]='fg=4'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=12'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=9,bold'
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=11,bold'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=7'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=7'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=3'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=3'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=3'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=3'

ZSH_HIGHLIGHT_STYLES[assign]='fg=9,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=5,bold'

source ~/.config/zsh/.p10k.zsh
