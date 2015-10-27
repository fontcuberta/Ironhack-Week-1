cities = ["miami", "madrid", "barcelona"]
puts cities.reduce {|sum, x| (sum.length > x.length)? sum : x }
