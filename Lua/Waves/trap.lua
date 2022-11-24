Arena.resize(70, 90)
Encounter.SetVar("wavetimer", 10.0)
timer = 0
bullets = {}
count = 0

function Update()

	timer = timer + 1

	if timer < 2 then
		Audio.PlaySound('build')
	end

	if(timer % 40 == 0) then
		local bullet = CreateProjectile('spike', -15 + (math.random(2)-1)*30, 45)
		bullet.SetVar('set', 60)
		bullet.SetVar('active', 0)
		table.insert(bullets,bullet)
	end

	for i=1, #bullets do
		local bullet = bullets[i]
		if bullet.isactive then
			set = bullet.GetVar('set')
			if set <= 0 then
				if bullet.GetVar('active') == 0 then
					bullet.SetVar('yvel', 5)
					Audio.PlaySound('trap')
					bullet.SetVar('active', 1)
				end
				bullet.MoveTo(bullet.x, bullet.y-5)
			else
				bullet.SetVar('set', set-3)
			end
		end
	end
end