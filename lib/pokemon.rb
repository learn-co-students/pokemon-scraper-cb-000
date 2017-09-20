class Pokemon

	attr_accessor :id, :name, :type, :hp, :db

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
	end

	def self.find(id, db)
		row = db.execute("SELECT * FROM pokemon WHERE id = ?", [id])[0]
		Pokemon.new(id: row[0], name: row[1], type: row[2], hp: row[3])
	end

	def initialize(hash)
		hash.each do |k,v|
			self.send("#{k}=", v)
		end
	end

	def alter_hp(hp, db)
		db.execute("UPDATE pokemon SET hp=? WHERE id=?", [hp, id])
	end

end
