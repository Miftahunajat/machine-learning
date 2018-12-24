def find_s hipotesa,data_test
    hipotesa.select{|k,v|  v.each_index.all?{|i| v[i] == "?" || v[i] == data_test[i]} }.keys
end
file = IO.readlines('data.txt')
class_label,feature = file[0..1].map{|w| w.split(" ")}
hipotesa=Hash.new
n=feature.length
file[2..-1].each do |line|
  train=line.split(" ")
  if hipotesa.key?(train[n])
    hipotesa[train[n]] = hipotesa[train[n]].each_with_index.collect{|x,i| x == train[i] ? x : "?" }
  else
    hipotesa[train[n]] = train[0..n-1]
  end
end
garis = "========================================================="
puts "#{garis} \n #{hipotesa} \n #{garis}"
while true
    data_test=Array.new
    feature.each do |itema|
        print "Masukkan #{itema} : "
        data_test << gets.chomp
    end
    print "#{garis} \nHasil hipotesa dari masukkan anda adalah : #{find_s(hipotesa,data_test)} \n\n"
  end

  # a = [1,2,3,4,5,6,7,8]
  # p a.all?{|x| x%1==0}