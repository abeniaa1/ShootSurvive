extends CanvasLayer

onready var upgrades = $upgrades
var max_hp = 0

func _ready():
	get_parent().get_node("ui/upgrades"). hide()
	max_hp = get_parent().get_node("player2").hp
	
func _process(delta):
	get_parent().get_node("ui/score").text = str(Global.score)
	var score = Global.score
	var multi = Global.multi
	var mtal = get_parent().get_node("ui/metal")
	var hp = get_parent().get_node("ui/hp")
	mtal.max_value = 50 * multi
	mtal.value = score
	var hitp = get_parent().get_node("player2").hp
	hp.max_value = max_hp
	hp.value = hitp
	
func _upgrade():
	upgrades.show()
	Engine.time_scale = 0.01
	get_parent().get_node("ui/metal").min_value = Global.score
	

func _on_1_button_down():
	var dur = get_parent().get_node("player2").cooldown_dur
	dur -= dur*0.1
	upgrades.hide()
	Engine.time_scale = 1
	get_parent().get_node("player2").cooldown_dur = dur
	var multi = Global.multi
	multi += 1
	Global.multi = multi



func _on_3_button_down():
	upgrades.hide()
	Engine.time_scale = 1
	get_parent().get_node("player2").get_node("throwabls").bombs = true
	var multi = Global.multi
	multi += 1
	Global.multi = multi

func _on_2_button_down():
	upgrades.hide()
	Engine.time_scale = 1
	get_parent().get_node("player2").get_node("throwabls").suriken = true
	var multi = Global.multi
	multi += 1
	Global.multi = multi
