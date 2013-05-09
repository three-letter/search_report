
get '/' do
	@bs = Browse.all
	erb :index
end

get '/list/*_*' do
	ps = params[:splat]
	@bs = last_date_by_str(ps[0],ps[1])
	erb :index
end

get '/search' do
	ps = {}
	[:vi, :dt, :pn, :pos, :c, :kw, :bn, :dm].each { |key| ps[key] = params[key] }
	Browse.create(ps).save
	redirect '/'
end

get '/setup' do
	50.times do 
		ps = { :vi => "user#{rand(1..10)}",
		       :dt => "#{(Time.now + 60 * 60 * rand(10..100)).strftime("%Y-%m-%d %H:%M:%S")}",
					 :pn => "#{rand(1..5)}",
					 :pos => "#{rand(1..10)}",
					 :c => "#{rand(10..15)}",
					 :kw => "#{['gld','baidu','google','facebook','sohu'].shuffle[0]}",
					 :bn => "#{['firefox','ie','chrome','safari'].shuffle[0]}",
					 :dm => "#{['grandsoft.com.cn','glodon.com'].shuffle[0]}"
		}
		Browse.create(ps).save
	end
	redirect '/'
end
