# Itamae::Plugin::Recipe::YkMecab

Itamae plugin to install mecab

mecab version : 0.994

mecab dictionarys
- IPA
- hatena
- wikipedia

## Installation

This gem is required Ruby.

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-yk_mecab'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-yk_mecab

## Usage

### install for system

```rb
# recipe.rb

# Install Docker, start it and ensure it starts on boot.
include_recipe "yk_mecab::install"
```

### node.yml

```yml
# for example

user: 'vagrant'
home_dir: '/home/ec2-user/'
mecab:
  hatena: '1'  # If you need hatena dictionary.
  wikipedia: '' # If you don't need wikipedia dictionary.
```

### command

```sh
$ mecab -u custom.dic
```


## License

[MIT License](http://opensource.org/licenses/MIT).
