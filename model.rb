
DataMapper.setup(:default, ENV["DATABASE_URL"] || "sqlite3://#{Dir.pwd}/development.db")

class Browse
	include DataMapper::Resource

	# All fields with type in the model browse
	property :id, Serial
	property :view_id, String
	property :date, DateTime
	property :page, String
	property :pos, String
	property :size, String
	property :sort, Integer, :default => 0
	property :keyword, String
	property :browser, String
	property :domain, String

end


DataMapper.finalize
DataMapper.auto_upgrade!
