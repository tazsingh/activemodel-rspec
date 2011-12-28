module ActiveModelMatchers
  module Validations
    class ValidatesFormatOfMatcher < HaveValidationMatcher
      def initialize(field)
        super(field, :format)
      end

      def with(regex)
        @allowed_regex = regex
        self
      end

      def matches?(actual)
        result = nil

        # Short circuit if the field does not have a format validator
        return false unless result = super(actual)

        unless @allowed_regex.blank?

          if @allowed_regex == @validator.options[:with]
            @positive_result_message = "#{@positive_result_message} allowing #{@allowed_regex.inspect}"
          else
            @negative_result_message = "#{@negative_result_message} not allowing #{@allowed_regex.inspect}"
            result = false
          end

        end

        result
      end

      def description
        options_desc = []
        options_desc << " allowing the following regex: #{@allowed_regex.inspect}" if @allowed_regex
        super << options_desc.to_sentence
      end

    end

    def validate_format_of(field)
      ValidatesFormatOfMatcher.new(field)
    end
  end
end