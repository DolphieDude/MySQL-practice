ALTER VIEW to_pay(driver_name, driver_surname, to_pay, extra_charge) AS
SELECT driver.name, driver.surname, travel.payment, travel.payment - route.default_payment
FROM travel, driver, route
WHERE ((driver.id_driver = travel.id_driver OR driver.id_driver = travel.id_second_driver) AND driver.id_driver != 0)
	AND travel.id_route = route.id_route;
