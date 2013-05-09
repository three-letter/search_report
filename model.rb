
DataMapper.setup(:default, ENV["DATABASE_URL"] || "sqlite3://#{Dir.pwd}/development.db")

class Browse
	include DataMapper::Resource

	# All fields with type in the model browse
	property :id, Serial
	property :vi, String
	property :dt, DateTime
	property :pn, Integer
	property :pos, Integer
	property :c, Integer
	property :kw, String
	property :bn, String
	property :dm, String

end


DataMapper.finalize
DataMapper.auto_upgrade!
