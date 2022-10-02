extends AudioStreamPlayer



func _play(sound):
	volume_db = 2
	self.stream = load("res://Music/"+sound+".mp3")
	if(not Muter.get_mute()):
		play()
	
	if connect("finished", self, "reset_to_default"):
		print("An error has occurred: could not connect the sound")


func reset_to_default():
	queue_free()
