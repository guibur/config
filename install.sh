ln -s $HOME/Private/config/nvim_configs/nvim $HOME/.config

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

lesskey lesskey_description
