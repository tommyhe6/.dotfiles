{ config, pkgs, ... }:

let homeDirectory = "/Users/tommyhe"; in
{
  home = {
    username = "tommyhe";
    homeDirectory = homeDirectory;
    stateVersion = "23.05";
  };

  home.packages = with pkgs; [
    # posix utils
    gnumake
    coreutils-full
    gawk
    gnused
    gnutar
    gnugrep
    findutils
    diffutils

    # cli utils
    fzf
    eza
    tmux
    jq
    bat
    tree
    wget
    curl
    tldr
    neofetch
    pandoc
    ncdu
    ripgrep
    # dive TODO: look into
    # ngrok TODO: unfree

    # dev
    just
    cmake
    tmux
    qemu
    postgresql
    colima
    docker
    docker-compose

    # ops
    zathura

    # requests
    httpie
    websocat

    # nix
    nixd
    nixpkgs-fmt

    # go
    go
    gopls

    # rust
    rustup

    # lua
    lua
    lua-language-server
    stylua

    # python
    python3Full
    poetry
    nodePackages.pyright
    isort
    black

    # js/ts
    nodePackages.nodejs
    typescript
    yarn
    nodePackages.pnpm
    nodePackages.typescript-language-server

    # c/c++
    # gcc13 # symlink join to have both gcc and clang?
    # gdb # configure rosetta to work somehow
    clang
    clang-tools

    # latex
    texlive.combined.scheme-medium



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

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      DBUS_SESSION_BUS_ADDRESS = "unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"; # vimtex

    };

    shellAliases = {
      l = "eza --git --icons --long";
      la = "eza --git --icons --long --all";
      ll = "eza --git --icons";
      g = "git";
      dots = "git --git-dir=/Users/tommyhe/.dotfiles/ --work-tree=/Users/tommyhe $argv";
    };
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
    userName = "Tommy He";
    userEmail = "tommyhe6@gmail.com";
    extraConfig = {
      core = {
        editor = "nvim";
      };
      credential = {
        helper = "osxkeychain";
      };
    };
    ignores = [
      ".DS_Store"
      "*.pyc"
      "__pycache__/"
      ".venv/"
      "node_modules"
      ".env*"
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
    enableAutosuggestions = true;
    defaultKeymap = "viins";

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

    dotDir = ".config/zsh";
    autocd = false;

    # TODO: move some outside like vi mode
    # TODO: fix up virtual env, especially for direnv
    initExtra = ''
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
        source ~/.env
      fi
      
      # vi mode
      bindkey -v
      KEYTIMEOUT=1

      # make backspace work after insert -> normal -> insert
      bindkey "^?" backward-delete-char

      cursor_mode() {
          # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
          cursor_block='\e[2 q'
          cursor_beam='\e[6 q'

          function zle-keymap-select {
              if [[ ''${KEYMAP} == vicmd ]] ||
                  [[ $1 = 'block' ]]; then
                  echo -ne $cursor_block
              elif [[ ''${KEYMAP} == main ]] ||
                  [[ ''${KEYMAP} == viins ]] ||
                  [[ ''${KEYMAP} = ''' ]] ||
                  [[ $1 = 'beam' ]]; then
                  echo -ne $cursor_beam
              fi
          }

          zle-line-init() {
              echo -ne $cursor_beam
          }

          zle -N zle-keymap-select
          zle -N zle-line-init
      }

      cursor_mode

      # prompt

      PROMPT='[%W %*] %F{yellow}%n@%m:%~%f %F{%(?.green.red)}%?%f
      %F{%(?.green.red)}> %F{white}'

      setopt PROMPT_SUBST
      show_virtual_env() {
        if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
          echo "($(basename $VIRTUAL_ENV)) "
        fi
      }
      PROMPT="$(show_virtual_env)$PROMPT"
    '';
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    historyLimit = 10000;
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

      set -g status-interval 3

      # status line
      set -g status-bg black
      set -g status-justify left
      set -g status-left-length '100'
      set -g status-right-length '100'
      set -g message-style fg='colour222',bg='colour238'
      set -g message-command-style fg='colour222',bg='colour238'
      set -g pane-border-style fg='colour238'
      set -g pane-active-border-style fg='colour154'
      setw -g window-status-activity-style fg='colour154',bg='colour235',none
      setw -g window-status-separator '''
      setw -g window-status-style fg='colour121',bg='colour235',none
      set -g status-left '#[fg=colour232,bg=colour154] #S #[fg=colour154,bg=colour238,nobold,nounderscore,noitalics]'
      set -g status-right '#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[fg=colour121,bg=colour235] #(whoami)@#H   %m-%d  %H:%M:%S'
      setw -g window-status-format '#[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]#[default] #I  #W #[fg=colour235,bg=colour235,nobold,nounderscore,noitalics]'
      setw -g window-status-current-format '#[fg=colour222,bg=colour238] #I  #W  #F'
    '';
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
      proc_tree = true;
    };
  };
}
