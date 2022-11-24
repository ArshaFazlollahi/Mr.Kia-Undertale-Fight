Encounter.SetVar("wavetimer", 12.0)
bullets = {}
timer = 0

function CreateBullet(x, y)
	bullet = CreateProjectile("dbullet", x, y)
	table.insert(bullets, bullet)
end

function Update()
	
	if timer % 40 == 0 then

		value = math.random(-60,60)

		for i = 1, 2, 1
		do

			xPos = -Arena.width

			if i == 1 then

				deagle = CreateSprite("deagle")
				deagle.Move(-190, value - 87)

				deagle.loopmode = "ONESHOTEMPTY"
				deagle.SetAnimation({"deagle", "deagle", "deagle", "deagle"}, 1/6)
				CreateBullet(xPos, value)
				Audio.PlaySound('deagle')

			elseif i == 2 then 

				value = value + 75
				if value <=35 then
				deagle = CreateSprite("deagle")
				deagle.Move(-190, value - 87)
				
				deagle.loopmode = "ONESHOTEMPTY"
				deagle.SetAnimation({"deagle", "deagle", "deagle", "deagle"}, 1/6)
				CreateBullet(xPos, value)
				Audio.PlaySound('deagle')
			end

			end

		end
	end
	
	for i = #bullets, 1, -1
	do
		currentBullet = bullets[i]

				currentBullet.Move(30, 0)
		
		if currentBullet.y < -200 then
			currentBullet.Remove()
			table.remove(bullets, i)
		end

	end
	
	timer = timer + 1
	
end