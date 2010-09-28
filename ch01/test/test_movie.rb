require 'test_helper'

class MovieTest < Test::Unit::TestCase
  def setup
    @movie = Movie.new('Gone With The Wind', RegularPrice.new)
  end
  def test_new_movie
    assert_equal 'Gone With The Wind', @movie.title
  end
  def test_charge
    assert_equal 2, @movie.charge(1)
    assert_equal 6.5, @movie.charge(5)
    assert_equal 6, Movie.new('Brand New Movie', NewReleasePrice.new).charge(2)
    assert_equal 1.5, Movie.new('Lion King', ChildrensPrice.new).charge(2)
    assert_equal 3, Movie.new('Snow White', ChildrensPrice.new).charge(4)
  end
  def test_frequent_renter_points
    assert_equal 1, @movie.frequent_renter_points(1)
    assert_equal 2, Movie.new('Brand New Movie', NewReleasePrice.new).frequent_renter_points(2)
  end
end
