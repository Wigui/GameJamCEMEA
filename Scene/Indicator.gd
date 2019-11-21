extends Area2D

var peut_placer = true

func _process(delta):
	print(peut_placer)

func _on_Indicator_body_entered(body):
	if body.get_class()=="Pipe":
		peut_placer=false


func _on_Indicator_body_exited(body):
	if body.get_class()=="Pipe":
		peut_placer=true
