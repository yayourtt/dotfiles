#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d%H%M%S)"

link() {
    local src="$1" dest="$2"
    mkdir -p "$(dirname "$dest")"
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        # Keep the path relative to $HOME so same-named files don't overwrite each other
        local backup="$BACKUP_DIR/${dest#"$HOME"/}"
        mkdir -p "$(dirname "$backup")"
        mv "$dest" "$backup"
        echo "Backed up existing $dest to $backup"
    fi
    ln -sfn "$src" "$dest"
    echo "Linked $dest -> $src"
}

link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
link "$DOTFILES_DIR/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
link "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
# Hyprland desktop
link "$DOTFILES_DIR/.config/hypr" "$HOME/.config/hypr"
link "$DOTFILES_DIR/.config/waybar" "$HOME/.config/waybar"
link "$DOTFILES_DIR/.config/rofi" "$HOME/.config/rofi"
link "$DOTFILES_DIR/.config/kitty" "$HOME/.config/kitty"
link "$DOTFILES_DIR/.config/fastfetch" "$HOME/.config/fastfetch"
link "$DOTFILES_DIR/.config/swaync" "$HOME/.config/swaync"

if [ ! -e "$HOME/.gitconfig.local" ]; then
    cp "$DOTFILES_DIR/gitconfig.local.example" "$HOME/.gitconfig.local"
    echo "Created $HOME/.gitconfig.local from template - edit it with your name/email."
fi

mkdir -p "$HOME/.local/bin"
for script in "$DOTFILES_DIR"/scripts/*; do
    chmod +x "$script"
    link "$script" "$HOME/.local/bin/$(basename "$script")"
done

echo "Dotfiles installed successfully."
