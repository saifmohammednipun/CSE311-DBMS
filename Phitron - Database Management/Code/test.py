import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="password"
)

print(mydb)