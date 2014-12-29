require 'ostruct'
require 'simple/config/version'

module Simple::Config
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    def configure
      yield config if block_given?
      config
    end

    def config
      @_configuration ||= OpenStruct.new
    end
  end

  extend(ClassMethods)
end
