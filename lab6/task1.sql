CREATE USER 'administrator'@'localhost';
GRANT ALL ON transportationdb.* TO 'administrator'@'localhost';

CREATE USER 'driver'@'localhost';
GRANT SELECT ON transportationdb.travel TO 'driver'@'localhost';
GRANT SELECT ON transportationdb.route TO 'driver'@'localhost';

CREATE USER 'client'@'localhost';
GRANT SELECT, UPDATE, INSERT ON transportationdb.travel TO 'client'@'localhost';
GRANT SELECT ON transportationdb.driver TO 'client'@'localhost';
GRANT SELECT ON transportationdb.route TO 'client'@'localhost';