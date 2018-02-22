
from distutils.core import setup
import py2exe

setup(console=["Jake.py"])

import time
import random
yes = set(['yes','y', 'ye', 'YES', 'Yes'])
no = set(['no','n', 'No', 'NO'])


print "Hello there, my name is Jake!"
time.sleep(1)
name = raw_input("What is your name?\n")
time.sleep(1)
age = input("Hi there " + name + ". And may I ask what your age is?\n")
time.sleep(1)
print "Haha!" , age , "year-old" , name, "is a stupid head!\n\n" 
time.sleep(1)
print "Ha ha ha!"
time.sleep(1)
print "\n...\n"
time.sleep(1)
print "\n...\n"
time.sleep(1)
angry = raw_input("Are you angry at me now, " + name + "?\n")
time.sleep(1)

if angry in yes:
    print "You ARE angry at me?"
    time.sleep(1)
    print "Good."
    time.sleep(1)
    print "...because I hate you."
    time.sleep (1)
elif angry in no:
    time.sleep(1)
    print "Good. I didn't mean to upset you..."
    time.sleep(1)
    friends = raw_input("Can we be friends?\n")
    if friends in yes:
        time.sleep(1)
        print "Yay!"
        time.sleep(1)
    elif friends in no:
        time.sleep(1)
        print "Well I don't want to be friends with you anyway...\n"
        time.sleep(1)
        print "...because I hate you."
        time.sleep (1)            

game = input("Can we play a game now?\n")
if game in yes:
    time.sleep(1)
    print "Yipee!"
    time.sleep(1)
elif game in no:
    time.sleep(1)
    print "Well I don\'t care what you want. I want to play a game so we are playing."
    time.sleep(1)

guesses_left = 3
random_number = random.randint(1,10)
time.sleep(1)
print("Okay. I am thinking of a number between 1 and 10, and you have to guess what it is. I will give you 3 chances or you lose! Go!\n")
time.sleep(1)
while guesses_left > 0:
    print('Take a guess.')
    guess = input()
    guess = int(guess)
    if guess > random_number:
        guesses_left = guesses_left - 1
        time.sleep(1)
        if guesses_left == 0:
            time.sleep(1)
            print "Yay! I win! You lose! The number I was thinking of was" , random_number , "all along!"
            break
        else:
            print "WRONG! Ha ha ha! Too high! You have " , guesses_left, "more chances. Try again...\n"
    elif guess < random_number:
        guesses_left = guesses_left - 1
        time.sleep(1)
        if guesses_left == 0:
            time.sleep(1)
            print "Yay! I win! You lose! The number I was thinking of was" , random_number , "all along!"
            break
        else:        
            print "WRONG! Ha ha ha! Too low! You have " , guesses_left, "more chances. Try again...\n"
    elif guess == random_number:
        time.sleep(1)
        print "Darn! You win!"
        break

time.sleep(2)       
print "Well that was super fun!"
time.sleep(1)
print "Okay" , name , ", it\'s bedtime now. Goodbye, friend!"
time.sleep(1)
print "Thank you for playing with me!"
time.sleep(5)

    
 

                
    
    

