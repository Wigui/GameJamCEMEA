extends KinematicBody2D

var velocite = Vector2()
export var vitesse = 400
var tuyau
var ancien_tuyau

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	_check_control()
	move_and_slide(velocite)
	if tuyau:
		tuyau.global_position=global_position #self.global_position

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
		interagir() 
	if Input.is_action_just_released("attraper"):
		lacher()

func interagir(): 
	var objet = $GrabArea.get_nearest_object() #get_node("noeud").function au lieu de $ pour appeler un script qui se situe dans le même noeud
	if not objet:
		return
	if objet.get_class()=="Pipe":
		attraper(objet)
	if objet.get_class()=="FixedPipe":
		tourner(objet)

func attraper(objet):
	if not objet:
		return
	objet.get_node("CollisionShape2D").disabled=true
	tuyau=objet
	objet.global_position=global_position
	objet.z_index=1

func lacher():
	if not tuyau:
		return
	tuyau.get_node("CollisionShape2D").disabled=false
	tuyau.global_position = tuyau.global_position.snapped(Vector2(32,32))
	tuyau.z_index=0
	ancien_tuyau=tuyau
	add_collision_exception_with(ancien_tuyau)
	tuyau = null
	
func tourner(objet):
	objet.rotation_degrees = int(objet.rotation_degrees+90)%360

func _on_OverlapArea_body_shape_exited(body_id, body, body_shape, area_shape):
	if ancien_tuyau and body==ancien_tuyau:
		remove_collision_exception_with(ancien_tuyau)
		ancien_tuyau=null
