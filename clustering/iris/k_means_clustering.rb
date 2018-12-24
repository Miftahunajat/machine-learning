data_training = IO.readlines('data_training.txt')
data_test = IO.readlines('data_test.txt')
train=Hash.new
data_training.each do |line|
    line = line.split(",")
    train[line[0..3].map{|f| f.to_f}] = line[line.length-1]
end
print "Masukkan nilai K : "
k = gets.chomp.to_i
error = 0
data_test.each do |line|
    line = line.split(",")
    result = train.map{|k,v| k =  Math.sqrt(k.each_with_index.map{|x,i| (line[i].to_f - x)**2}.reduce(:+) ), v }.sort[0..k-1].to_h
    print "Label Asli: #{line[line.length-1].chomp} || Output: #{x = result.values.max_by{|x| result.values.count(x)}.chomp}"
    error += 1 if (x.chomp != line[line.length - 1].chomp)
    print " || Kebenaran #{x.chomp != line[line.length - 1].chomp ? "Error" : "True"}\n"
end
puts "==========\nDengan Nilai K : #{k} \nTotal Error    : #{error}\nErrornya     : #{error/30.0*100}%\n=========="