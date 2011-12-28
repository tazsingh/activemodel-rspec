require 'active_model'

class Example
  include ActiveModel::Validations

  attr_accessor :title, :counter, :type, :hexidecimal_color

  validates :title, :presence => true
  validates :counter, :numericality => { :only_integer => true }
  validates :type, :inclusion => { :in => [true, false] }
  validates :hexidecimal_color, :format => { :with => /^([a-f]|[A-F]|[0-9]){6}$/ }
end
