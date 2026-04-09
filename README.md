# arch-pc

A complete Arch Linux desktop configuration managed with Ansible. Deploys a fully customized Wayland/Hyprland desktop with a cohesive **Dreamy Twilight Sky** aesthetic — deep indigo backgrounds, comet cyan accents, and glass-morphism UI elements.

---

## The Rice

**Theme:** Dreamy Twilight Sky / Comet Glass

| Component | Tool |
|-----------|------|
| Window Manager | [Hyprland](https://hyprland.org/) |
| Shell | Zsh + [Powerlevel10k](https://github.com/romkatv/powerlevel10k) |
| Terminal | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| Bar | [Waybar](https://github.com/Alexays/Waybar) + Noctalia |
| Launcher | [Rofi](https://github.com/davatorium/rofi) (comet-glass theme) |
| Notifications | [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) |
| File Manager | Nautilus |
| Lock Screen | Hyprlock |
| Wallpaper | Hyprpaper (auto-rotation every 5 min) |
| Font | JetBrainsMono Nerd Font |

**Color Palette:**

| Role | Color |
|------|-------|
| Background | `#1A1D46` / `#12163A` (deep space indigo) |
| Accent | `#7FE7FF` / `#67E7F7` (comet cyan) |
| Secondary | `#B89CFF` / `#A6B3FF` (lavender) |
| Tertiary | `#8FE3D4` (mint/moonlit green) |
| Text | `#C9D2F7` / `#E8ECFF` |
| Urgent | `#A97A98` (muted mauve) |

Terminal background opacity is `0.88` with blur. Rounded corners and soft edges throughout.

---

## Prerequisites

- Fresh **Arch Linux** install
- Internet connection
- `ansible` installed: `sudo pacman -S ansible`

> This config uses `doas` instead of `sudo`. The playbook will set it up — just make sure `sudo` is available for the initial run.

---

## Setup

**1. Clone the repo**

```bash
git clone <your-repo-url> ~/project/arch-pc
cd ~/project/arch-pc
```

**2. Run the playbook**

```bash
ansible-playbook -i localhost, -c local site.yml --ask-become-pass
```

Enter your password when prompted. The playbook will handle everything from there.

**What it does:**

1. Full system update (`pacman -Syu`)
2. Installs base prerequisites (`base-devel`, `git`, `go`, `doas`, `rsync`)
3. Bootstraps [yay](https://github.com/Jguer/yay) (AUR helper) if not present
4. Configures yay to use `doas`
5. Installs packages from official repos (`pacman.txt`)
6. Installs AUR packages (`yay.txt`)
7. Deploys `.config/` dotfiles and shell configs
8. Configures `doas` (passwordless for user `liam`)
9. Sets up SMB network share (`//10.2.1.177/share` → `/share`)
10. Configures Brave with managed extensions
11. Enables SDDM display manager

**3. Reboot**

```bash
reboot
```

SDDM will start automatically on boot.

---

## Keybindings

| Keybind | Action |
|---------|--------|
| `Super + Return` | Open terminal (Kitty) |
| `Super + Shift + Return` | Drop-down terminal |
| `Super + Q` | Close active window |
| `Super + A` | App launcher (Rofi) |
| `Super + E` | File manager (Nautilus) |
| `Super + W` | Brave browser |
| `Super + S` | Spotify |
| `Super + O` | Obsidian |
| `Super + L` | Lock screen |
| `Super + H` | Keybind cheatsheet |
| `Super + Shift + E` | Exit session |
| `Super + Alt + E` | Emoji picker |
| `Super + Alt + V` | Clipboard manager |
| `Super + 1-9` | Switch workspace |
| `Super + Shift + 1-9` | Move window to workspace |
| `Super + Alt + Scroll` | Zoom in/out |

---

## Structure

```
arch-pc/
├── site.yml          # Ansible playbook
├── pacman.txt        # Official repo package list
├── yay.txt           # AUR package list
├── .zshrc            # Zsh config
├── .p10k.zsh         # Powerlevel10k config
├── wallpapers/       # 12 wallpapers
└── .config/
    ├── hypr/         # Hyprland (WM, keybinds, rules, scripts)
    ├── kitty/        # Terminal + Dreamy Twilight theme
    ├── waybar/       # Status bar
    ├── noctalia/     # Desktop shell with floating bar + plugins
    ├── rofi/         # App launcher (comet-glass theme)
    ├── swaync/       # Notification daemon
    ├── fastfetch/    # System info
    └── gtk-3.0/      # GTK theme settings
```

---

## Customization

**Wallpapers** — drop images into `wallpapers/` and update `~/.config/hypr/hyprpaper.conf`.

**Colors** — edit `~/.config/noctalia/colors.json` and `~/.config/kitty/theme/dreamy-twilight.conf`.

**Packages** — add lines to `pacman.txt` or `yay.txt` and re-run the playbook.

**SMB share** — update the IP/path in `site.yml` under the `mount` tasks.

---

## Notes

- Designed for user `liam` — change the `ansible_user` variable in `site.yml` if deploying elsewhere.
- Uses `doas` (OpenDoas) for privilege escalation after setup. Sudo is only needed for the initial playbook run.
- SMB credentials are stored at `/etc/samba/share-credentials` (mode `0600`).
