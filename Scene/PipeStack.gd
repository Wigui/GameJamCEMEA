extends Area2D

var Pipe=preload("res://Scene/Pipe.tscn")
export(NodePath) var world
var joueur_la = false
var player

func _ready():
	assert(world)
	world = get_node(world)

func _on_Area2D_body_entered(body):
	if body.get_class()=="Player":
		joueur_la=true
		player=body

func _on_Area2D_body_exited(body):
	if body.get_class()=="Player":
		joueur_la=false

func _input(event):
	if event.is_action_pressed("attraper") and joueur_la:
		var instance = Pipe.instance()
		instance.global_position=global_position
		world.add_child(instance)
		player.attraper(instance)

func get_class():
	return "PipeStack"