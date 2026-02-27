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

## After apply

```bash
mise install
```

Manual:
- Enable 1Password SSH agent
- Grant macOS Accessibility permissions
