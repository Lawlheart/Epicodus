Guest=# `CREATE DATABASE express;`

Guest=# `\c express;`

express=# `CREATE TABLE cities (id serial PRIMARY KEY, name varchar);`

express=# `CREATE TABLE trains (id serial PRIMARY KEY, name varchar);`

express=# `CREATE TABLE stops (id serial PRIMARY KEY, train_id int, city_id int);`

express=# `CREATE DATABASE express_test WITH TEMPLATE express;`
