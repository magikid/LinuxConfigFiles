LinuxConfigFiles
================

My config files use the rcm utility from thoughtbot.  Here's a link: https://robots.thoughtbot.com/rcm-for-rc-files-in-dotfiles-repos

- [Install rcm](https://github.com/thoughtbot/rcm#installation)
- Run `git clone --recursive https://github.com/magikid/LinuxConfigFiles ~/.dotfiles`
- Create `.rcrc` file with tags to install, hostname, and excludes.
- Dry run with lsrc: `lsrc`
- Update symlinks with rcup: `rcup -v`

