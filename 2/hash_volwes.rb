=begin
Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
=end
alfabet = ("а".."я").to_a
volwes = ["а", "о", "у", "и", "э", "е", "ю", "ё", "я"]
number_volwes = {}
alfabet. each { |i|
	if volwes.include?(i)
	number_volwes[i] = alfabet.index(i) + 1
	end
}
puts number_volwes