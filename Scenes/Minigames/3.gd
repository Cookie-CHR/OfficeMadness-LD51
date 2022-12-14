extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var text = preload("res://Sprites/Text_file.png")
var image = preload("res://Sprites/Img_file.png")
var music = preload("res://Sprites/Music_file.png")
var virus = preload("res://Sprites/Virus.png")
var count_viruses = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var rows = min(4+int(0.02*GlobalTimer.seconds_passed), 5)
	var columns = min(7+int(0.15*GlobalTimer.seconds_passed), 8)
	var count_files = rows*columns
	for i in range(count_files):
		var button = TextureButton.new()
		
		add_child(button)
		button.set_position(Vector2((i%columns)*80+35*(9-columns), (i/columns)*75+140))
		var r = randi()%5
		if r<=1:
			button.texture_normal = virus
			count_viruses+=1
			button.connect("pressed", self, "on_virus_found", [button])
		elif r==2:
			button.texture_normal = text
		elif r==3:
			button.texture_normal = image
		elif r==4:
			button.texture_normal = music
		button.name = str(i)
		

func on_virus_found(v):
	v.hide()
	count_viruses -=1
	if count_viruses <= 0:
		MManager.on_finished()

