CREATE USER 'terwer'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'terwer'@'%' WITH GRANT OPTION;
flush privileges;