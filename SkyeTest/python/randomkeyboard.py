random = raw_input('Mash your keyboard, bruv: ')
chars = "abcdefghijklmnopqrstuvwxyz"
i = 0

for char in chars:
  count = random.count(char)
  i = i+1
  if count > 1:
    print char, count


#print [pos for pos, char in enumerate(random) if char == chars[i]]
