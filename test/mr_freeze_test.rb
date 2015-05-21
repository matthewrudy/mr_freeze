require 'test_helper'
require 'mr_freeze'

class MrFreezeTest < Test::Unit::TestCase
  test "freeze! freezes members of arrays" do
    array = ["I", "am", "an", "array", "of", "strings"]
    array.each do |string|
      assert_not_frozen string
    end
    assert_not_frozen array

    array.freeze!

    array.each do |string|
      assert_frozen string
    end
    assert_frozen array
  end

  test "freeze! freezes arrays of arrays" do
    array = [[[["an array of arrays"]]]]
    assert_not_frozen array
    assert_not_frozen array[0]
    assert_not_frozen array[0][0]
    assert_not_frozen array[0][0][0]
    assert_not_frozen array[0][0][0][0]

    array.freeze!

    assert_frozen array
    assert_frozen array[0]
    assert_frozen array[0][0]
    assert_frozen array[0][0][0]
    assert_frozen array[0][0][0][0]
  end

  test "freeze! freezes hashes keys and values" do
    hash = {"hello" => "world"}

    assert_not_frozen(hash)
    assert_frozen(hash.keys.first) # hash keys already are frozen
    assert_not_frozen(hash.values.first)
    assert_not_frozen(hash["hello"])

    hash.freeze!

    assert_frozen(hash)
    assert_frozen(hash.keys.first)
    assert_frozen(hash.values.first)
    assert_frozen(hash["hello"])
  end

  test "freeze! big momma" do
    big_momma = {:a => ["hash", {"of" => {"hashes" => ["and arrays"]}}, ["and", "other"], "stuff"],
      "like" => {"numbers" => 123, :and => /aregexp/}}

    big_momma.freeze!

    assert_frozen big_momma
    assert_frozen big_momma[:a][1]
    assert_frozen big_momma[:a][2]
    assert_frozen big_momma[:a][2][1]
    assert_frozen big_momma["like"][:and]
  end

  test "freeze! on integers" do
    integer = 23
    assert_frozen integer unless ruby19?
    integer.freeze!
    assert_frozen integer
  end

  test "freeze! on symbols" do
    symbol = :abc
    assert_frozen symbol unless ruby19?
    symbol.freeze!
    assert_frozen symbol
  end

  test "freeze! on strings" do
    string = "abc"
    assert_not_frozen string
    string.freeze!
    assert_frozen string

    assert_not_frozen "abc" # based on instance, not content
  end

  protected

  def ruby19?
    RUBY_VERSION =~ /1.9/
  end

  def assert_frozen(object)
    assert object.frozen?, "expected #{object.inspect} to be frozen"
  end

  def assert_not_frozen(object)
    assert !object.frozen?, "expected #{object.inspect} not to be frozen"
  end
end
