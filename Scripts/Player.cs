using Godot;
using System;

public class Player : KinematicBody2D
{
	public int Speed = 4700;
	public string Animation = "";
	public string LastInput = "";
	private Vector2 _velocity = new Vector2();


	public override void _PhysicsProcess(float delta)
	{
		var animatedSprite = GetNode<AnimatedSprite>("AnimatedSprite");
		_velocity = new Vector2();
		animatedSprite.Play(Animation);
		
		if (Input.IsActionPressed("ui_right"))
		{
			Animation = "move_right";
			_velocity.x += Speed;
			LastInput = "move_right";
		}
		if (Input.IsActionPressed("ui_left"))
		{
			Animation = "move_left";
			_velocity.x -= Speed;
			LastInput = "move_left";
		}
		if (Input.IsActionPressed("ui_down"))
		{
			Animation = "move_down";
			_velocity.y += Speed;
			LastInput = "move_down";
		}
		if (Input.IsActionPressed("ui_up"))
		{
			Animation = "move_up";
			_velocity.y -= Speed;
			LastInput = "move_up";
		}
		
		if (LastInput == "move_left" && Input.IsActionJustReleased("ui_left"))
		{
			Animation = "idle_left";
		}
		if (LastInput == "move_right" && Input.IsActionJustReleased("ui_right"))
		{
			Animation = "idle_right";
		}
		if (LastInput == "move_up" && Input.IsActionJustReleased("ui_up"))
		{
			Animation = "idle_up";
		}
		if (LastInput == "move_down" && Input.IsActionJustReleased("ui_down"))
		{
			Animation = "idle_down";
		}
		MoveAndSlide(_velocity * delta);
	}
}
