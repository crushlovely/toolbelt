# Toolbelt for Ruby

[![Build Status](http://img.shields.io/travis/crushlovely/toolbelt.svg?style=flat)](https://travis-ci.org/crushlovely/toolbelt)
[![Code Climate](http://img.shields.io/codeclimate/github/crushlovely/toolbelt.svg?style=flat)](https://codeclimate.com/github/crushlovely/toolbelt)
[![Code Coverage](http://img.shields.io/codeclimate/coverage/github/crushlovely/toolbelt.svg?style=flat)](https://codeclimate.com/github/crushlovely/toolbelt)

A collection of POROs to use in your applications.

## Why?

The objects contained within this library represent the most common types of objects used in our Ruby and Rails applications. They exist to keep models and controllers thin and make our domain logic easy to test. Additionally, including these base objects in a library makes re-use clean and simple, eliminating a lot of the boilerplate/duplicate that has historically existed in our applications.

## What's Included?

There are several kinds of objects included in this library. They include:

* Service
* Policy

## Installation

`gem install toolbelt`

or in your `Gemfile`

```ruby
gem 'toolbelt'
```

## Usage

Make sure you require the library.

```ruby
require 'toolbelt'
```

### Service Objects

Service objects should be used any time you want to abstract an operating that _does_ something. That something can be a write to the database, sending of email, retrieval of data from an API, etc. These objects accept a hash of options and only require that you implement a single method, `#call`. The class method `.call` exists as a convenience so you can write `MyService.call` instead of `MyService.new.call`.

``` ruby
class CreateWidgetService < Toolbelt::Service
  def call
    widget = Widget.new(:name => options.name)
    if widget.save
      AdminMailer.new_widget_notification.deliver
    else
      AdminMailer.widget_creation_error_notification.deliver
    end
  end
end

CreateWidgetService.call(:name => 'FooBar')
```

### Policy Objects

Policy objects exist to encapsulate business logic that needs to be verified within your application. These objects accept a hash of options and only require that you implement a single method `#pass?`. For scenarios when you want to ask the policy if it's failing, a `#fail?` method exists which simply returns the inverse of `#pass?`.  There are corresponding class methods `.pass?` and `.fail?` for your convenience as well.

``` ruby
class ValidWidgetPolicy < Toolbelt::Service
  def call
    Widget.new(options).valid?
  end
end

ValidWidgetPolicy.pass?(:name => 'FooBar')
# => true
ValidWidgetPolicy.fail?(:name => 'FooBar')
# => false
```

## Credit

Many of the concepts this library uses are beautifully explained in the following articles:

* [@brynary's](https://twitter.com/brynary) post ["7 Patterns to Refactor Fat ActiveRecord Models"](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/).
* [@createbang's](https://twitter.com/createbang) series of articles ["7 Patterns to Refactor JavaScript Applications"](http://journal.crushlovely.com/post/88286828068/7-patterns-to-refactor-javascript-applications-value)

## Contributing to toolbelt

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so we don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so we can cherry-pick around it.

## Copyright

Copyright (c) 2014 PJ Kelly (Crush & Lovely). See LICENSE for further details.
