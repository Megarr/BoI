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
	ZacConfig:addParam("DrawQ", "Draw _Q", SCRIPT_PARAM_ONOFF, false)
	ZacConfig:addParam("DrawW", "Draw _W", SCRIPT_PARAM_ONOFF, false)
	ZacConfig:addParam("DrawE", "Draw _E", SCRIPT_PARAM_ONOFF, false)
	ZacConfig:addParam("DrawR", "Draw _R", SCRIPT_PARAM_ONOFF, false)
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
	CastSpell(_Q, ts.target.x, ts.target.z)
	end
	
	-- Can we cast W ?
	if (myHero:CanUseSpell(_W) == READY) then
	-- Cast spell on enemy
	CastSpell (_W, ts.target)
	
	-- Can we cast E ?
	if (myHero:CanUseSpell(_E) == READY) then
	CastSpell (_E, ts.target.x, ts.target.z)
	end
	end
end
end
end

--Drawing graphics
function OnDraw()
--Draw circles only if activated on menu
if (ZacConfig.drawQ) and not myHero.dead then
DrawCircle(myHero.x, myHero.y, myHero.z, 550, 0xFFFFF000)
if (ZacConfig.drawW) and not myHero.dead then
DrawCircle(myHero.x, myHero.y, myHero.z, 350, 0xFFFFF000)
if (ZacConfig.drawE) and not myHero.dead then
DrawCircle(myhero.x, myHero.y, myHero.z, 1150,0xFFFFF000)
if (ZacConfig.drawR) and not myHero.dead then
DrawCircle(myhero.x, myHero.y, myHero.z, 300, 0xFFFFF000)
