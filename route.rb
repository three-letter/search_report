
get '/' do
	@start_date = (Date.today - 1).to_time.strftime("%Y-%m-%d")
	@end_date = Date.today.to_time.strftime("%Y-%m-%d")
	@bs = last_date_by_str(@start_date,@end_date)
	erb :index
end

post '/search' do
	@start_date = params[:start_date]
	@end_date = params[:end_date]
	redirect '/' if @start_date.strip.empty? || @end_date.strip.empty?
	@bs = last_date_by_str(@start_date,@end_date)
	erb :index
end

get '/save' do
	ps = {}
	fs = param_to_field_mapping 
	[:vi, :dt, :pn, :pos, :c, :kw, :bn, :dm].each { |key| ps[fs[key]] = params[key] }
	Browse.create(ps).save
	redirect '/'
end

post '/generate_txt' do
	start_date = params[:start_date]
	end_date = params[:end_date]
	generate_txt(start_date, end_date)
end

get '/setup' do
	50.times do 
		ps = { :view_id => "user#{rand(1..10)}",
		       :date => "#{(Time.now + 60 * 60 * rand(10..100)).strftime("%Y-%m-%d %H:%M:%S")}",
					 :page => "#{((1..5).to_a << ['a','b']).flatten.shuffle[0]}",
					 :pos => "#{((1..5).to_a << ['a','c']).flatten.shuffle[0]}",
					 :size => "#{((10..15).to_a << ['b','c']).flatten.shuffle[0]}",
					 :keyword => "#{['gld','baidu','google','facebook','sohu'].shuffle[0]}",
					 :browser => "#{['firefox','ie','chrome','safari'].shuffle[0]}",
					 :domain => "#{['grandsoft.com.cn','glodon.com'].shuffle[0]}"
		}
		ps[:sort] = (ps[:page].to_i - 1) * ps[:size].to_i + ps[:pos].to_i  if ps[:page].to_i > 0 && ps[:pos].to_i > 0 && ps[:size].to_i > 0
		Browse.create(ps).save
	end
	redirect '/'
end
