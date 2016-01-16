# Nimbo X Ruby Gem

A Ruby wrapper for the Nimbo X API.

You should access the Nimbo X API documentation in order to learn more
about the request/response parameters for each endpoint.

## Installation

```ruby
$ gem install nimbox_ruby
```

## API Usage Examples

You will need to get an app_id, app_secret and access token in order to make
authenticated requests.

```ruby
# initializing the client
client = Nimbox::Client.new(client_id: <redacted>, client_secret: <redacted>,
  access_token: <redacted>)
```

### People

Create a person.

```ruby
attributes = { first_name: 'John', last_name: 'Doe' }
response = client.people.create!(attributes)
response['person'].inspect
```

Update a person.

```ruby
client.people('1').update!(first_name: 'Foo')
```

Retrieve a person.

```ruby
client.people!('1')
```

### Consultations

Create a consultation.

```ruby
attributes = { cause: 'John', person_id: 1 }
response = client.consultations.create!(attributes)
response['consultation'].inspect
```

Update a consultation.

```ruby
client.consultations('1').update!(cause: 'Foo')
```

Retrieve a consultation.

```ruby
client.consultations!('1')
```

Finish a consultation.

```ruby
client.consultations.finish('1')
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
