helpers do

	def last_date_by_str(s,e)
		s = str_to_date(s)
		e = str_to_date(e)
		Browse.all(:dt => (s..e))
	end
	
	def str_to_date(str)
		y, m, d = str.split("-")
		Time.local(y, m, d)
	end

end
