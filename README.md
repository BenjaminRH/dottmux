# tmux
My tmux configuration.


## Install
Open a terminal and run the following:

    cd ~
    git clone --recursive https://github.com/BenjaminRH/dottmux.git .tmux
    ln -s .tmux/tmux.conf .tmux.conf


## Plugins
A list of plugins used.

 * [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - Automatic periodic session saving
 * [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat) - Search terminal history, supports regex
 * [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - Restore tmux sessions after reboot


## Manage plugins
All plugins are git submodules, managed manually. With a small number of plugins, Tmux Plugin Manager seems like overkill, plus this is better for offline plugin management.

### Add plugin

    git submodule add git@github.com:user/tmux-plugin.git plugins/tmux-plugin

### Remove plugin
If the submodule has been initialized:

    git submodule deinit -f plugins/tmux-plugin
    rm -rf .git/modules/plugins/tmux-plugin

Remove the submodule:

    git rm -f plugins/tmux-plugin

Remove the entry from the .gitmodules file, then commit it:

    sed -i -e '/submodule "plugins\/tmux-plugin"/,+2d' .gitmodules
    git add .gitmodules
    git commit -m "Removed tmux-plugin"
