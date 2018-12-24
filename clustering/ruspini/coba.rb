data_training = IO.readlines('data_training.txt').map{|w| w.split(" ")[0..1]}
data_raw = Hash.new
data_training.each{|w| data_raw[w] = -1}

# train=Hash.new
# data_training.each do |line|
#     line = line.split(" ").map{|w| w.to_i};
#     train[line[0..1]] = line[2]
# end
# print "Masukkan nilai K : "
# k = gets.chomp.to_i
# error = 0
# data_test.each do |line|
#     line = line.split(" ").map{|w| w.to_i
#     result = train.map{|k,v| k = Math.sqrt( (line[0] - k[0])**2 + (line[1] - k[1])**2 ), v}.sort[0..k-1].to_h
#     print "Label Asli : #{line[2]} || "
#     print "Output : #{x = result.values.max_by{|x| result.values.count(x)}}"
#     error += 1 if (x != line[2])
#     p " || #{x != line[2] ? "Error" : "True"} "
# end
# puts "==========\n Dengan Nilai K : #{k} \n Errornya : #{error/16.0*100}%\n=========="