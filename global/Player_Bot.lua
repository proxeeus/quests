function event_combat(e)
	
end

function event_spawn(e)
	e.self:Say("Yo!");
	eq.set_timer("player_bot_init", 1);
	e.self:Say("Timer set.");
end

function event_death_complete(e)
	
end

function event_timer(e)
	local luascale = require("lua_scale");
	if(e.timer == "player_bot_init") then
		e.self:Say("My name is "..e.self:GetName().." lmao.");
		e.self:Say("I am level" ..e.self:GetLevel()..".");
		e.self:Say("I am a " ..e.self:GetClass()..".");
		
		luascale.scaleme(e.self, "18", 100);
		e.self:Say("I am level" ..e.self:GetLevel()..".");
		eq.stop_timer("player_bot_init");
	end
end