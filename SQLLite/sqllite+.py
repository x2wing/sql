# -*- coding: utf-8 -*-"
import sqlite3
import numpy 
###################################foo####################################
def FillTable(TableName):
    for i in range(10000000):
        sqlcommand = 'INSERT INTO ' + TableName + ' (data) VALUES(' + str(i) +')'
        cur.execute(sqlcommand)
    con.commit()
# заполнение таблицы
def Fill2T(TableName, info):
    sqlcommand = 'INSERT INTO ' + TableName + ' (data) VALUES( '+ info + ' )'
    cur.execute(sqlcommand)
    con.commit()

#вывод содержимого таблицы
def ReadTable(TableName):
    sqlcommand='SELECT * FROM ' + TableName
    cur.execute()
    data = cur.fetchall()
    for i in data:
        print (i)

def DBSort():
    TName = 'Sort'
    cur.execute('DELETE FROM ' + TName)
    cur.execute('create table if not exists ' + TName +  ' (Val INTEGER)')
    Vector=(numpy.random.randint(-50, 50, 3000)).tolist()
    for i in Vector:
        cur.execute('INSERT INTO   Sort   VALUES (' + str(i) +')')
    con.commit()
    


#очистка таблицы
def ClearTable(TName):
    cur.execute('DELETE FROM ' + TName)

def AddCol(TableName, ColName):
    cur.execute('ALTER TABLE '  + TableName + ' ADD COLUMN ' + ColName + ' VARCHAR(60)' )
    con.commit()

###################################/foo####################################


TName = 'STUDENT'
con = sqlite3.connect('users.db')
cur = con.cursor()

'''
DBSort()

for row in cur.execute('SELECT * FROM Sort WHERE Val > 40'):
    print (row[0])
'''
#cur.execute('create table if not exists ' + TName +  ' (id INTEGER, firstName VARCHAR(100), secondName VARCHAR(30))')
#AddCol(TName, 'Groups')


cur.execute('create table if not exists   STUDENTS2  (Firstname VARCHAR[60], Math INTEGER, Phisic INTEGER, Geometry INTEGER, Economic INTEGER, Informatic INTEGER)')
purchases = [
            ("Иванов",4.5,3.0,3.5,5.0,3.5),
            ("Петров",4.0,4.0,4.0,3.5,4.0),
            ("Сидоров",3.5,5.0,5.0,4.0,5.0),
            ("Савельев",3.0,4.5,3.0,3.0,3.5),
            ("Смирнова",3.5,3.5,3.0,3.0,3.5),
            ("Степанова",3.5,4.0,5.0,5.0,5.0),
            ("Васильев",5.0,5.0,5.0,5.0,5.0),
            ("Васина",5.0,4.5,4.0,5.0,4.5),
            ("Деточкин",4.5,5.0,4.0,4.5,3.5),
            ("Ленский",5.0,5.0,3.0,5.0,4.0),
            ("Шемуранов",5.0,3.0,5.0,5.0,5.0),
            ("Невзоров",3.5,3.5,3.5,4.0,3.0),
            ("Ципинов",4.0,4.0,4.0,5.0,5.0),
            ("Носов",5.0,5.0,4.0,5.0,5.0),
            ("Солнцев",5.0,4.5,4.5,5.0,4.5),
            ("Котов",5.0,5.0,5.0,4.0,4.0),
            ("Котовский",5.0,5.0,5.0,5.0,5.0),
            ]
purchases2 = [
            ("Ивонов",4.2,5.0,5.2,2.0,5.2),
            ("Петров",4.0,4.0,4.0,5.2,4.0),
            ("Седоров",5.2,2.0,2.0,4.0,2.0),
            ("Совельев",5.0,4.2,5.0,5.0,5.2),
            ("Смерново",5.2,5.2,5.0,5.0,5.2),
            ("Степоново",5.2,4.0,2.0,2.0,2.0),
            ("Восельев",2.0,2.0,2.0,2.0,2.0),
            ("Восено",2.0,4.2,4.0,2.0,4.2),
            ("Деточкен",4.2,2.0,4.0,4.2,5.2),
            ("Ленскей",2.0,2.0,5.0,2.0,4.0),
            ("Шемуронов",2.0,5.0,2.0,2.0,2.0),
            ("Невзоров",5.2,5.2,5.2,4.0,5.0),
            ("Цепенов",4.0,4.0,4.0,2.0,2.0),
            ("Носов",2.0,2.0,4.0,2.0,2.0),
            ("Солнцев",2.0,4.2,4.2,2.0,4.2),
            ("Котов",2.0,2.0,2.0,4.0,4.0),
            ("Котовскей",2.0,2.0,2.0,2.0,2.0),
            ]

cur.executemany('INSERT INTO STUDENTS2 VALUES (?,?,?,?,?,?)', purchases2)
cur.executemany('INSERT INTO STUDENTS VALUES (?,?,?,?,?,?)', purchases)
con.commit()



'''
ClearTable(TName)
for i in range(10):
    Fill2T(TName, "bla"*50)
'''


con.close()