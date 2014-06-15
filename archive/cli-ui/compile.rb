#!/usr/bin/env ruby

# Version:     0.1
# Author:      Kylobite
# Modified:    05-22-2014
# Description: A small utility to compile many
#              CoffeeScript files into one file

puts "Evaluating..."
lines = []
conf  = File.expand_path "../compile.conf", __FILE__
File.open(conf).each_line {|line| lines << line.split("\n").join.split("\s").join}

puts "Tokenizing..."
operations = {}
lines.map do |l|
    k, v = l.split(":")
    operations[k] = v
end

src   = operations["src"]
to    = operations["to"]
order = operations["order"].split(/\[(.*)\]/)[1].split(",")

src = "#{src}/" unless src[-1] == "/"
src_dir = File.expand_path "../#{src}", __FILE__
bin = Array.new order.size

sort = {}
order.each_with_index do |k,v|
    sort[k] = v
end

puts "Reading..."
Dir.glob("#{src_dir}/*.coffee") do |c|
    key = c.split("#{src_dir}/").join.split(".coffee").join
    bin[sort[key]] = File.read(c)
end

code = ""
bin.map {|b| code = "#{code}#{b}\n\n"}

puts "Checking..."
diff_dir = File.expand_path "../compile.diff", __FILE__
continue = true
if File.exists? diff_dir
    File.open("compile.tmp.diff", "w") {|f| f.write code}
    diff = `diff #{diff_dir} compile.tmp.diff`
    File.delete "compile.tmp.diff"
    File.open(diff_dir, "w") {|f| f.write code}
    continue = false if diff.empty?
else
    File.open("compile.diff", "w") {|f| f.write ""}
end

if continue
    puts "Compiling..."
    to_dir = File.expand_path "../#{to}.coffee", __FILE__
    File.open(to_dir, "w") {|f| f.write code}
else
    puts "Rejecting..."
end

puts "Done!"