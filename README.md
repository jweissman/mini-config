# mini-config

* [Homepage](https://rubygems.org/gems/simple-config)
* [Documentation](http://rubydoc.info/gems/simple-config/frames)
* [Email](mailto:jweissman1986 at gmail.com)

## Description

  A tiny-footprint config management thing for Ruby.

## Features
  
  * OpenStruct-based configuration for Ruby
  * Tiny footprint (~6 loc)

## Examples

    require 'mini/config'

    ExampleNamespace.configure do |en|
      en.quux = 'flick'

      en.x = OpenStruct.new
      en.x.dx = 4
    end
    
    expect(ExampleNamespace.config.quux).to eql('flick')

## Install

    $ gem install simple-config

## Synopsis

    $ simple-config

## Copyright

Copyright (c) 2014 Joseph Weissman

See {file:LICENSE.txt} for details.
