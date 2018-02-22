import urllib
import re

link1 = "http://10.100.20.113:8888/node/fetch/212.9.12.9"
f = urllib.urlopen(link1)
config = f.read()
#GRAB LATEST CONFIG FROM OXIDIZED

index1 = 0
index2 = 0
index3 = 0
math = 0
#set index to beginning of "config" string


marker = "interface GigabitEthernet1/47."
input = "service-policy input"
output = "service-policy output"
#DEFINE KEY SUBSTRINGS

while index1 < len(config):
        index1 = config.find(marker, index1)
        if index1 == -1:
            break
        #print('marker found at', index1)
        #print config[index1:index1+1000]
        subint = config[index1+29:index1+300]
        #subint = re.sub('[^0-9]', '', subint)
        #^this removes all letters from output
        print subint
        index1 += 2
'''
        while index2 < len(subint):
            index2 = subint.find(input, index2)
            if index2 == -1:
                break
            index3 = subint.find(output, index3)
            print subint[index2+21:index2+27]
            #print index2
            index2 += 2
            index3 += 2
'''


            
        








