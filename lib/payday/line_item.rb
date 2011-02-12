module Payday
  # Represents a line item in an invoice.
  #
  # quantity and price are written to be pretty picky, primarily because if we're not picky about what values are set to
  # them your invoice math could get pretty messed up. It's recommended that both values be set to BigDecimal values.
  # Otherwise, we'll do our best to convert the set values to a BigDecimal.
  class LineItem
    attr_accessor :description, :quantity, :price
    
    def initialize(options = {})
      @quantity = options[:quantity] || BigDecimal.new("1") 
      @price = options[:price] || BigDecimal.new("0.00")
      self.description = options[:description] || ""
    end
    
    def quantity=(value)
      @quantity = BigDecimal.new(value.to_s)
    end
    
    def price=(value)
      @price = BigDecimal.new(value.to_s)
    end
    
    # Returns the total price for this line item, or price * quantity
    def total
      price * quantity
    end
  end
end