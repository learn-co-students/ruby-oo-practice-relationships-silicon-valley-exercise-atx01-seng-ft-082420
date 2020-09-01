class Startup
    attr_accessor :name, :domain
    attr_reader :founder
    @@all = []
    def initialize(name, founder, domain)
        @name = name.to_s
        @founder = founder.to_s
        @domain = domain.to_s
        self.class.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain)
        self.domain = domain
    end

    def self.find_by_owner(name)
        self.all.find do |startup|
            startup.name
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(vc_object, type, investment)
        FundingRound.new(self, vc_object, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select do |fr|
            fr.startup == self
        end.count
    end

    def funding_rounds
        FundingRound.all.select do |fr|
            fr.startup == self
        end
    end

    def total_funds
        self.funding_rounds.map do |fr|
            fr.investment
        end.inject(0, :+)
    end

    def investors
        self.funding_rounds.map do |fr|
            fr.venture_capitalist
        end.uniq
    end

    def big_investors
        self.investors.select do |inv|
            inv.total_worth >= 1000000000
        end.uniq
    end
end