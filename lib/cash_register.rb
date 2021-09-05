require 'pry'

class CashRegister

    attr_accessor :total, :discount, :item_array

    def initialize(discount = 0, total = 0)
        @total = total
        @discount = discount
        @item_array = []
        @price_array = []
        @quantity_array = []
    end

    def add_item(item, price, quantity = 1)
        @total += price*quantity
        add_to_array(@item_array, item, quantity)
        add_to_array(@price_array, price, quantity)
        @quantity_array << quantity
    end

    def add_to_array(array, item, times)
        for i in 1..times
            array << item
        end
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total *= (1 - 0.01*discount)
            "After the discount, the total comes to $#{Integer(@total)}."    
        end
    end

    def items
        @item_array 
    end

    def remove_from_array(array, times)
        for i in 1..times
            array.pop
        end
    end

    def void_last_transaction
        remove_from_array(@item_array, @quantity_array[-1])
        @total -= @price_array[-1]*@quantity_array[-1]
        remove_from_array(@price_array, @quantity_array[-1])
        @quantity_array.pop
    end



end

# binding.pry