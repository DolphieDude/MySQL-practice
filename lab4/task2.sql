START TRANSACTION READ ONLY;
select * from travel where id_route = 1;

COMMIT;