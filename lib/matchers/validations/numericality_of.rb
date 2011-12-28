module ActiveModelMatchers
  module Validations
    class ValidatesNumericalityOf < HaveValidationMatcher
      def initialize(field)
        super(field, :numericality)
      end

      def only_integer
        @only_integer = true
        self
      end

      def matches?(actual)
        result = nil

        # Short circuit if the field does not have a numericality validator
        return false unless result = super(actual)

        if @only_integer.present?

          only_allow_integers = @only_integer == @validator.options[:only_integer]

          if only_allow_integers == true
            @positive_result_message = "#{@positive_result_message} to only allow integers"
          else
            @negative_result_message = "#{@negative_result_message} not to only allow integers"
            result = false
          end

        end

        result
      end

      def description
        options_desc = []
        options_desc << " to only allow integers" if @allowed_values
        super << options_desc.to_sentence
      end

    end

    def validate_numericality_of(field)
      ValidatesNumericalityOf.new(field)
    end
  end
end