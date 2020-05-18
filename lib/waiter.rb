# frozen_string_literal: true

class Waiter
  attr_reader :name, :experience
  @@all = []

  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new self, customer, total, tip
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
    meals.reduce do |best_tipped_meal, meal|
      if meal.tip > best_tipped_meal.tip
        meal
      else
        best_tipped_meal
      end
    end.customer
  end
end
