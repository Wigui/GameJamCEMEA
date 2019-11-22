extends Area2D

var veut_placer = false
var peut_placer = true
var pos_precedente

signal has_changed_position

func _ready():
	pos_precedente = global_position

func _physics_process(delta):
	if pos_precedente != global_position:
		pos_precedente = global_position
		emit_signal("has_changed_position")

func _on_Indicator_body_entered(body):
	if body.get_class()=="Pipe" or body.get_class()=="PipeStack":
		peut_placer=false


func _on_Indicator_body_exited(body):
	if body.get_class()=="Pipe" or body.get_class()=="PipeStack":
		peut_placer=true
