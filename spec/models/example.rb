require 'active_model'

class Example
  include ActiveModel::Validations

  attr_accessor :title, :counter, :type, :hexidecimal_color, :shoes, :socks, :pants

  validates :title, :presence => true
  validates :counter, :numericality => { :only_integer => true }
  validates :counter_2, :numericality => { :greater_than_or_equal_to => 0 }
  validates :type, :inclusion => { :in => [true, false] }
  validates :hexidecimal_color, :format => { :with => /^([a-f]|[A-F]|[0-9]){6}$/ }

  validates :socks, :presence => true, :if => :shoes?

  validates :shoes, :presence => true, :unless => :no_pants?

  def shoes?
    shoes == true
  end

  def no_pants?
    pants == false
  end
end
