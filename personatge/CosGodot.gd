extends KinematicBody2D

var velocitat_base = 200
var gravetat = Vector2.DOWN * 980
var velocitat =  Vector2.ZERO
var salt = Vector2.UP * 350

func _physics_process(delta):
	
	velocitat.x = 0
	
	if Input.is_action_pressed("mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou esquerra"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("mou adalt") and is_on_floor():
		velocitat += salt
	
	
	
	velocitat += gravetat * delta
	print(velocitat)
	velocitat = move_and_slide(velocitat, Vector2.UP)
	
	anima(velocitat)

func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $AnimatedSprite
	if velocitat.x > 0:
		animacio.flip_h = false
		animacio.play('camina')
	elif velocitat.x < 0:
		animacio.flip_h = true
		animacio.play('camina')
	
	if velocitat.y < -1:
		animacio.play('salta')
		
	if abs(velocitat.x) < 0.1:
		animacio.play('quiet')
		


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://escenes/escenacosos2.tscn")



func _on_Area2D2_body_entered(body):
	get_tree().reload_current_scene()


func _on_Pinchosescena2_body_entered(body:Node2D):
	if body.is_in_group('Personatge'):
		get_tree().reload_current_scene()


func _on_sostre_body_entered(body):
	get_tree().reload_current_scene()


func _on_lavatramp_body_entered(body):
	get_tree().reload_current_scene()




func _on_porta_inici_body_entered(body):
	get_tree().change_scene("res://escenes/escenacosos.tscn")


func _on_finalbo_body_entered(body):
	get_tree().change_scene("res://escenes/Finaljoc.tscn")
