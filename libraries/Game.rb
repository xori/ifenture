# GAME SETUP MODULE

# Load ALL the game modules.
Dir[File.join(
	File.join(File.dirname(__FILE__),'Game','*.rb'))
	].each {|file| require file }

module Game
	class Setup
		$session = 
		{
		:rooms = 
			{
				:castle => Room::Castle.new,
				:hall	=> Room::Hall.new,
				:graveyard => Room::Graveyard.new
				:yard	=> Room::Yard.new
			},
		:player =>	People::Player.new
		}
	end
end

module Room

	class Castle
		def initilaize
			$data[:castle] ||= {}
			@data = $data[:castle]
			
			@data[:stuff] ||= 5
		end
	end

	class Graveyard

	end