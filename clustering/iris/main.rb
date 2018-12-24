def hitung_jarak_kluster cluster1, cluster2
  #p cluster1, cluster2
    jarak = 0;
    cluster1.each do |a|
        cluster2.each do |b|
            jarak +=Math.sqrt ( a.zip(b).map{ |n| n.reduce(:-)}.map{|n| n**2}.reduce(:+) )
        end
    end
    jarak
end
files = IO.readlines('iris.txt').uniq
data = files.map{|w| w.split(",")[0..3].map{|x| x.to_f }}
cluster = Hash.new
data.each {|arr| cluster[arr] = [arr] }
print "Masukkan Nilai K : "
k = gets.chomp.to_i
n = data.length
N = n

while n != k
    min = 999999
    join = []
    cluster.each do|k,v|
        cluster.each do|i,p|
            if (k != i)
                temp = hitung_jarak_kluster v,p
                join = [k,i] if (temp < min)
                min = temp if (temp < min)
            end
        end
    end
    cluster[join[0]] = cluster[join[0]] + cluster[join[1]]
    cluster.delete( join[1] )
    n-=1
end

cluster = cluster.map{|k,v|  k=v.transpose.map{|w| w.reduce(:+).to_f/v.length} ,v=v}.to_h
puts " << Hasil dari Cluster >>"
cluster.each_with_index do |(key,value),index|
  print "Cluster #{index+1} : #{value}\n"
end
# SSE
result = []
cluster.each do |k,v|
  result.concat(v.map{|w| w.zip(k).map{|x| x.reduce(:-)}}.map{|w|  w.map{|x| x*x}.reduce(:+) })
end
#p result.reduce(:+)/N
puts "Hasil SSE Adalah #{result.reduce(:+) / N}"