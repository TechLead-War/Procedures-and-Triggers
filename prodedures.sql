CREATE FUNCTION f_add_two_nums(a int, b int)
	returns int
	language sql
	as
	'select $1 + $2;';


CREATE FUNCTION md5_masher(input_text text)
	returns text
	as $$
	begin
		return (select md5(input_text) as masked_text);
	end;
	$$ language plpgsql
	

select general_hospital.md5_masher('ayush');


CREATE OR REPLACE FUNCTION general_hospital.md5_masher1(input_text text)
	returns text
	as $$
	DECLARE
    	result_text TEXT;
	begin
		select md5(input_text) as masked_text INTO result_text;
		select ('Patient ' || LEFT(result_text, 8)) INTO result_text;
		return result_text;
	end;
	$$ language plpgsql
	

select general_hospital.md5_masher1('ayush');


ALTER FUNCTION general_hospital.md5_masher1 
	RENAME TO get_hashed_user_name
	

select general_hospital.get_hashed_user_name('ayush');


CREATE PROCEDURE general_hospital.test_procedure()
	as $$
	begin
		DROP TABLE IF EXISTS general_hospital.test;
		create table general_hospital.test (
			id int
		);
		commit;
	end;
	$$ language plpgsql
	
call general_hospital.test_procedure();


select * from information_schema.routines where routine_schema = 'general_hospital';


CREATE OR REPLACE PROCEDURE general_hospital.test_procedure()
	as $$
	begin
		DROP TABLE IF EXISTS general_hospital.test;
		create table general_hospital.test (
			id int
		);
		commit;
	end;
	$$ language plpgsql


ALTER PROCUDURE general_hospital.test_procedure
	SET SCHEMA public;


DROP PROCUDURE IF EXISTS general_hospital.test_procedure;

