#!/usr/bin/env ruby

require 'benchmark'
require 'bigdecimal'

N = 999999
A = BigDecimal.new("10934700.0107323124")

puts "N = #{N}"
puts "A = #{A}"

Benchmark.bm do |x|
	[1, -1].each do |s|
		m = BigDecimal.new("1.0")
		(0..18).each do |i|
			puts "A * #{m} = #{A * m}"
			x.report("multiplication by #{m}:") { N.times do ; A * m; end }
			ii = i * s
			puts "A.magnitude(#{ii}) = #{A.magnitude(ii)}"
			x.report("magnitude(#{ii}):") { N.times do ; A.magnitude(ii); end }
			puts
			if s == 1
				m *= 10
			else
				m *= 0.1
			end
		end
		puts
		puts
	end
end

