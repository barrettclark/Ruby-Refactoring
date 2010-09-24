require 'test/unit'
require '../rental'
require '../movie'

class RentalTest < Test::Unit::TestCase
  def setup
    @movie = Movie.new('Gone With The Wind', Movie::REGULAR)
  end
  def test_new_rental
    rental = Rental.new(@movie, 3)
    assert_equal 'Gone With The Wind', rental.movie.title
    assert_equal 3, rental.days_rented
  end
end
