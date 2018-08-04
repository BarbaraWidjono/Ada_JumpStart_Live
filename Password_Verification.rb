# Welcome message and instructions for user
puts "Welcome to the Password Verification Program!"
puts "Please enter a password that contains the following requirements:"
puts "1) 8 or more letters (must include a capital & lowercase letter)"
puts "2) A number"
puts "3) A symbol"

# Asking user to input a Password and assigning to a variable
puts "Please enter a password"
password = gets.chomp

# Asking user to re-enter password for confirmation
puts "Please re-enter your password"
confirm_password = gets.chomp

# Splitting the components of the password for later analysis
split_password = password.split('')

# Arrays to sort each character of the password into a datatype
integers = Array.new
lower_letters = Array.new
upper_letters = Array.new
symbols = Array.new

# Alphabet
alphabet = ["a", "A", "b", "B", "c", "C", "d", "D"]

# Sorting the split_password into datatypes and pushing into the corresponding arrays. Will be used to ensure each datatype array contains an element (all requirements of the password are met)
split_password.each do |x|
  if x == "0" || x == "1" || x == "2" || x == "3" || x == "4" || x == "5" || x == "6" || x == "7" || x == "8" || x == "9"
    integers.push(x)
  elsif x == "a" || x == "b" || x == "c" || x == "d" || x == "e" || x == "f" || x == "g" || x == "h" || x == "i" || x == "j" || x == "k" || x == "l" || x == "m" || x == "n" || x == "o" || x == "p" || x == "q" || x == "r" || x == "s" || x == "t" || x == "u" || x == "v" || x == "w" || x == "x" || x == "y" || x == "z"
    lower_letters.push(x)
  elsif x == "A" || x == "B" || x == "C" || x == "D" || x == "E" || x == "F" || x == "G" || x == "H" || x == "I" || x == "J" || x == "K" || x == "L" || x == "M" || x == "N" || x == "O" || x == "P" || x == "Q" || x == "R" || x == "S" || x == "T" || x == "U" || x == "V" || x == "W" || x == "X" || x == "Y" || x == "Z"
    upper_letters.push(x)
  else
    symbols.push(x)
  end
end

# Error messages
errors = Array.new

# Checking that there is at least one integer in the Password
if integers.length == 0
  message = "Missing a number"
  errors.push(message)
end

# Checking that there is at least one symbol in the Password
if symbols.length == 0
  message = "Missing a symbol"
  errors.push(message)
end

# Checking that there is at least one lowercase letter in the Password
if lower_letters.length == 0
  message = "Missing a lowercase letter"
  errors.push(message)
end

# Checking that there is at least one uppercase letter in the Password
if upper_letters.length == 0
  message = "Missing a uppercase letter"
  errors.push(message)
end

# Checking that there are at least 8 letters(lower and uppercase) in the password
if upper_letters.length + lower_letters.length < 8
  message = "Must contain at least 8 letters"
  errors.push(message)
end

# Informing user of errors in password selection
if password == confirm_password && errors.length > 0
  puts "Your passwords match but cannot be accepted. The missing requirements are:"
  puts errors
elsif password != confirm_password && errors.length == 0
  puts "There are no errors in the requirements but the passwords do not match."
elsif password != confirm_password && errors.length > 0
  puts "The passwords do not match and the missing requirements are:"
  puts errors
else
  puts "Success!!!"
end
