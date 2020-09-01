class VentureCapitalist
    attr_accessor :name, :total_worth 
    @@all = []
    def initialize(name, total_worth)
        @name = name.to_s
        @total_worth = total_worth.to_i
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |vc|
            vc.total_worth > 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
    end

    def portfolio
        self.funding_rounds.map do |fr|
            fr.startup
        end.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by do |fr|
            fr.investment
        end
    end

    def funding_rounds_invested(domain)
        result = self.funding_rounds.select do |fr|
            fr.startup.domain == domain
        end
        result.map do |fr|
            fr.investment
        end.inject(0, :+)
    end
end