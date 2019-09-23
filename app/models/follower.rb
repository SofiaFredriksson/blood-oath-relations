class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name 
        @age = age 
        @life_motto = life_motto

        @@all << self
    end

    def self.all
        @@all
    end 

    def self.of_a_certain_age(age)
        self.all.select{|follower| follower.age >= age}
    end

    def self.sorted_by_cults_joined
        matched_followers = {}
        self.all.each do |follower| 
            matched_followers[follower] = follower.cults.length
        end
        matched_followers.sort_by{|key, value| value}.reverse
    end

    def self.most_active
        self.sorted_by_cults_joined[0]
    end 

    def self.top_ten
        self.sorted_by_cults_joined[0..9]
    end

    def bloodoaths
        Bloodoath.all.select{|blood| blood.follower == self}
    end

    def cults
        bloodoaths.map{|blood| blood.cult}
    end

    def join_cult(cult)
        Bloodoath.new(cult, self)
    end
end