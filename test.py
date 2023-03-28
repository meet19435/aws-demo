import mysql.connector


myconn = mysql.connector.connect(host = "13.50.210.144", user = "admin",passwd = "12345678",database = "db1")
curr = myconn.cursor()

stmt = "select * from INFO"

curr.execute(stmt)
res = curr.fetchall()
for x in res:
    print(x)

myconn.close()
