CREATE DATABASE tutorials;
CREATE USER 'backend';
ALTER USER 'backend'@'%' IDENTIFIED BY 'hello';
GRANT ALL PRIVILEGES ON tutorials.* TO 'backend'@'%';
FLUSH PRIVILEGES;

