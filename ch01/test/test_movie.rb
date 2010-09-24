require 'test/unit'
require '../movie'

class MovieTest < Test::Unit::TestCase
  def test_new_movie
    movie = Movie.new('Gone With The Wind', Movie::REGULAR)
    assert_equal 'Gone With The Wind', movie.title
    assert_equal 0, movie.price_code
  end
end
