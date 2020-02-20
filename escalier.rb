a = 1
first_arg = ARGV[0].to_i

for a in 1..first_arg
  print " " * first_arg, "#" * a
  print "\n"
  a += 1
  first_arg -= 1
end
