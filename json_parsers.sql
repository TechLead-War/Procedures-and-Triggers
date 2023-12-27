SELECT '{"first_name": "ayush", "last_name": "kapri"}'::json->'first_name';

-- Build json
SELECT '{"first_name": "ayush", "last_name": "kapri"}'::json;

select jsonb_build_object (
	'id', id,
	'first_name', first_name,
	'last_name', last_name
) 
from general_hospital.physicians;
 
 
-- export data
copy <table_name> to 'C:/data/data_copy.csv'
	with delimiter ',' csv header;
	

-- Import data
copy <table_name> from 'C:/data/data_copy.csv'
	with delimiter ',' csv header;