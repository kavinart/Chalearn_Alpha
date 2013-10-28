module ChallengesHelper
	def self.convert_date(x)
		return x.gsub!('/',',')
	end
	def convert_date(x)
		return ChallengesHelper.convert_date(x)
	end
end
