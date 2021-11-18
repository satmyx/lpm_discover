surface.CreateFont("jujutsu_head", {
    font = "Ninja Naruto",
    extended = false,
    size = 20,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
});

local function DrawName( ply )
	if ( !IsValid( ply ) ) then return end 
	if ( ply == LocalPlayer() ) then return end -- Don't draw a name when the player is you
	if ( !ply:Alive() ) then return end -- Check if the player is alive 
 
	local Distance = LocalPlayer():GetPos():Distance( ply:GetPos() ) --Get the distance between you and the player
	local infoocculte = ply:GetNWInt("DISLPMOCCULTE")
	local grade = ""
	
	if ( Distance < 400 ) then --If the distance is less than 1000 units, it will draw the name

            if tonumber(infoocculte) <= 200 and tonumber(infoocculte) <= 4500 then
                grade = "Peu dangeureux"
				colorgrade = Color(255,255,255,255)
            elseif tonumber(infoocculte) >= 4500 and tonumber(infoocculte) <= 9000 then
                grade = "Dangeureux1"
				colorgrade = Color(255,255,255,255)
			elseif tonumber(infoocculte) >= 9000 and tonumber(infoocculte) <= 13500 then
                grade = "Dangeureux2"
				colorgrade = Color(255,255,255,255)
			elseif tonumber(infoocculte) >= 13500 and tonumber(infoocculte) <= 18000 then
                grade = "Dangeureux3"
				colorgrade = Color(255,255,255,255)
			elseif tonumber(infoocculte) >= 18000 and tonumber(infoocculte) <= 22500 then
                grade = "Dangeureux4"
				colorgrade = Color(255,255,255,255)
			elseif tonumber(infoocculte) >= 22500 and tonumber(infoocculte) <= 27000 then
                grade = "Dangeureux5"
				colorgrade = Color(255,255,255,255)
			elseif tonumber(infoocculte) >= 27000 and tonumber(infoocculte) <= 32000 then
                grade = "Dangeureux6"
				colorgrade = Color(255,255,255,255)
			end
 
		local offset = Vector( 0, 0, 80 )
		local ang = LocalPlayer():EyeAngles()
		local pos = ply:GetPos() + offset + ang:Up()
	 
		ang:RotateAroundAxis( ang:Forward(), 90 )
		ang:RotateAroundAxis( ang:Right(), 90 )
	 	
		cam.Start3D2D( pos, Angle( 0, ang.y, 90 ), 0.25 )

			draw.DrawText( grade, "jujutsu_head", 2, 2, team.GetColor(ply:Team()), TEXT_ALIGN_CENTER )

		cam.End3D2D()
	end
end
hook.Add( "PostPlayerDraw", "DrawName", DrawName )