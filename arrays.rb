module Arrays
	def middles(array1,array2)
		[array1[1],array2[1]]
	end

	def max(array)
		max = 0
		array.each do |element|
			if element > max 
				max = element
			end
		end
		max
	end

	def lucky13?(array)
		lucky = true
		array.each do |element|
			(element == 3 || element == 1) ? lucky = false : false
		end
		lucky
	end

	def repeat_separator(word,sep,count)
		str = ""
		for i in 1..count 
			str += word
			i < count ? str += sep : false
		end
		str
	end

end