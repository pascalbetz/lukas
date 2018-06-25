require "minitest/autorun"
require_relative "fibo"

class Test < MiniTest::Unit::TestCase

  def test_0
    assert_equal 0, Fibo.call(0)
  end

  def test_1
    assert_equal 1, Fibo.call(1)
  end

  def test_2
    assert_equal 1, Fibo.call(2)
  end

  def test_3
    assert_equal 2, Fibo.call(3)
  end

  def test_4
    assert_equal 3, Fibo.call(4)
  end

  def test_5
    assert_equal 5, Fibo.call(5)
  end

  def test_6
    assert_equal 8, Fibo.call(6)
  end

end
