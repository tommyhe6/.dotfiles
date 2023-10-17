# intel and apple sillicon brew installation
if [[ $(uname -m) == 'arm64' ]]; then
    BREWPATH=/opt/homebrew/bin
else
    BREWPATH=/usr/local/bin
fi
export PATH=$BREWPATH:$PATH

# dbus for zathura and vimtex
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

# GCP
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"
if [ -f '/Users/tommyhe/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tommyhe/google-cloud-sdk/path.zsh.inc'; fi

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

# default neovim editor
export VISUAL=nvim
export EDITOR="$VISUAL"
