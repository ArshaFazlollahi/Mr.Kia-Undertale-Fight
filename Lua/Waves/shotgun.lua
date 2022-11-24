timer = 0
Encounter.SetVar("wavetimer", 3)
bullets = {}
count = 0

shotgun = CreateSprite("shotgun", "Top")
	shotgun.Scale(2.00,2.00)
	shotgun.Move(40, 110)

function CreateBullet(x, y)
	bullet = CreateProjectile("pellet", x, y)
	bullet.sprite.rotation = -30
	table.insert(bullets, bullet)
end

function Update()

	if timer % 50 == 0 then

		for i = 1, 5, 1
		do

			xPos = -Arena.width / 2 + i * Arena.width / 4
			yPos = Arena.height / 2 + 10
			CreateBullet(xPos, yPos)
			Audio.PlaySound('shotgun')

			if i == 1 then

				bullet.sprite.rotation = -30
			elseif i == 2 then

				bullet.sprite.rotation = -20
			elseif i == 3 then 

				bullet.sprite.rotation = 0
			elseif i == 4 then 

				bullet.sprite.rotation = 20
			elseif i == 5 then 

				bullet.sprite.rotation = 30
			end

		end
	end
	
	for i = #bullets, 1, -1
	do
		currentBullet = bullets[i]
		
		if i == 1 then

				currentBullet.Move(-14, -30)
			elseif i == 2 then

				currentBullet.Move(-5, -30)
			elseif i == 3 then 

				currentBullet.Move(0, -30)
			elseif i == 4 then 

				currentBullet.Move(5, -30)
			elseif i == 5 then

				currentBullet.Move(14, -30)
			end
		
		if currentBullet.y < -200 then
			currentBullet.Remove()
			table.remove(bullets, i)
			count = count + 1
			if count > 17 then
				shotgun.Remove()
			end
		end
	end
	
	timer = timer + 1
	
end