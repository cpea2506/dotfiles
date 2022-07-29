# Dotfiles

Here is my [dotfiles][dotfile_explain] for setting up my future mac. This project is managing mainly using [dotbare][dotbare_repo].

## So

### How to get these?

I love when I'm at `~ ($HOME)`

- Install dotbare
```bash
git clone --depth=1 https://github.com/kazhala/dotbare ~/.config/zsh/zsh_plugins/dotbare
```
- Setup dotfiles
```bash
~/.config/zsh/zsh_plugins/dotbare/dotbare finit -u https://github.com/cpea2506/dotfiles.git
```

### Related
- [Brewfile](https://github.com/cpea2506/Brewfile)
- Fonts
   - [SFMono Nerd Font](https://github.com/epk/SF-Mono-Nerd-Font) (install via Brew)
   - [Liga SFMono Nerd Font](https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized)
- [Lunarvim](https://github.com/cpea2506/lvim)
   
## Todo

- [ ] Create install script
   
[//]: # (References)
[dotfile_explain]: https://www.freecodecamp.org/news/dotfiles-what-is-a-dot-file-and-how-to-create-it-in-mac-and-linux/
[dotbare_repo]: https://github.com/kazhala/dotbare
