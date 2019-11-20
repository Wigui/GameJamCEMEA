extends KinematicBody2D

var velocite = Vector2()
export var vitesse = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	_check_control()
	move_and_slide(velocite)

func _check_control():
	if Input.is_action_pressed("ui_right"):
		velocite.x = vitesse
	elif Input.is_action_pressed("ui_left"):
		velocite.x = -vitesse
	elif Input.is_action_pressed("ui_down"):
		velocite.y = vitesse
	elif Input.is_action_pressed("ui_up"):
		velocite.y = -vitesse
	else: 
		velocite = Vector2(0,0)
	if Input.is_action_just_pressed("attraper"):
		$GrabArea.attraper() #get_node("noeud").function au lieu de $ pour appeler un script qui se situe dans le même noeud



