## Dotfiles
-------

My custom dotfiles, use them at your own risk

These dotfiles are made specially for linux for the moment, the target coder workspace instances

Regarding the configuration, this is more of a Frontend starter kit

In the future i want to configure diffrent developer dotfile kits and docker environments, 

Based on [Myshov Dotfiles](https://github.com/myshov/dotfiles/blob/master/README.md)


## TODO:
-------
1. [x] Improve the installer 
2. [ ] Add aliases for zsh
3. [ ] Add tmux & configure it
4. [ ] Add any missing packages
5. [ ] Reorganize zsh to be more clean
6. [x] Do package manager checks and package checks, to not reinstall them if available
7. [x] Find a way to skip the promps and yes no questions

## Packages
-------
* Core
    * Linuxbrew
        * ag
        * cmake
        * grep
        * httpie
        * python
        * tmux
        * tree
        * neovim
        * volta
* Development
    * Volta
        * Node@latest
        * Npm
    * Npm
        * typescript
        * eslint
        * http-server
        * nodemon
        * @angular/cli
        * next@latest 
        * react@latest 
        * react-dom@latest

## Intstall
-------
- No further instalation method for this as it runs upon image creation for me
- Will add more options in the future 

```bash
sh setup.sh
```

## Additional resources
-------
* [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
* [Homebrew](http://brew.sh/) / [FAQ](https://github.com/Homebrew/homebrew/wiki/FAQ)
* [homebrew-cask](http://caskroom.io/) / [usage](https://github.com/phinze/homebrew-cask/blob/master/USAGE.md)
* [Bash prompt](http://wiki.archlinux.org/index.php/Color_Bash_Prompt)
* [Solarized Color Theme for GNU ls](https://github.com/seebi/dircolors-solarized)
* [dotfiles community](http://dotfiles.github.io/)
