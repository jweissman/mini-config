require 'spec_helper'
require 'simple/config'

#configurate
module ExampleNamespace; include Simple::Config end
module AnotherNamespace; include Simple::Config end

describe "simply configuring" do
  it 'should expose an OpenStruct called #config' do
    expect(ExampleNamespace.config).to be_a(OpenStruct)
  end

  it 'should #configure with a block' do
    ExampleNamespace.configure do |en|
      en.quux = 'flick'

      en.x = OpenStruct.new
      en.x.dx = 4
    end
    
    expect(ExampleNamespace.config.quux).to eql('flick')
    expect(ExampleNamespace.config.x.dx).to eql(4)
  end

  it 'should not bleed between namespaces' do
    ExampleNamespace.config.bar = 'baz'
    AnotherNamespace.config.bar = 'foo'
    expect(ExampleNamespace.config.bar).to eql('baz')
    expect(AnotherNamespace.config.bar).to eql('foo')
  end
end
