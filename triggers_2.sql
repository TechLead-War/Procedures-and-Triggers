create function general_hospital.f_trigger()
	returns trigger
	language plpgsql
	as $$
	begin 
		if New.first_name is null or New.last_name is null then
			raise exception 'Name cant be null';
		else
			New.first_name = trim(New.first_name);
			New.last_name = trin(new.last_name);
			New.full_name = concat(New.first_name, ' ', New.last_name);
			return New;
		end if;
	end;
	$$