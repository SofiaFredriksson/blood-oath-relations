class Cult

    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location 
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end

    def self.all 
        @@all
    end

    def self.find_by_name(name)
        self.all.find{|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select{|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        self.all.select{|cult| cult.founding_year == founding_year}
    end

    def bloodoaths 
        Bloodoath.all.select{|blood| blood.cult == self}
    end

    def followers
        bloodoaths.map{|blood| blood.follower}
    end

    def recruit_follower(follower)
        Bloodoath.new(self, follower)
    end

    def cult_population
        followers.count
    end
end