require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

vc_one = VentureCapitalist.new('Harry', 10250000)
vc_two = VentureCapitalist.new('Ron', 6234204)
vc_three = VentureCapitalist.new('Albus', 500300320)
vc_four = VentureCapitalist.new('Hermione', 1020880450)

s_one = Startup.new('Startup One', 'Yoda', 'Discord')
s_two = Startup.new('Startup Two', 'Luke', 'Instagram')
s_three = Startup.new('Startup Three', 'Vader', 'Facebook')
s_four = Startup.new('Startup Four', 'Padme', 'Twitter')

fr_one = FundingRound.new(s_one, vc_three, 'Angel', 600000)
fr_two = FundingRound.new(s_three, vc_four, 'Seed', 900000)
fr_three = FundingRound.new(s_three, vc_two, 'Pre-Seed', 1600000)
fr_four = FundingRound.new(s_three, vc_two, 'Series A', 200000)
fr_five = FundingRound.new(s_two, vc_three, 'Angel', 3600000)
fr_six = FundingRound.new(s_four, vc_two, 'Angel', 570000)
fr_seven = FundingRound.new(s_three, vc_four, 'Pre-Seed', 430000)
fr_eight = FundingRound.new(s_one, vc_three, 'Series A', 2500000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line