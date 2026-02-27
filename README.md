# dotfiles

Managed with chezmoi.

## Bootstrap

```bash
brew install chezmoi
chezmoi init --apply git@github.com:YOURUSER/dotfiles.git
```

## Manages

- ~/.zshrc
- ~/.gitconfig
- ~/.tool-versions (mise)
- VS Code user settings
- macOS defaults (run once)
- Brew packages (via Brewfile hook)
- SSH config (GitHub via 1Password agent)

## SSH Setup (GitHub + 1Password)

Private SSH keys are stored in 1Password.
No private keys are committed to this repo.

This setup uses:

- 1Password SSH agent for signing
- A stable symlink at `~/.1password/agent.sock`
- A tracked public key at `~/.ssh/1p.pub`
- A pinned GitHub identity in `~/.ssh/config`

### Requirements

- 1Password installed
- Settings → Developer → **Use the SSH agent** enabled

### First-time setup

1. Authorize SSH usage when prompted:

   ---
   ssh -T git@github.com
   ---

2. If the public key needs refreshing:

   ---
   SSH_AUTH_SOCK=~/.1password/agent.sock ssh-add -L > ~/.ssh/1p.pub
   chmod 600 ~/.ssh/1p.pub
   ---

3. Ensure the key exists on GitHub:

   ---
   gh ssh-key add ~/.ssh/1p.pub
   ---

### Notes

- The private key never leaves 1Password.
- The public key (`~/.ssh/1p.pub`) is safe to commit.
- The agent socket symlink is created via a chezmoi run hook.
- GitHub is explicitly pinned to this identity to avoid key spray.

## After apply

```bash
mise install
```

Manual:

- Enable 1Password SSH agent
- Grant macOS Accessibility permissions