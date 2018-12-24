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
data = [ [1,1] ,[2,1], [2,2], [1,2], [7,7], [9,9]]
cluster = Hash.new
data.each {|arr| cluster[arr] = [arr] }
k = gets.chomp.to_i
n = data.length
while n != k
	min = 999999
	join = []
	cluster.each do|k,v|
		cluster.each do|i,p|
			if (p != v)
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
p cluster