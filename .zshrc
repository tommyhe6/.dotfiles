# brew install z
. /opt/homebrew/etc/profile.d/z.sh

# brew install exa
# exa shorthands
alias l='exa --git --icons --long'
alias la='exa --git --icons --long --all'
alias ll='exa --git --icons'

# dotfiles
alias dot='git --git-dir=/Users/tommyhe/.dotfiles/ --work-tree=/Users/tommyhe $argv'

# git
alias g='git'

# Air for hot reload golang
alias air='$(asdf where golang)/packages/bin/air' 

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tommyhe/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tommyhe/google-cloud-sdk/completion.zsh.inc'; fi

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=50000
HISTDUP=erase
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# don't store duplicate history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


# cd history
setopt AUTO_PUSHD                  # pushes the old directory onto the stack
setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')
autoload -U compinit && compinit   # load + start completion
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

# stop ctrl-d closing terminal
setopt ignore_eof 

# TODO: normalize colors
# Customize the Zsh prompt
PROMPT='[%W %*] %F{yellow}%~%f %F{%(?.green.red)}%?%f
%F{%(?.green.red)}> %F{white}'

# brew install zsh-syntax-highlighting
# brew install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

