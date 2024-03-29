#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~)"

info "Configuraing zsh..."

find . -name ".*rc" | while read fn; do
    fn=$(basename $fn)
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

substep_info "Linking spaceship prompt to oh-my-zsh..."
symlink ~/Repositories/personal/spaceship-prompt/spaceship.zsh-theme ~/Repositories/personal/ohmyzsh/themes/spaceship.zsh-theme

success "Finished configuring zsh."
