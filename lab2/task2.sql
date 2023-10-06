CREATE VIEW to_pay(driver_name, driver_surname, to_pay) AS
SELECT driver.name, driver.surname, travel.payment
FROM travel, driver
WHERE (driver.id_driver = travel.id_driver OR driver.id_driver = travel.id_second_driver) AND driver.id_driver != 0;