module ActiveModelMatchers
  module Validations
    class ValidatesInclusionOfMatcher < HaveValidationMatcher
      def initialize(field)
        super(field, :inclusion)
      end

      def in(*values)
        @allowed_values = values
        self
      end

      def matches?(actual)
        result = nil

        # Short circuit if the field does not have an inclusion validator
        return false unless result = super(actual)

        unless @allowed_values.empty?

          not_allowed_values = @allowed_values - @validator.options[:in]

          if not_allowed_values.empty?
            @positive_result_message = "#{@positive_result_message} allowing the following values #{@allowed_values.inspect}"
          else
            @negative_result_message = "#{@negative_result_message} not allowing the following values #{not_allowed_values.inspect}"
            result = false
          end

        end

        result
      end

      def description
        options_desc = []
        options_desc << " allowing the following values: #{@allowed_values.inspect}" if @allowed_values
        super << options_desc.to_sentence
      end

    end

    def validate_inclusion_of(field)
      ValidatesInclusionOfMatcher.new(field)
    end
  end
end