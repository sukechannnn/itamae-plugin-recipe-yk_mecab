# download and install mecab
execute "wget http://mecab.googlecode.com/files/mecab-0.994.tar.gz" do
  not_if 'ls | grep mecab-0.994.tar.gz'
end

execute "tar zxvf mecab-0.994.tar.gz" do
  not_if 'ls | grep mecab-0.994$'
end

execute "cd mecab-0.994; sudo ./configure --enable-utf8-only; make; sudo make install"

# install dictionary
execute "wget http://mecab.googlecode.com/files/mecab-ipadic-2.7.0-20070801.tar.gz" do
  not_if 'ls | mecab-ipadic-2.7.0-20070801.tar.gz'
end

execute "tar zxvf mecab-ipadic-2.7.0-20070801.tar.gz" do
  not_if 'ls | grep mecab-ipadic-2.7.0-20070801$'
end

execute "cd mecab-ipadic-2.7.0-20070801; sudo ./configure --with-mecab-config=/usr/local/bin/mecab-config --with-charset=utf8"
execute "cd mecab-ipadic-2.7.0-20070801; make; sudo make install"
