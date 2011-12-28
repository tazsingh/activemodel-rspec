$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
MODELS = File.join(File.dirname(__FILE__), "models")
$LOAD_PATH.unshift(MODELS)

require "rubygems"
require "bundler"
Bundler.setup

require 'rspec'
require 'rspec/core'
require 'rspec/expectations'

Dir[ File.join(MODELS, "*.rb") ].sort.each { |file| require File.basename(file) }

require 'activemodel-rspec'

RSpec.configure do |config|
  config.include ActiveModelMatchers
  config.mock_with :rspec
end
