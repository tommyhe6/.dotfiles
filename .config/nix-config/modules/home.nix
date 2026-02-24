{ config, pkgs, ... }:

let homeDirectory = "/Users/tommyhe"; in
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  home = {
    username = "tommyhe";
    homeDirectory = homeDirectory;
    stateVersion = "25.05";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      DBUS_SESSION_BUS_ADDRESS = "unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"; # vimtex
      LESS = "--status-column --long-prompt --shift 10 --chop-long-lines --line-numbers";
    };

    shellAliases = {
      l = "eza --git --icons --long";
      la = "eza --git --icons --long --all";
      ll = "eza --git --icons";
      ltree = "eza --tree --git --icons";
      g = "git";
      dots = "git --git-dir=/Users/tommyhe/.dotfiles/ --work-tree=/Users/tommyhe $argv";
      v = "nvim";
    };

    file = {
      ".psqlrc".source = ../psql/psqlrc;
    };
  };

  home.packages = with pkgs; [
    # common utils
    gnumake
    coreutils-full
    gawk
    gnused
    gnutar
    gnugrep
    gnupatch
    gnupg
    procps
    autoconf
    wget
    findutils
    diffutils
    inetutils
    nmap
    man-pages
    man-db
    man-pages-posix

    # cli utils
    moreutils
    eza
    jq
    bat
    fd
    tree
    curl
    ripgrep
    neofetch
    pandoc
    hyperfine
    yazi
    just
    delta
    ghostscript
    imagemagick
    yt-dlp
    poppler-utils
    cloc
    file
    tshark
    httpie
    rclone
    gdu
    qpdf
    ffmpeg
    qemu
    docker
    docker-compose
    gh
    dive
    claude-code
    codex
    gemini-cli
    jujutsu
    zathura
    resvg

    # nix
    nixd
    nixpkgs-fmt

    # rust
    rustup

    # go
    gopls

    # lua
    lua
    lua-language-server
    stylua

    # python
    python3Minimal
    pyright
    basedpyright
    ruff
    uv

    # prolog
    swi-prolog

    # js/ts
    nodePackages.nodejs
    nodePackages.typescript-language-server
    nodePackages.prettier
    nodePackages.pnpm

    # sql/pg
    sqls
    pgformatter

    # docker
    dockerfile-language-server

    # R
    R

    # typos
    typos-lsp

    # typst
    typst
    tinymist
    typstyle

    # latex
    texliveFull

    # lean
    lean4

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.man = {
    enable = true;
    generateCaches = true;
  };

  # TODO: link nvim, kitty, zathura config
  programs.home-manager.enable = true;
  programs.zoxide.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Tommy He";
        email = "tommyhe6@gmail.com";
      };

      core = {
        editor = "nvim";
        pager = "delta";
      };

      credential = { helper = "osxkeychain"; };

      init = { defaultBranch = "master"; };
      pull = { ff = "only"; };
      push = { autoSetupRemote = true; };

      merge = {
        conflictStyle = "zdiff3";
        tool = "nvimdiff";
      };

      diff = {
        algorithm = "histogram";
        tool = "nvimdiff";
      };

      branch = { sort = "committerdate"; };
      tag = { sort = "taggerdate"; };
      log = { date = "iso"; };
    };

    ignores = [
      ".DS_Store"
      "*.pyc"
      "__pycache__/"
      ".venv/"
      "node_modules"
      ".env.*"
      ".env"
      ".direnv/"
    ];
  };


  programs.zsh = {
    enable = true;

    historySubstringSearch = {
      enable = true;
      searchDownKey = "^J";
      searchUpKey = "^K";
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    history = {
      ignoreDups = true;
      expireDuplicatesFirst = true;
      ignoreSpace = false;
      share = false;
      save = 50000;
      size = 10000;
      path = "${homeDirectory}/.config/zsh/.zsh_history";
      extended = true;
    };

    dotDir = "${homeDirectory}/.config/zsh";
    autocd = false;

    # TODO: move some outside like vi mode
    # TODO: fix up virtual env, especially for direnv
    initContent = ''
      # cd history
      setopt AUTO_PUSHD                  # pushes the old directory onto the stack
      setopt PUSHD_MINUS                 # exchange the meanings of '+' and '-'
      setopt CDABLE_VARS                 # expand the expression (allows 'cd -2/tmp')
      autoload -U compinit && compinit   # load + start completion
      zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12' # color history

      # stop ctrl-d closing terminal
      setopt ignore_eof 

      # append history on session close & don't search duplicates
      setopt APPEND_HISTORY
      setopt HIST_FIND_NO_DUPS

      # source secrets
      if [ -f ~/.env ]; then
        export $(cat ~/.env | xargs)
      fi

      # prompt
      # [09/30/24 18:50:53] tommyhe@Un-Macbook:~ 0 0.156 (dev) U

      show_virtual_env() {
        if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
          echo "($(basename $VIRTUAL_ENV)) "
        fi
      }
      PROMPT="$(show_virtual_env)$PROMPT"

      # vcs
      autoload -Uz vcs_info
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:git*' check-for-changes true
      zstyle ':vcs_info:git*' formats "(%b) %u %c"

      # timing
      zmodload zsh/datetime # gives $EPOCHREALTIME
      preexec() { _ts=$EPOCHREALTIME } # start time
      typeset -gF3 _secs=0              # elapsed seconds, always shown with 3 decimals

      precmd() {
        _secs=$(( EPOCHREALTIME - _ts ))   # difference in seconds (float)
        _ts=$EPOCHREALTIME                 # reset start-time for next prompt
        vcs_info                           # update Git/Hg/SVN info, etc.
      }
      setopt prompt_subst

      PROMPT='[%W %*] %F{yellow}%n@%m:%~%f %F{%(?.green.red)}%?%f ''${_secs} ''${vcs_info_msg_0_}
      %F{%(?.green.red)}> %F{white}'

      # PATH
      export PATH="$HOME/bin:$PATH"
    '';
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    historyLimit = 20000;
    keyMode = "vi";
    mouse = true;
    terminal = "screen-256color";
    shell = "$SHELL";
    sensibleOnTop = false;

    extraConfig = ''
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind c new-window      -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"
      bind t new-session
      bind-key r choose-tree -swZ
    '';

    plugins = [
      {
        plugin = pkgs.tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-plugins "time"
          set -g @dracula-show-left-icon session
          set -g @dracula-left-icon-padding 1
          set -g @dracula-border-contrast true
          set -g @dracula-time-format "%m-%d  %H:%M:%S"
          set -g @dracula-refresh-rate 1
        '';
      }
      {
        plugin = pkgs.tmuxPlugins.yank;
        extraConfig = ''
          set -g @yank_action 'copy-pipe'
        '';
      }
    ];
  };

  programs.vim = {
    enable = true;

    extraConfig = ''
      " Set cursor to block in normal mode
      let &t_EI = "\e[2 q"
      " Set cursor to line in insert mode
      let &t_SI = "\e[6 q"

      colorscheme evening

      set nobackup
      set cmdheight=1
      set completeopt=menuone,noselect " for cmp
      set conceallevel=2 " conceal for json/md/tex files
      set fileencoding=utf-8
      set hlsearch " highlight all matches on previous search pattern
      set noignorecase
      set mouse=a " allow the mouse to be used in vim
      set pumheight=10 " pop up menu height
      set showtabline=2 " always show tabs
      set smartcase
      set autoindent
      set smartindent
      set noswapfile
      set termguicolors
      set timeoutlen=1000 " time to wait for a mapped sequence to complete (in milliseconds)
      set ttimeoutlen=5
      set undofile " enable persistent undo
      set updatetime=300 " faster completion (4000ms default)
      set nowritebackup " if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
      set expandtab " convert tabs to spaces
      set shiftwidth=4 " the number of spaces inserted for each indentation
      set tabstop=4 " insert 4 spaces for a tab
      set cursorline " highlight the current line
      set number " set numbered lines
      set relativenumber " set relative numbered lines
      set numberwidth=4 " set number column width to 2 {default 4}
      set signcolumn=yes " always show the sign column, otherwise it would shift the text each time
      set wrap " display lines as one long line
      set scrolloff=3
      set sidescrolloff=3

      set shortmess+=c

      set title
      let &t_ut='''

      au BufNewFile,BufRead *.wgsl setfiletype wgsl

      " window navigation
      nnoremap <silent> <C-h> <C-w>h
      nnoremap <silent> <C-j> <C-w>j
      nnoremap <silent> <C-k> <C-w>k
      nnoremap <silent> <C-l> <C-w>l

      "resize
      nnoremap <silent> <C-Up> :resize +2<CR>
      nnoremap <silent> <C-Down> :resize -2<CR>
      nnoremap <silent> <C-Left> :vertical resize -2<CR>
      nnoremap <silent> <C-Right> :vertical resize +2<CR>
      inoremap <silent> <C-Up> <C-o>:resize +2<CR>
      inoremap <silent> <C-Down> <C-o>:resize -2<CR>
      inoremap <silent> <C-Left> <C-o>:vertical resize -2<CR>
      inoremap <silent> <C-Right> <C-o>:vertical resize +2<CR>

      nnoremap <silent> <C-d> <C-d>zz
      nnoremap <silent> <C-u> <C-u>zz
      nnoremap <silent> n nzzzv
      nnoremap <silent> N Nzzzv

      " stop ctrl c from entering normal mode
      inoremap <C-c> <NOP>

      " noh
      nnoremap gh :noh<CR>

      " CP
      nnoremap <leader>i :vsp %:r.in<CR><C-w>r<CR>
      nnoremap <leader>j :!g++-12 --std=c++17 %:r.cpp && ./a.out < %:r.in<CR>

      command! WQ wq
      command! Wq wq
      command! W w
      command! Q q
    '';
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
      theme_background = true;
      vim_keys = true;
      update_ms = 1000;
      proc_per_core = true;
    };
  };

  programs.fzf = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    matchBlocks."*" = {
      serverAliveInterval = 60; # <-- your value
    };
    extraConfig = ''
# Session Manager
Host i-* mi-*
  ProxyCommand sh -c "aws ssm start-session --target %h --document-name AWS-StartSSHSession --parameters 'portNumber=%p'"
  User ec2-user

# Tufa
Host tufa_bastion
  HostName 31.12.82.146
  User tufa
  IdentityFile ~/.ssh/tufa_compute
  IdentitiesOnly yes

Host tufa
  ForwardAgent yes
  HostName 10.100.0.253
  User tommyhe
  ProxyJump tufa_bastion
  IdentityFile ~/.ssh/tufa_compute
  IdentitiesOnly yes'';
  };
}
