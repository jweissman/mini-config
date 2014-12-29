require 'ostruct'
require 'simple/config/version'

module Simple::Config
  def configure
    yield config if block_given?
    config
  end

  def config
    @configuration ||= OpenStruct.new
  end
end
