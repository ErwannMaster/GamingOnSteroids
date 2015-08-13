-- require('Inspired')

-- Config = scriptConfig("AutoLvlUp", "LvlUp.lua")
-- Config.addParam("lvlauto", "Auto Lvl Up Skill", SCRIPT_PARAM_ONOFF, true)
-- Config.addParam("lvlautoulti", "Auto Lvl Up Ulti", SCRIPT_PARAM_ONOFF, true)

PrintChat("Auto lvl Up Loaded")

TableSkill = {}
TableSkill["Aatrox"] = {_E,	_W,	_Q,	_E,	_E,	_R,	_E,	_W,	_E,	_W,	_R,	_W,	_W,	_Q,	_Q,	_R,	_Q,	_Q}
TableSkill["Ahri"] = {_Q, _W, _Q,	_E,	_Q,	_R,	_Q,	_W,	_Q,	_W,	_R,	_W,	_W,	_E,	_E,	_R,	_E,	_E}
TableSkill["Zac"] = {_W, _Q, _E, _E, _E, _R, _E, _W, _E, _W, _R, _W, _W, _Q, _Q, _R, _Q, _Q}
TableSkill["Akali"] = {_Q, _W, _Q, _E, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W}
TableSkill["Alistar"] = {_Q, _W, _E,	_Q,	_Q,	_R,	_Q,	_W,	_Q,	_W,	_R,	_W,	_W,	_E,	_E,	_R,	_E,	_E}

function switch(c)
  local swtbl = {
    casevar = c,
    caseof = function (self, code)
      local f
      if (self.casevar) then
        f = code[self.casevar] or code.default
      else
        f = code.missing or code.default
      end
      if f then
        if type(f)=="function" then
          return f(self.casevar,self)
        else
          error("case "..tostring(self.casevar).." not a function")
        end
      end
    end
  }
  return swtbl
end

function lvlup(x)
	LevelSpell(TableSkill[GetObjectName(myHero)][x])
end


OnLoop(function(myHero)

-- if TableSkill[GetObjectName(myHero)] == nil and Config.lvlautoulti or not config.lvlauto then
if TableSkill[GetObjectName(myHero)] == nil then
	if GetLevel(myHero) == 6 or GetLevel(myHero) == 11 or GetLevel(myHero) == 16 then
		LevelSpell(_R)
	end
else

    
	-- if Config.lvlauto then
	
		switch(GetLevel(myHero)):caseof{
			[1]   = function (x) lvlup(x) end,
			[2]   = function (x) lvlup(x) end,
			[3]   = function (x) lvlup(x) end,
			[4]   = function (x) lvlup(x) end,
			[5]   = function (x) lvlup(x) end,
			[6]   = function (x) lvlup(x) end,
			[7]   = function (x) lvlup(x) end,
			[8]   = function (x) lvlup(x) end,
			[9]   = function (x) lvlup(x) end,
			[10]   = function (x) lvlup(x) end,
			[11]   = function (x) lvlup(x) end,
			[12]   = function (x) lvlup(x) end,
			[13]   = function (x) lvlup(x) end,
			[14]   = function (x) lvlup(x) end,
			[15]   = function (x) lvlup(x) end,
			[16]   = function (x) lvlup(x) end,
			[17]   = function (x) lvlup(x) end,
			[18]   = function (x) lvlup(x) end,
			default = function (x) PrintChat("Lvl Number Error : " .. x)  end,
			missing = function (x) PrintChat("error") end,
		}
	
	-- end
	
end

	

end)
