$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'mimimi'


# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}


RSpec.configure do |config|
  
end


module Mimimi
  module Rails
    extend self
    
    def self.env
      :test
    end
    
    def self.root
      File.expand_path(File.join(File.dirname(__FILE__), ".."))
    end
  end
end
