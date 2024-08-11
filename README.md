# dotfiles

## Getting Started

Clone this repository into `~/dotfiles`. Install the dependencies below and run `stow .` in `~/dotfiles`. You may need to comment some lines from `.zshrc` if you aren't using certain software (e.g., `nvm`, `golang`, or `ghcup`). Once the `.zshrc` loads without fail,

- run `sourcetmux` to load tmux plugins,
- press `prefix` + `I` to install tmux plugins,
- and open Neovim (`nvim`) to install Neovim plugins

## Dependencies

- [Homebrew]("https://brew.sh/")
- tmux Plugin Manager `git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm`

### Casks

- Alacritty `brew install alacritty`
- FiraCode Nerd Font `brew install font-fira-code-nerd-font`
- Rectangle `brew install rectangle`
- Raycast `brew install raycast`

### Formulae

- stow `brew install stow`
- zsh `brew install zsh`
- eza `brew install eza`
- ripgrep `brew install ripgrep`
- Neovim `brew install neovim`
- tmux `brew install tmux`
- Starship `brew install starship`
- Nerdfetch `brew install nerdfetch`
- zsh-autosuggestions `brew install zsh-autosuggestions`
