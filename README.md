# This plugin is in development

You cannot use this plugin. Please wait a little more.

# Itamae::Plugin::Recipe::YkMecab

Itamae plugin to install mecab

mecab version : 0.994

mecab dictionary
-

## Installation

This gem is required g++, wget and Ruby.

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

home_dir: '/home/vagrant'
```

## License

[MIT License](http://opensource.org/licenses/MIT).
