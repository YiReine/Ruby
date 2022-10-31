require "test/unit"
require_relative './array'

class ArrayTest < Test::Unit::TestCase
  def test_input
    array = MinArray.getA
    array.each {|a| assert_send([a, :is_a?, Integer],"Non-numeric array members")}
    assert_block  "Array should not contain negative number" do 
    	array.all? {|a| a >= 0} 
    end
    assert array.length <= 99, "Array length over 99"
  end

  def test_min
    if MinArray.min != MinArray.getA.min
    	flunk "Find the wrong minimum value"
    end
  end
end
