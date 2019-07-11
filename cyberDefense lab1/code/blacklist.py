
import time
import mysql.connector

m = mysql.connector.connect(host='127.0.0.1', database='test',user='root', password='root')
cur1 = m.cursor()
cur1.execute("SELECT DISTINCT(blacklist_ip) FROM `blacklist` where blacklist_ip not in ('<server1_ip>')")
result = cur1.fetchall()
total = cur1.rowcount
blacklisted=[];
if total > 0:
    for rec in result:
        blacklisted.append(rec[0])
print blacklisted
