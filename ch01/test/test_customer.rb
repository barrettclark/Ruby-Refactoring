require 'test/unit'
require '../customer'
require '../rental'
require '../movie'

class CustomerTest < Test::Unit::TestCase
  def setup
    @customer = Customer.new('Fred')
  end
  def test_new_customer
    assert_equal 'Fred', @customer.name
  end
  def test_add_rental
    movie = Movie.new('Gone With The Wind', Movie::REGULAR)
    rental = Rental.new(movie, 3)
    @customer.add_rental(rental)
    # NOTE: rentals is not accessible, so we cannot test that
    # assert_equal 1, @customer.rentals.size
    # assert_equal 'Gone With The Wind', @customer.rentals.first.movie.title
  end
  def test_statement
    movie = Movie.new('Gone With The Wind', Movie::REGULAR)
    rental = Rental.new(movie, 3)
    @customer.add_rental(rental)

    movie = Movie.new('Some New Release', Movie::NEW_RELEASE)
    rental = Rental.new(movie, 1)
    @customer.add_rental(rental)

    movie = Movie.new('Cars', Movie::CHILDRENS)
    rental = Rental.new(movie, 5)
    @customer.add_rental(rental)
    
    txt = "Rental Record for Fred\n"
    txt << "\tGone With The Wind\t3.5\n"
    txt << "\tSome New Release\t3\n"
    txt << "\tCars\t4.5\n"
    txt << "Amount owed is 11.0\n"
    txt << "You earned 3 frequent renter points"
    assert_equal txt, @customer.statement
  end
end
