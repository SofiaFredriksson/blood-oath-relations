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

    def self.least_popular
        self.all.min_by{|cult| cult.followers.length}
    end

    def self.most_common_location

        locs = {}

        self.all.each do |cult|
            if !locs[cult.location]
                locs[cult.location] = 1
            else
                locs[cult.location] += 1
            end
        end 
        locs.max_by{|key, value| value}[0]
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

    def average_age
    total = followers.reduce(0){|sum, follower| sum + follower.age}
    total / self.cult_population
    end

    def my_followers_mottos
        followers.map{|follower| follower.life_motto} 
    end


end