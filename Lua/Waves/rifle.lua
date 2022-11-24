Encounter.SetVar("wavetimer", 6.0)
bullets = {}
timer = 0

function CreateBullet(x, y)
	bullet = CreateProjectile("bullet", x, y)
	table.insert(bullets, bullet)
end

function Update()
	
	if timer % 3 == 0 then
	
			xPos = math.random(-Arena.width/3 - 400,Arena.width/3 + 400)
			yPos = math.random(-Arena.height/3 - 40,Arena.height/3 + 40)
			CreateBullet(xPos, yPos)
			if timer % 6 == 0 then
				Audio.PlaySound('ar')
			end
		
	end
	
	for i = #bullets, 1, -1
	do
		currentBullet = bullets[i]
		
		currentBullet.Move(-7, 0)
		
		if currentBullet.x < -270 then
			currentBullet.Remove()
			table.remove(bullets, i)
		end
	end
	
	timer = timer + 1
end