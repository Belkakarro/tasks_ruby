=begin
Заполнить массив числами от 10 до 100 с шагом 5
=end
numbers = (10..100).to_a
new_arr = []
numbers.each{|i|
	if i % 5 == 0
		new_arr.push(i)
	end
}
puts new_arr