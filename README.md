| *[Makers Academy]* | Week 9/10 |
| ------------------ | --------- |

Y(h)elp!
========

####Overview

A clone of the popular services locator [Yelp](http://www.yelp.co.uk/), created
as a part of the intensive weeks 9 & 10 [Rails] part of the course at [Makers
Academy]. We not only learned to find our way around a Rails project, we also
applied more of the [JavaScript] we learned in order to create [Ajax] calls.

####User experience

A user can log in and out - using Facebook to authenticate if they so wish.
Restaurants can be added to the database, along with an associated photograph.
Reviews may be added, and may be endorsed by other users.

####Technologies used

+ Production
  + [Ajax]
  + [CSS]
  + [devise]
  + [Haml]
  + [HTML]
  + [JavaScript]
  + [jQuery]
  + [OmniAuth]
  + [paperclip]
  + [PostgreSQL]
  + [Rails]
  + [Ruby]
  + [Sinatra]

+ Testing
  + [Capybara]
  + [Database cleaner]
  + [RSpec]
  + [Timecop]

####Installation

First clone the repo:
```shell
$ git clone git@github.com:gypsydave5/yelp_clone.git
```

Change into the directory:
```shell
$ cd yelp_clone
```

Run Bundler to load the required gems (you will need an installation of [Ruby] 2.1.0 and the [Bundler] gem )
```shell
$ bundle install
```

You will need a local version of [PostgreSQL], along with a test and a development
database:

```shell
$ bin/rake db:create
$ bin/rake db:create RAILS_ENV=test
```

Migrate the required tables:
```shell
$ bin/rake db:migrate
```
Then run the server:

```shell
$ bin/rails s
```

Send your browser to `http://0.0.0.0:3000` to use the app.

####Testing

Run [RSpec] to see the tests run:
```shell
$ rspec
```

####To do

- The front end is entirely unstyled;

#### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[Ajax]: http://en.wikipedia.org/wiki/Ajax_(programming)
[bcrypt]: https://github.com/codahale/bcrypt-ruby
[Bookmark Manager]: https://github.com/gypsydave5/bookmark-manager
[Bundler]: http://bundler.io/
[Capybara]: http://jnicklas.github.io/capybara/
[CSS]: https://developer.mozilla.org/en-US/docs/Web/CSS
[Cucumber]: http://cukes.info/
[Data Mapper]: http://datamapper.org/
[Database cleaner]: https://github.com/DatabaseCleaner/database_cleaner
[devise]: https://github.com/plataformatec/devise
[dotenv]: https://github.com/bkeepers/dotenv
[ERB]: http://www.stuartellis.eu/articles/erb/#other-resources
[Haml]: http://haml.info/
[HTML]: https://developer.mozilla.org/en-US/docs/Web/HTML
[JavaScript]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[jQuery]: http://jquery.com/
[Mailgun]: https://github.com/bkeepers/dotenv
[Makers Academy]: http://www.makersacademy.com
[OmniAuth]: https://github.com/intridea/omniauth
[paperclip]: https://github.com/thoughtbot/paperclip
[PostgreSQL]: http://www.postgresql.org/
[rack flash]: https://github.com/nakajima/rack-flash
[Rails]: http://rubyonrails.org/
[RSpec]: http://rspec.info/
[Ruby]: https://www.ruby-lang.org/en/
[Sinatra]: http://www.sinatrarb.com/
[Timecop]: https://github.com/travisjeffery/timecop
[Yo]: http://www.justyo.co/
