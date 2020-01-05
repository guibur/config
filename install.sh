ln -s $HOME/Private/config/nvim_configs/nvim $HOME/.config
pip3 install neovim

cd config_files
for f in *
do
    ln -s $HOME/Private/config/config_files/$f $HOME/.config/$f
done
cd -

cd dot_files
for f in *
do
    ln -s $HOME/Private/config/dot_files/$f $HOME/${f/dot_/.}
done
cd -

cd zshrcs
ln -s $HOME/Private/config/zshrcs/dot_zshrc $HOME/.zshrc
git clone git@github.com:guibur/oh-my-zsh.git $HOME/.oh-my-zsh
cd -

lesskey lesskey_description
