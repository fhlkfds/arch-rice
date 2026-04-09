---
name: Arch PC Ansible playbook structure
description: Ansible playbook for configuring Liam's Arch Linux workstation - uses doas, yay, Hyprland, and SMB shares
type: project
---

Single-playbook project at `/home/liam/project/arch-pc/site.yml` that configures an Arch Linux workstation.

Key details:
- Target user: liam
- Uses opendoas (not sudo) for privilege escalation; doas config written to /etc/doas.conf
- Uses yay as AUR helper, configured to use doas as its sudo binary
- Package lists stored in `pacman.txt` and `yay.txt` (plain text, one package per line)
- Desktop environment: Hyprland (Wayland compositor) with SDDM display manager
- SMB share mounted via systemd automount
- Brave browser with force-installed extensions via managed policy
- Custom packages: noctalia-qs, noctalia-shell (AUR packages, noctalia-shell depends on noctalia-qs)

**Why:** Understanding this structure avoids re-reading the entire playbook in future conversations.
**How to apply:** When debugging playbook issues, check doas config, yay config, and package list files as common failure points.
