class CashRegister

    attr_accessor :total, :discount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @checkout = []
        @reciept = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @reciept << price * quantity
        while(quantity != 0)
            @checkout << title
            quantity -= 1
        end
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        end
        @total = (@total/100) * (100 - discount)
        return "After the discount, the total comes to $#{@total}."
    end

    def items
        @checkout
    end

    def void_last_transaction
        @total -= @reciept[-1]
        @reciept.pop
    end


end