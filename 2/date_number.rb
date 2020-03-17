=begin
Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным
=end
puts"Введите число в месяце"
day = gets.chomp.to_i

puts"Введите месяц (число)"
mounth = gets.chomp.to_i

puts"Введите год"
year = gets.chomp.to_i

day_in_mounth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

result = 0
result = result + day

for i in 0...mounth - 1
	result += day_in_mounth[i]
end

if (year % 400 == 0) && (year % 100 == 0)
	result + 1
elsif (year % 4 == 0)
	result + 1
end

puts "Введенная вами дата является #{result} по счету в #{year} году"
