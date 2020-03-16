puts"Как Вас зовут?"
name = gets.chomp

puts"Какой у Вас рост в сантиметрах?"
height = gets.chomp.to_i

puts"Какой у Вас вес в кг?"
weight = gets.chomp.to_i

ideal_weight = height - 110

if weight > ideal_weight
	puts "#{name}, Ваш идеальный вес #{ideal_weight} кг."
else
	puts "#{name}, Ваш вес уже оптимальный!"
end