=begin
Заполнить массив числами фибоначи до 100
решение через рекурсию
=end
def fib(n)
	 n <= 2 ? 1 : fib(n-2) + fib(n-1)
end
arr = (1..10).map{|n| fib(n)}
puts arr