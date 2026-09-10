# Dotfiles

Personal Linux configuration for an Arch / EndeavourOS setup using **Hyprland**, **Zsh**, **Starship**, **Kitty**, **Waybar**, and **Rofi**.

The goal of this repository is to keep my development environment and desktop configuration reproducible.

## Desktop stack

- Hyprland
- Waybar
- Rofi
- Kitty
- Hyprlock
- Hypridle
- Hyprpaper
- SwayNC
- NetworkManager Applet
- Zsh + Oh My Zsh
- Starship
- Fastfetch

The repository also contains my:

- Git configuration
- VS Code settings
- shell aliases
- scripts such as `mkproj`

---

## Installation

### 1. Install the base packages

This configuration is designed primarily for **Arch Linux / EndeavourOS**.

```bash
sudo pacman -Syu
```

Install the main desktop packages:

```bash
sudo pacman -S --needed \
hyprland \
kitty \
waybar \
rofi \
hyprpaper \
hyprlock \
hypridle \
hyprpolkitagent \
swaync \
xdg-desktop-portal-hyprland \
xdg-desktop-portal-gtk \
grim \
slurp \
wl-clipboard \
brightnessctl \
playerctl \
network-manager-applet
```

Install the shell and terminal tools:

```bash
sudo pacman -S --needed \
zsh \
starship \
fastfetch \
eza \
bat \
lazygit \
zsh-autosuggestions \
zsh-syntax-highlighting \
ttf-jetbrains-mono-nerd
```

Useful desktop applications:

```bash
sudo pacman -S --needed \
firefox \
dolphin \
ark \
okular
```

---

## 2. Install Oh My Zsh

If Oh My Zsh is not already installed:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Check that Zsh is your shell:

```bash
echo $SHELL
```

If necessary:

```bash
chsh -s /bin/zsh
```

Log out and back in after changing the default shell.

---

## 3. Clone the dotfiles

```bash
mkdir -p ~/Projects/Perso
cd ~/Projects/Perso
git clone git@github.com:yayourtt/dotfiles.git
cd dotfiles
```

The stable configuration lives on:

```text
main
```

---

## 4. Run the installer

Make the installer executable:

```bash
chmod +x install.sh
```

Then run:

```bash
./install.sh
```

The installer creates symlinks between this repository and the corresponding files in `$HOME`.

For example:

```text
~/.zshrc
    -> ~/Projects/Perso/dotfiles/.zshrc

~/.config/hypr
    -> ~/Projects/Perso/dotfiles/.config/hypr

~/.config/waybar
    -> ~/Projects/Perso/dotfiles/.config/waybar
```

Existing files are backed up before being replaced.

Backups are stored under:

```text
~/.dotfiles_backup/
```

---

## Repository structure

```text
dotfiles/
├── .config/
│   ├── fastfetch/
│   │   └── config.jsonc
│   │
│   ├── hypr/
│   │   ├── hyprland.lua
│   │   ├── hypridle.conf
│   │   ├── hyprlock.conf
│   │   ├── hyprpaper.conf
│   │   └── scripts/
│   │       └── powermenu.sh
│   │
│   ├── kitty/
│   │   └── kitty.conf
│   │
│   ├── rofi/
│   │   └── config.rasi
│   │
│   └── waybar/
│       ├── config.jsonc
│       └── style.css
│
├── scripts/
│   ├── mkproj
│   └── sysupdate
│
├── vscode/
│   └── settings.json
│
├── .zshrc
├── gitconfig
├── gitconfig.local.example
├── install.sh
├── starship.toml
└── README.md
```

---

## Hyprland

The main Hyprland configuration is:

```text
~/.config/hypr/hyprland.lua
```

Because it is symlinked to this repository, editing:

```bash
nano ~/.config/hypr/hyprland.lua
```

also modifies the Git-tracked version.

Check Hyprland configuration errors with:

```bash
hyprctl configerrors
```

Reload Hyprland with:

```bash
hyprctl reload
```

---

## Main keybindings

`Super` refers to the **Windows key**.

| Shortcut | Action |
|---|---|
| `Super + Q` | Open terminal |
| `Super + Space` | Application launcher |
| `Super + B` | Firefox |
| `Super + E` | Dolphin |
| `Super + C` | Clipboard history |
| `Super + N` | Notification center |
| `Super + L` | Lock screen |
| `Super + F` | Fullscreen |
| `Super + Shift + F` | Maximize |
| `Super + Shift + Q` | Close window |
| `Super + Shift + P` | Power menu |
| `Super + 1..5` | Switch workspace |
| `Super + Shift + 1..5` | Move window to workspace |
| `Super + V` | Toggle floating |
| `Super + S` | Toggle scratchpad |
| `Print` | Screenshot selected area |
| `Super + Print` | Screenshot full screen |

---

## Waybar

Configuration:

```text
~/.config/waybar/config.jsonc
```

Styling:

```text
~/.config/waybar/style.css
```

Restart Waybar:

```bash
pkill waybar
waybar >/tmp/waybar.log 2>&1 & disown
```

Check how many Waybar instances are running:

```bash
pgrep -a waybar
```

There should normally only be **one**.

---

## Wi-Fi

The graphical NetworkManager applet is started with:

```bash
nm-applet --indicator
```

A terminal fallback is always available:

```bash
nmtui
```

---

## Lock screen and idle behavior

Lock screen:

```text
~/.config/hypr/hyprlock.conf
```

Idle configuration:

```text
~/.config/hypr/hypridle.conf
```

Manually lock:

```bash
hyprlock
```

Restart Hypridle:

```bash
pkill hypridle
hypridle >/tmp/hypridle.log 2>&1 & disown
```

---

## Wallpaper

Wallpaper configuration:

```text
~/.config/hypr/hyprpaper.conf
```

Restart Hyprpaper:

```bash
pkill hyprpaper
hyprpaper >/tmp/hyprpaper.log 2>&1 & disown
```

Recommended wallpaper directory:

```text
~/Pictures/Wallpapers/
```

Personal wallpaper images are intentionally not required to be stored in this repository.

---

## Custom scripts

Scripts from:

```text
scripts/
```

are linked into:

```text
~/.local/bin/
```

This makes them available directly from the shell.

Example:

```bash
mkproj
```

Find the installed command with:

```bash
command -v mkproj
```

---

## Git identity

The shared Git configuration is stored in:

```text
gitconfig
```

Machine-specific information belongs in:

```text
~/.gitconfig.local
```

If `.gitconfig.local` does not exist, `install.sh` creates it from:

```text
gitconfig.local.example
```

Edit it after installation with your local identity/settings.

---

## Development workflow

`main` represents the **known-good configuration**.

Do not develop experimental changes directly on `main`.

For a new feature:

```bash
git switch main
git pull
git switch -c feature/waybar-update
```

Examples:

```text
feature/audio-osd
feature/waybar-redesign
feature/new-lockscreen

fix/duplicate-waybar
fix/wifi-applet

experiment/new-theme
experiment/animations
```

Once the feature works:

```bash
git add .
git commit -m "feat: improve Waybar"
git push -u origin feature/waybar-update
```

Merge it into stable:

```bash
git switch main
git merge feature/waybar-update
git push
```

Then delete the completed branch:

```bash
git branch -d feature/waybar-update
git push origin --delete feature/waybar-update
```

---

## Updating dotfiles

Because configuration files are symlinked into this repository, normal edits are automatically visible to Git.

Check changes:

```bash
cd ~/Projects/Perso/dotfiles
git status
```

Review:

```bash
git diff
```

Save:

```bash
git add .
git commit -m "chore: update dotfiles"
git push
```

---

## Recovery

If an experimental branch breaks the desktop configuration:

```bash
cd ~/Projects/Perso/dotfiles
git switch main
hyprctl reload
```

Because the live configuration is symlinked to the repository, switching branches can immediately change the running configuration.

Only switch to branches that contain a valid Hyprland configuration while inside a Hyprland session.

If Hyprland becomes unusable, log out and select **KDE Plasma** from the login screen as a fallback environment.

---

## Useful diagnostics

Hyprland:

```bash
hyprctl configerrors
```

Running processes:

```bash
pgrep -a waybar
pgrep -a hypridle
pgrep -a hyprpaper
```

Input devices:

```bash
hyprctl devices
```

USB devices:

```bash
lsusb
```

Network:

```bash
nmtui
```

System information:

```bash
fastfetch
```

---

## Philosophy

Keep `main` boring.

Experiment on branches.

Merge only configurations that are stable enough to use every day.
