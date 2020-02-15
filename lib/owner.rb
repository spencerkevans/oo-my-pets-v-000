class Owner
	attr_accessor 
	attr_reader :name, :species
  	@@all = []
  	@@pets = []

  	def initialize(name)
  		@name = name
  		@species = "human"
  		save
  	end

  	def save
  		@@all << self
  	end

  	def say_species
  		"I am a #{species}."
  	end

  	def self.all 
  		@@all
  	end

  	def self.count
  		@@all.size
  	end

  	def self.reset_all
  		@@all = []
  	end

  	def cats
  		Cat.all.select { |cat| cat.owner == self }
  	end

  	def dogs
  		Dog.all.select { |dog| dog.owner == self }
  	end

  	def buy_cat(name)
  		cat = Cat.new(name, self)
  		@@pets << cat
	end

	def buy_dog(name)
		dog = Dog.new(name, self)
		@@pets << dog
	end

	def walk_dogs
		Dog.all.each do |dog|
			if dog.owner == self
				dog.mood = "happy"
			end
		end
	end

	def feed_cats
		Cat.all.each do |cat|
			if cat.owner == self
				cat.mood = 'happy'
			end
		end
	end

	def sell_pets
		Dog.all.each do |dog|
			if dog.owner == self
				dog.mood = "nervous"
				dog.owner = nil			end
		end
		Cat.all.each do |cat|
			if cat.owner == self
				cat.mood = "nervous"
				cat.owner = nil
			end
		end
	end	

	def list_pets
		"I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
	end
end