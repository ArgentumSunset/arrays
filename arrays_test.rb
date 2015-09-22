require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'arrays'

class ArraysTest < MiniTest::Test
	def setup
		@m = Class.new do
     include Arrays
   	end.new
	end

	def test_middles
		assert_equal [2,5], @m.middles([1,2,3],[4,5,6])
		assert_equal ['hello',true], @m.middles(['hi','hello','hola'],[false,true,false])
	end

	def test_max
		assert_equal 7, @m.max([7,0,1,-3,1,6])
		assert_equal 18, @m.max([1,2,3,4,18])
	end

	def test_lucky13
		assert_equal true, @m.lucky13?([8,9,2,14,12])
		assert_equal false, @m.lucky13?([1,1,3,3])
		assert_equal false, @m.lucky13?([18,1,12,5,0])
		assert_equal false, @m.lucky13?([18,3,12,5,0])
	end

	def test_repeat_separator
		assert_equal 'SoOrSoOrSo', @m.repeat_separator('So','Or',3)
		assert_equal 'lalalalal', @m.repeat_separator('l','a',5)
		assert_equal 'This should not be repeated.', @m.repeat_separator('This should not be repeated.','k',1)
	end

	def test_same_ends
		assert_equal true, @m.same_ends?([1,8],0)
		assert_equal true, @m.same_ends?([5,5],1)
		assert_equal true, @m.same_ends?([17,8,4,101,5,6,17,8,4],3)
		assert_equal false, @m.same_ends?([1,2,3,6,17,244,1,2,3,4],3)
	end
    
    def test_starry
        assert_equal true, @m.starry?("Nooooo*ooo!")
        assert_equal true, @m.starry?("A*A")
        assert_equal false, @m.starry?("*Ackerman")
        assert_equal false, @m.starry?("A*ckerman")
        assert_equal false, @m.starry?("No stars here, bro.")
    end
    
    def test_plus_it
        assert_equal "D+++", @m.plus_it("Dear","D")
        assert_equal "Ho++++Ho++++Ho++++++", @m.plus_it("HoMerrHoyChrHoistmas","Ho")
        assert_equal "++++55++++", @m.plus_it("1234554321")
    end
end
