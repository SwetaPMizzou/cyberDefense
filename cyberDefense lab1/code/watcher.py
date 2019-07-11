
import time
import mysql.connector

m = mysql.connector.connect(host='127.0.0.1', database='test',user='root', password='root')
cur1 = m.cursor()
cur1.execute("SELECT * FROM `blacklist`")
cur1.fetchall()
initial = cur1.rowcount

while True:
	cur2 = m.cursor()
	cur2.execute("SELECT * FROM `blacklist`")
	cur2.fetchall()
	final = cur1.rowcount
	if initial == final and final != 0:
		print("Server Attacked")
		initial = final
	else:
		print("Server Not Attacked!! No Worries !!!")
	time.sleep(5)
	