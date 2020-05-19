class Meal
    attr_reader :waiter, :customer, :total, :tip
    @@all = []

    def initialize waiter, customer, total, tip
        @waiter = waiter
        @customer = customer
        @tip = tip
        @total = total

        @@all << self
    end

    def self.all
        @@all
    end
end