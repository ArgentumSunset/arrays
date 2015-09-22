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
        assert_equal "Ho++++Ho++++Ho++++++", @m.plus_it("HoMerrHoyChrHoistmaH","Ho")
        assert_equal "++++55++++", @m.plus_it("1234554321","5")
        assert_equal "+++Jolly Joe+++", @m.plus_it("krTJolly Joec7K","Jolly Joe")
    end
    
    def test_zero_front
        assert_equal [0,0,0,4,6,7], @m.zero_front([4,0,6,7,0,0])
        assert_equal [0,7,6,12,8], @m.zero_front([7,6,12,0,8])
        assert_equal [9,4,6,17,5], @m.zero_front([9,4,6,17,5])
        assert_equal [0,0,9,4,2,8,17], @m.zero_front([9,0,4,2,8,17,0])
    end
    
    def test_ten_run
        assert_equal [4,16,20,20,20,20,30,30], @m.ten_run([4,16,20,12,-3,4,30,199])
        assert_equal [10,10,20,20,30,30,40,40], @m.ten_run([10,8,20,20,30,-24,40,12])
        assert_equal [0,0,-10,-10,-20,-20,-20], @m.ten_run([0,8,-10,12,-20,-21,-22]) #Negatives and zero are also multiples of ten!
        assert_equal [10,10,10,10], @m.ten_run([10,14,99,-62])
    end
    
    def test_max_span
        assert_equal 2, @m.max_span([2,2,'eight',4,9])
        assert_equal 5, @m.max_span([2,8,true,4,2])
        assert_equal 0, @m.max_span([2,8,'this',9])
        assert_equal 8, @m.max_span([8,4,'hi',6,false,3,4,7,7,'hi',7])
        assert_equal 4, @m.max_span([true, false, false, true])
    end
end
