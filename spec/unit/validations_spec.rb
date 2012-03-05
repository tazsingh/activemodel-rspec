require 'spec_helper'

describe 'Validations' do
  describe Example do
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:counter).only_integer }
    it { should validate_inclusion_of(:type).in(true, false) }
    it { should validate_format_of(:hexidecimal_color).with(/^([a-f]|[A-F]|[0-9]){6}$/) }
    it { should validate_presence_of(:socks).if(:shoes?) }
    it { should validate_presence_of(:shoes).unless(:no_pants?) }
    it { should validate_numericality_of(:counter_2).greater_than_or_equal_to(0) }
  end
end
