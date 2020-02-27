=begin
Store files data in arrays :
arg1 = c1.txt
arg2 = c2.txt
=end
arg1 = File.read(ARGV[0])
arg1.gsub!("\n", " ")
# Replace "\n" by " "
arg1 = arg1.split("\s")
# Split at " " + delete " "

arg2 = File.read(ARGV[1])
arg2.gsub!("\n", " ")
arg2 = arg2.split("\s")

# function to made 2d arrays
def array_splitter(arr)
  i = 0
  for v in arr
    v = v.split("")
    arr[i] = v
    i += 1
  end
end

array_splitter(arg1)
array_splitter(arg2)

=begin
Function to compare arrays and give the index of
the first sharing value.
=end
l = arg1[0].length
match = false

until match
  arg2.each_index do |x|
    arg2[x].each_index do |y|
      if arg2[x][y...y+l] == arg1[0]
        match = true
        print y, ",", x;
      end
      break if match == true
    end
  end
end
