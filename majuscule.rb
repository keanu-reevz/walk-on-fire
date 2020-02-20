i = 0
argument = ARGV.join(" ")
text = argument.to_s
letters = text.split("")

for x in letters
  if i % 2 == 0
    x.downcase!
  else
    x.upcase!
  end
  i += 1
end

letters.each do |letter|
  print letter
end
