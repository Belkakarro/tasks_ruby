=begin
Сделать хеш, содеращий месяцы и количество дней в месяце. 
В цикле выводить те месяцы, у которых количество дней ровно 30
вариант 1
=end

hash = {"January" => 31, "February" => 29, "March" => 31, "April" => 30, "May" => 31, "June" => 30, "Julay" => 31, "Augest" => 30, "September" => 30, "October" => 31, "November" => 30, "December" => 31}
arr = []
hash.each{|k,v|
	if v == 30
		arr.push(k)
	end
}
puts arr