=begin
Сумма покупок. Пользователь вводит поочередно название 
товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор, 
пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся: Заполнить и вывести на экран хеш, ключами которого 
являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара
 и кол-во купленного товара. Также вывести итоговую сумму за каждый товар. Вычислить и вывести на экран итоговую сумму всех покупок в "корзине"
=end

goods = []
prices = []
amount_goods = []


puts"Введите название товара"
name = gets.chomp.to_s


while name != 'стоп'
goods.push(name)

puts"Введите цену за единицу товара"
price = gets.chomp.to_i
prices.push(price)

puts"Введите количество товара"
count = gets.chomp.to_f
amount_goods.push(count)
puts"Введите название товара"
name = gets.chomp.to_s

end

arr = prices.zip(amount_goods)
full_arr = goods.zip(arr)
#puts full_arr


hash = full_arr.to_h

basket = hash.each { |x, y| hash[x] = Hash[*y] }
puts basket

result = 0
basket.each {|name, price| 
	puts "#{name} стоит #{price.keys.first * price.values.first}"
	result += price.keys.first * price.values.first
}

puts "Общая сумма покупок #{result}"