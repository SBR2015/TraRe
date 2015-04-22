### rbenv / ruby install

    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    
    exec $SHELL -l

### ruby-buildをrbenvにinstall

    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

### install 可能なrubyのバージョン一覧表示

    rbenv install --list

### version指定install

    rbenv install 2.1.1

### local version set

    rbenv local 2.1.1

### local version unset
    rbenv local --unset

### global version set

    rbenv global 2.1.1

## その他

### インストールしたrubyやgemのパスを通す

    rbenv rehash

### インストール済みのRuby一覧を見る

    rbenv versions
