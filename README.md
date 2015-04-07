# CFN

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cfn'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cfn

## Usage

### Output

Support for `outputs`, example:

```
output "ChefServerIP" do
  value "10.123.123.123"
  description "IP for newly created Chef server"
end
```

## Contributing

1. Fork it ( https://github.com/Valiev/cfn/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
