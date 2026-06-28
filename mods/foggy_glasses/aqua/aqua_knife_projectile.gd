extends ArcingProjectile

var final_impact:Vector2
var did_first_impact:=false
var second_travel_speed=200

var spin_time:=0.0

func _ready()->void:
	if load("res://source/enemies/sprites/aqua_sprite.gd").smol:
		$Sprite2D.scale=Vector2.ONE
	super._ready()

func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_collide(velocity * delta)

	if angular_deceleration != 0:
		angular_velocity = move_toward(angular_velocity, decelerate_to, angular_deceleration * delta)

	if look_at_direction:
		added_rotation += angular_velocity * delta
		look_at(global_position + velocity)
		rotation += added_rotation
	else:
		rotation += angular_velocity * delta


	if not visible:
		show()

	if not is_launched:
		return
		
	if (global_position.y >= dest.y and not did_first_impact) or (did_first_impact and signf(velocity.y)==signf(global_position.y-dest.y)):
		if launch_direction == LaunchDirection.LEFT:
			if global_position.x <= dest.x:
				impact()

		elif launch_direction == LaunchDirection.RIGHT:
			if global_position.x >= dest.x:
				impact()

func impact():
	if did_first_impact:
		super.impact()
	else:
		did_first_impact=true
		gravity=0
		dest=final_impact
		look_at_direction=true
		$Sprite2D.texture=load("res://mods/foggy_glasses/aqua/knife_fly.png")
		$Sprite2D.rotation=0
		velocity=(final_impact-global_position).normalized()*second_travel_speed
		
		if global_position.x > final_impact.x:
			launch_direction = LaunchDirection.LEFT
		else:
			launch_direction = LaunchDirection.RIGHT


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not did_first_impact:
		spin_time+=delta*10
		rotation+=PI/2*floorf(spin_time)
		spin_time=fmod(spin_time,1.0)
