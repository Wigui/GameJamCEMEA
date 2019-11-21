extends Area2D

var objets_superposes = []
onready var parent = get_parent()

func _on_GrabArea_body_entered(body):
	objets_superposes.append(body)

func _on_GrabArea_body_exited(body):
	objets_superposes.erase(body)

func get_nearest_object():
	if objets_superposes.size()<=0:
		return
	var min_distance
	var objet_proche
	for objet in objets_superposes:
		var distance = objet.global_position.distance_to(global_position)
		if objet != parent:
			if not min_distance:
				min_distance = distance
				objet_proche = objet
			if distance <= min_distance:
				min_distance = distance
				objet_proche = objet
	print(objet_proche)
	return objet_proche