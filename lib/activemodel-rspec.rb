$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'matchers/validations'
require 'matchers/validations/format_of'
require 'matchers/validations/inclusion_of'
require 'matchers/validations/numericality_of'
require 'matchers/validations/presence_of'

module ActiveModelMatchers
  include ActiveModelMatchers::Validations
end
