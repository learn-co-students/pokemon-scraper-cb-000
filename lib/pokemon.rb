class Pokemon
	attr_accessor :id, :name, :type, :db

	def initialize(id:, name:, type:, db:)
		@id = id
		@name = name
		@type = type
		@db = db
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
	end

	def self.find(id, db)
		pokemon_search = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
		pokemon = Pokemon.new(id: id, name: pokemon_search[1], type: pokemon_search[2], db: db)
	end
end