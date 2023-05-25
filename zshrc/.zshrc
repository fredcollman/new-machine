. $ZDOTDIR/asdf
. $ZDOTDIR/fasd
. $ZDOTDIR/up
. $ZDOTDIR/shell
. $ZDOTDIR/git
. $ZDOTDIR/history
. $ZDOTDIR/prompt
. $ZDOTDIR/direnv
. $ZDOTDIR/node
. $ZDOTDIR/docker-compose
. $ZDOTDIR/brew
. $ZDOTDIR/terraform

if [ -f $ZDOTDIR/local-overrides ]; then
  . $ZDOTDIR/local-overrides
fi

# installed via fzf for vim
# . ~/.fzf.zsh

# TODO: include ~/.config/starship.toml
# eval "$(starship init zsh)"

# run at the end for safety
. $ZDOTDIR/plugins

export DEBUG_SOURCED_ZDOTDIR_ZSHRC="\$ZDOTDIR/.zshrc at $(date -Is)"
