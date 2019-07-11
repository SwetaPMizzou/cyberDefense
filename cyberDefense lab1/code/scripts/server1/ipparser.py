#!/usr/bin/python

f = open("ping.log","r");
print f.read().split()[2]
f.close()

