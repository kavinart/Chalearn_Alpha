module ChallengesHelper
	def self.convert_date(date)
		return date.gsub!('/',',')
	end
	def convert_date(date)
		return ChallengesHelper.convert_date(date)
	end
end
