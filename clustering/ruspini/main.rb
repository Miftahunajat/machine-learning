require 'gnuplot'
def hitung_jarak_kluster cluster1, cluster2
  jarak = 0;
  cluster1.each do |a|
    cluster2.each do |b|
      jarak += Math.sqrt a.zip(b).map { |n| n.reduce(:-) }.map { |n| n**2 }.reduce(:+) 
    end
  end
  jarak
end
files = IO.readlines('data.txt')
data = files.map{|w| w.split(' ').map(&:to_i) }
cluster = Hash.new
data.each { |arr| cluster[arr] = [arr] }
print 'Masukkan nilai K : '
k = gets.chomp.to_i
n = data.length
while n != k
  min = 999999
  join = []
  cluster.each do|k,v|
    cluster.each do|i,p|
      if p != v
        temp = hitung_jarak_kluster v, p
        join = [k,i] if temp < min
        min = temp if temp < min
      end
    end
  end
  cluster[join[0]] = cluster[join[0]] + cluster[join[1]]
  cluster.delete(join[1])
  n -= 1
end

cluster.each do |k, v|
  x = v.transpose[0]
  y = v.transpose[1]
  p x, y
end
p cluster
Gnuplot.open do |gp|
  Gnuplot::Plot.new(gp) do |plot|
    plot.title 'Ruspini'
    plot.xlabel = 'X'
    plot.ylabel = 'Y'
    cluster.each do |k, v|
      x = v.transpose[0]
      y = v.transpose[1]
      plot.data << Gnuplot::DataSet.new(&:no_title)
    end
  end
end
