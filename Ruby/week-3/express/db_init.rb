# DB = PG.connect({:dbname => 'postgres'})
# DB.exec("CREATE DATABASE express; USE express; CREATE TABLE cities (id serial PRIMARY KEY, name varchar);CREATE TABLE trains (id serial PRIMARY KEY, name varchar);CREATE TABLE stops (id serial PRIMARY KEY, train_id int, city_id int);CREATE DATABASE express_test WITH TEMPLATE express;")
