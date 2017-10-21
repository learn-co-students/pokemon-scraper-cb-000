class Pokemon

	attr_accessor :id, :hp
	attr_reader :name, :type, :db


	def initialize(name="No name", type="card", hp=nil, db=SQLite3::Database.new('test'))
		@name = name
		@type = type
		@db = db
		@hp = hp
		#@hp = db.execute("SELECT hp FROM pokemon WHERE name = ?", @name)
	end

	def self.save(name, type, db)
    	 db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  	end

		def self.find(id, db)
			#@sql_runner.execute_create_hp_column
			name = db.execute("SELECT name FROM pokemon WHERE (id = (?)) LIMIT 1", id)
			name = name.to_s.tr('[]\"', '')
			type = db.execute("SELECT type FROM pokemon WHERE (id = (?)) LIMIT 1", id)
			type = type.to_s.tr('[]\"', '')
			#hp = db.execute("SELECT hp FROM pokemon WHERE (id = (?)) LIMIT 1", id)
			#hp = type.to_s.tr('[]\"', '').to_i
			poke = Pokemon.new(name, type)
			poke.id = id
			#poke.hp = 60
			poke
		end

		def alter_hp(new_hp, db)
			db.execute("UPDATE pokemon SET hp = (?) WHERE (name = (?))", new_hp, self.name)
			@hp = new_hp
		end

end
