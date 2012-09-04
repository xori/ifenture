class BrassLamp
	private 
		@stat = :off
		@index = ["lantern","lamp"]
		@shortDesc = "a brass lantern"
		# status lantern
		def status (player, ref)
			if (@stat == :off)
				puts "Brass Light is off"
			else
				puts "Brass Light is on"
		end
	public
		def examine (player, ref)
			puts "Medium sized smooth brass lantern\n" + status
		end
		
		def turnoff (player, ref)
			@stat = :off
			puts status (player, ref)
		end
		def turnon (player, ref)
			@stat = :on
			puts status (player, ref)
		end
end