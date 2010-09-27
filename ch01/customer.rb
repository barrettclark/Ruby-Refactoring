class Customer
  attr_reader :name
  
  def initialize(name)
    @name = name
    @rentals = []
  end
  
  def add_rental(arg)
    @rentals << arg
  end
  
  def statement
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      # show figures for this rental
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end
    
    # add footer lines
    result += "Amount owed is #{total_charge}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
  
  def amount_for(rental)
    rental.charge
  end
  
  private
  
  def frequent_renter_points
    @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end
  def total_charge
    # result = 0
    # @rentals.each { |element| result += element.charge }
    # result
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end
end
