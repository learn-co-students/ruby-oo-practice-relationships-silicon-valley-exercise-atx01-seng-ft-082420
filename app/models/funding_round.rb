class FundingRound
    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist
    @@all = []
    def initialize(startup, venture_capitalist, type, investment = 0)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type.to_s
        @investment = investment.to_f
        if @investment.negative?
            @investment = "Investment must be positive"
        end
        self.class.all << self
    end

    def self.all
        @@all
    end
end
