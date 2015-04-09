if myHero.charName ~= "Zac" then return to end
--[[
  Zac SWAG
	By Megarr
	--]]
	local ts = TargetSelector(TARGET_LOW_HP_PRIORITY,650)
	local qRange = 550
	local wRange = 350
	local rRange = 300
	
function OnLoad()
	ZacConfig = scriptConfig("Zac SWAG", "ZacSWAG")
	ZacConfig:addParam("Combo", "Combo mode", SCRIPT_PARAM_ONKEYDOWN, false, 32)
	ZacConfig:addParam("DrawCircles", "Draw Circles", SCRIPT_PARAM_ONOFF, true)
	ZacConfig:permaShow("Combo")
	end
	-- Execute 10 times per second
	function OnTick()
	-- Make the target selectoor look for closer enemys again
  ts.update()
	
	--Enemy near ?
	if (ts.target ~= nil) then
	
	-- Spacebar pressed ?
  if (Config.combo) then
	-- Can we cast Q ?
  if (myHero:CanUseSpell (_Q) == READY) then
	-- Cast spell on enemy
	CastSpell(_Q, ts.target.x,ts.target.z)
	end
	
	-- Can we cast W ?
	if (myHero:CanUseSpell(_W) == READY) then
	-- Cast spell on enemy
	CastSpell (_W)
	end
end
end
end

--Drawing graphics
function OnDraw()
--Draw circles only if activated on menu
if (Config.drawCircle) then
DrawCircle(myHero.x, myHero.y, myHero.z, 650, 0xFFFFF000)
