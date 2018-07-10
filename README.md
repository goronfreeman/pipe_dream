# PipeDream

PipeDream allows you to easily search YouTube by providing a simple wrapper
around YouTube's official APIs. What sets PipeDream apart from other options, is
that it has no dependencies outside the Ruby standard library. This makes it easy
to include in projects where you can't easily bundle dependencies, such as in an
Alfred workflow.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pipe_dream'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pipe_dream

## Usage

Before you begin using PipeDream to perform searches, you will have to configure
it with your developer API key. You can create a new API key using the
[Google Cloud Console](https://console.cloud.google.com/). Once you have created your key, configure PipeDream with
it like this:

```ruby
PipeDream.configure do |config|
  config.api_key = '<your-api-key>'
end
```

Now you can begin searching! Here is a basic example of how you can perform a search:

```ruby
req = PipeDream::Request.new('redlettermedia')
res = PipeDream::Response.new(req.get)
# The items method will return an array of objects that wrap the search results.
items = res.items #=> [#<PipeDream::Result::Channel...]
channel = items.first
channel.title #=> 'RedLetterMedia'
channel.description #=> 'Red Letter Media is responsible for the 70 minute Phantom Menace review as well as Space Cop, Half in the Bag, and Best of the Worst. Full time frauds.'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[goronfreeman]/pipe_dream.
