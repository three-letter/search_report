#coding: utf-8

helpers do

	def last_date_by_str(s,e)
		s = str_to_date(s)
		e = str_to_date(e)
		Browse.all(:date => (s..e))
	end
	
	def str_to_date(str)
		rule = str =~ /^\d{4}-\d{1,2}-\d{1,2}$/
		if rule.nil?
			flash[:notice] = "日期格式错误(yyyy-MM-dd)"
			redirect '/'
		end
		y, m, d = str.split("-")
		Time.local(y, m, d)
	end

	def param_to_field_mapping
		{:vi => :view_id, :dt => :date, :pn => :page, :pos => :pos, :c => :size, :kw => :keyword, :bn => :browser, :dm => :domain}
	end

	def generate_txt(start_date, end_date)
  	bs = last_date_by_str(start_date, end_date)	
		return nil if bs.length == 0
		separate = "    "
		path = File.expand_path("..", __FILE__)
		file_name = "#{start_date}_#{end_date}.txt"
		File.open("#{path}/public/db/#{file_name}", "w") do |f|
			bs.each { |b| f.puts "#{b.view_id}#{separate}#{b.date}#{separate}#{b.page}#{separate}#{b.pos}#{separate}#{b.size}#{separate}#{b.keyword}#{separate}#{b.browser}#{separate}#{b.domain}" }
		end
		file_name
	end

end
