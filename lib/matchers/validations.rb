module ActiveModelMatchers
  module Validations

    class HaveValidationMatcher
      def initialize(field, validation_type)
        @field = field.to_s
        @type  = validation_type.to_s
      end

      def message(message)
        @message = message
        self
      end

      def matches?(actual)
        @klass = actual.is_a?(Class) ? actual : actual.class
        @validator = @klass.validators_on(@field).detect { |validator| validator.kind.to_s == @type }

        if @validator.present?
          @positive_result_message = "#{@type} validator on #{@field}"
        else
          @negative_result_message = "no #{@type} validator on #{@field}"
          return false
        end

        if @message.present?
          if @message == @validator.options[:message]
            @positive_result_message = "with message #{@message}"
          else
            @negative_result_message = "without message #{@message}"
            return false
          end
        end

        true
      end

      def failure_message_for_should
        "Expected #{@klass.inspect} to #{description}; instead got #{@negative_result_message}"
      end

      def failure_message_for_should_not
        "Expected #{@klass.inspect} to not #{description}; instead got #{@positive_result_message}"
      end

      def description
        "validate #{@type} of #{@field}"
      end
    end

  end
end