import mysql.connector
import sys
from mysql.connector import Error
from mysql.connector import errorcode

try:
    connection = mysql.connector.connect(host='72.36.65.106',
                                         database='test',
                                         user='monty',
                                         password='some_pass')
    filename = sys.argv[1]
    file = open(filename, 'r')
    switch_id = sys.argv[2]
    index = 0
    trace_id = sys.argv[3]
    print('inserting ..............')
    sql_insert_query = """ INSERT INTO packet_logs (switch_id,trace_id,frame_number,frame_time_relative,frame_time,frame_protocols,frame_len,eth_src,eth_dst,eth_type,ip_proto,ip_src,ip_dst) 
                                   VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s) """
    cursor = connection.cursor(prepared=True)
    records_to_insert = []
    for data in file:
        data = data.replace(',,', ',0,')
        table_data = switch_id + "," + trace_id + "," + data.strip('\n')
        data_len = len(tuple(table_data.split(",")))
        if index > 0 and data_len == 13:
            records_to_insert.append(tuple(table_data.split(",")))
        index = index + 1
    result = cursor.executemany(sql_insert_query, records_to_insert)
    connection.commit()
    print(cursor.rowcount, "Record inserted successfully into python_users table")

except mysql.connector.Error as error:
    print("Failed inserting record into python_users table {}".format(error))
finally:
    # closing database connection.
    if connection.is_connected():
        #cursor.close()
        connection.close()
        print("connection is closed")
