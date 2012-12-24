Monday Chen's .vim files
========

Using [homesick](https://github.com/technicalpickles/homesick) to symlink the files.

Usage:

1. `gem install homesick`

2. `homesick clone git://github.com/mondaychen/monday-vim.git`

3. open the repo file (usually `~/.homesick/repos/monday-vim`) and execute `git submodule init && git submodule update`,
because I have a [neobundle.vim](https://github.com/Shougo/neobundle.vim) in the bundle file.

4. `homesick symlink monday-vim`

5. Open vim and type `:NeoBundleInstall`

6. Enjoy!
