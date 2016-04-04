case node[:platform]
when %r(redhat|fedora)
  package 'gcc-c++'
when %r(debian|ubuntu)
  package 'g++'
end

package 'wget'

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

case node[:platform]
when %r(debian|ubuntu)
  execute "echo /usr/local/lib >> /etc/ld.so.conf"
  execute "sudo ldconfig"
end

execute "cd mecab-ipadic-2.7.0-20070801; sudo ./configure --with-mecab-config=/usr/local/bin/mecab-config --with-charset=utf8"
execute "cd mecab-ipadic-2.7.0-20070801; make; sudo make install"

unless node[:mecab][:hatena].empty?
  case node[:platform]
  when %r(redhat|fedora)
    execute "sudo yum localinstall -y http://mirror.centos.org/centos/6/os/x86_64/Packages/nkf-2.0.8b-6.2.el6.x86_64.rpm"
  when %r(debian|ubuntu)
    execute "sudo apt-get install nkf"
  end
  execute "wget http://d.hatena.ne.jp/images/keyword/keywordlist_furigana.csv" do
    not_if 'ls | grep keywordlist_furigana.csv'
  end
  execute "nkf -w --overwrite keywordlist_furigana.csv"
end

unless node[:mecab][:wikipedia].empty?
  execute "wget http://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz" do
    not_if 'ls | grep jawiki-latest-all-titles-in-ns0'
  end
  execute "gunzip jawiki-latest-all-titles-in-ns0.gz" do
    not_if 'ls | grep jawiki-latest-all-titles-in-ns0$'
  end
end

unless node[:mecab][:wikipedia].empty? && node[:mecab][:hatena].empty?
  remote_file "#{node[:home_dir]}/make_dict.rb" do
    source './files/make_dict.rb'
    mode '755'
  end
  execute "sudo ruby make_dict.rb"
  execute "/usr/local/libexec/mecab/mecab-dict-index -d /usr/local/lib/mecab/dic/ipadic -u custom.dic -f utf-8 -t utf-8 custom.csv"
end
