module ActiveModelMatchers
  module Validations
    def validate_presence_of(field)
      HaveValidationMatcher.new(field, :presence)
    end
  end
end
