# MTranslator

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/m_translator`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'm_translator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install m_translator

## Usage

  ``` ruby
    g = MTranslator::Google.new("en","zh-CN","Hello, Who are you")
    g.translator
    y = MTranslator::Youdao.new("zh-CHS","en","你是谁")
    y.translator
    b = MTranslator::Baidu.new('zh','en','你好,我的世界')
    b.translator
    s = MTranslator::Sogou.new("zh-CHS","en","你好")
    s.translator
  ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/m_translator.

## Special thanks

https://github.com/hujingshuang/MTrans

