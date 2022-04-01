extends Area2D




# Declare member variables here. Examples:
var velocitat = 300 
var direccio = Vector2(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = 90
	position = Vector2(500,300)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direccio = Vector2.ZERO
	
	if Input.is_action_pressed("mou dreta"):
		direccio += Vector2.RIGHT
		$Sprite.rotation_degrees += 90
	if Input.is_action_pressed("mou esquerra"):
		direccio += Vector2.LEFT
		$Sprite.rotation_degrees -= 90
	if Input.is_action_pressed("mou adalt"):
		direccio += Vector2.UP
		$Sprite.rotation_degrees += 90
	if Input.is_action_pressed("mou abaix"):
		direccio += Vector2.DOWN
		$Sprite.rotation_degrees -= 90
	position += direccio.normalized() * velocitat * delta
		


func _on_personatge_area_entered(area : Area2D):
	print(area.name)
	
	if area.is_in_group('vermell'):
		modulate = Color(1,0,0)
		$Sprite.rotation_degrees = 45
	elif area.is_in_group('verd'):
		modulate = Color(0, 1, 0)
		$Sprite.rotation_degrees = -45
	


func _on_personatge_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	modulate = Color(1, 1, 1)
	$Sprite.rotation_degrees = 0 
