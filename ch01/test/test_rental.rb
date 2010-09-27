require 'test_helper'

class RentalTest < Test::Unit::TestCase
  def setup
    @movie = Movie.new('Gone With The Wind', Movie::REGULAR)
    @rental = Rental.new(@movie, 3)
  end
  def test_new_rental
    assert_equal 'Gone With The Wind', @rental.movie.title
    assert_equal 3, @rental.days_rented
  end
  def test_charge
    assert_equal 3.5, @rental.charge

    rental = Rental.new(@movie, 1)
    assert_equal 2, rental.charge
    
    new_release_movie = Movie.new('New Hotness', Movie::NEW_RELEASE)
    rental = Rental.new(new_release_movie, 2)
    assert_equal 6, rental.charge
    
    kid_movie = Movie.new('Bambi', Movie::CHILDRENS)
    rental = Rental.new(kid_movie, 3)
    assert_equal 1.5, rental.charge
    rental = Rental.new(kid_movie, 5)
    assert_equal 4.5, rental.charge
  end
end
