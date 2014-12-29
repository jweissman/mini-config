require 'spec_helper'
require 'simple/config'

describe Simple::Config do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end

  it "should be configurable" do
    Simple::Config.configure do |b| 
      b.foo = "bar"  
      b.baz = OpenStruct.new(quux: 'ilex')
    end

    expect(Simple::Config.config.foo).to eql("bar")
    expect(Simple::Config.config.baz.quux).to eql("ilex")
  end
end

module ExampleNamespace
  include Simple::Config
end

describe ExampleNamespace do
  it 'should be configurable' do
    ExampleNamespace.config.bar = 'baz'
    expect(ExampleNamespace.config.bar).to eql('baz')
  end

  it 'should be configurable with extended syntax' do
    ExampleNamespace.configure do |en|
      en.quux = 'flick'

      en.x = OpenStruct.new
      en.x.dx = 4
    end
    
    expect(ExampleNamespace.config.quux).to eql('flick')
    expect(ExampleNamespace.config.x.dx).to eql(4)
  end
end
