module ChallengesHelper
	def self.convert_date(date)
		date.gsub!('/',',')
	end
	def convert_date(date)
		ChallengesHelper.convert_date(date)
	end
end
