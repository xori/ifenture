
$session = {}
# VERB NOUN1 [GARBAGE NOUN2]
# 	=> NOUN1.VERB(NOUN2) || NOUN2.VERB(NOUN1)
class GO

	def trim (str)
		o = str
		o = o.strip.split(" ")
		["with", "about", "on", "a", 
		 "is", "the", "into","of", "from"].each do
			|garbage| o.delete(garbage)
		end
		return o
	end

	def parse (str)
		notFound if !str || str.empty?

		@query = trim (str)
		if @query.length < 2
			puts "Do what with the " + @query[0],"\n"
			return
		end
		verb, noun, noun2 = @query

		notFound if !$session.keys.include?(noun)
		@obj = $session[noun]
=begin
	check - @obj.respond_to?(verb)
	check - @obj.method(verb.to_sym).arity == 2
=end
		if !@obj
			notFound
		elsif ! @obj.respond_to?(verb)
			notFound
		else
			@obj.send(verb,"ME-OBJECT", noun2)
		end
	end

	def notFound () 
		throw "Command not found"
	end
end

class Person
	def ask (person, ref = 'hi')
		if (ref == "joe")
			puts "We don't talk about him here..."
		else
			puts "Hi " + ref
		end
	end
	def kill (person, ref)
		puts "Killed Person"
	end
end

$session["Fred"] = Person.new
parser = GO.new

while true
	begin
		parser.parse gets.strip
	rescue
		puts 'Command not found'
	end	
end