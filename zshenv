export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export LANG="${LANG:-en_US.UTF-8}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export ZDOTDIR=$HOME/.config/zsh
export ZHOMEDIR=$HOME/.config/zsh
export ZRCDIR=$ZHOMEDIR/rc
export ZDATADIR=$XDG_DATA_HOME/zsh
export ZCACHEDIR=$XDG_CACHE_HOME/zsh
export ZSH_CACHE_DIR=$ZCACHEDIR

setopt NO_GLOBAL_RCS

typeset -fuz zkbd
typeset -U path PATH manpath sudo_path
typeset -xT SUDO_PATH sudo_path

path=(
	/opt/homebrew/opt/mariadb@10.6/bin(N-/)
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	~/bin(N-/)
	~/.pyenv/shims(N-/)
	$path
)
export PATH

fpath=(
	/usr/local/share/zsh-completions(N-/)
	/opt/homebrew/share/zsh-completions(N-/)
	~/.dotfiles/zsh-completions/src(N-/)
	$fpath
)
export FPATH

if SHELL=$(builtin command -v zsh); then
	export SHELL
else
	unset SHELL
fi

if builtin command -v nvim > /dev/null 2>&1; then
	export EDITOR=${EDITOR:-nvim}
else
	export EDITOR=${EDITOR:-vim}
fi
