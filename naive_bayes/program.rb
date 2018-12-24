file = IO.readlines('data.txt')
data_training = file[1..-1].collect{|w| w.split(" ")}
data_test = Array.new
puts separator = "============================="
feature = file[0].split(" ")[0..-2].each do |fet|
    print "Masukkan #{fet} : "
    data_test << gets.chomp
end
puts separator
opsi = data_training.map{|w| w[-1]}.uniq
hasil = Hash.new
opsi.each_with_index do |x,i|
    penyebut, result = 1,1
    data_test.each_with_index do |test,i|
        pembilang = data_training.select{|w| w[i] == test && w[-1] == x}.size
        penyebut = data_training.select{|w| w[-1] == x}.size
        result *= test == "" ? 1 : pembilang.to_f / penyebut.to_f
    end
    puts "Total peluang untuk #{x} : #{hasil[x] = result * penyebut / data_training.size}"
end
puts "#{separator}\nMaka keputusan yang diambil untuk #{file[0].split(" ")[-1]} adalah [#{hasil.max_by{|k,v| v}[0]}] dengan peluang #{hasil.max_by{|k,v| v}[1]}"