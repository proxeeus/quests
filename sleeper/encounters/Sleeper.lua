local CONTROLLER_TYPE = 128134; -- StaticShoutOne
local SLEEPER_TYPE = 128094; -- #The_Sleeper
local KERAFYRM_TYPE = 128136; -- #Kerafyrm
local WARDER_TYPES = { 128090, 128091, 128092, 128093 };
local SIGNAL_TYPES = { 119112, 120084, 32040, 73057, 108510, 123011 }; -- nag, vox, klandicar etc

local TOTAL_WARDERS = 0;
-- GRID 37


function ControllerSignal(e)
	if ( e.signal == 1 ) then
		local sleeper = eq.get_entity_list():GetNPCByNPCTypeID(SLEEPER_TYPE);
		if ( not sleeper.valid ) then
			eq.debug("Sleeper NPC is missing; aborting");
			return;
		end

		local kerafyrm = eq.spawn2(KERAFYRM_TYPE, 37, 0, sleeper:GetX(), sleeper:GetY(), sleeper:GetZ(), sleeper:GetHeading()):CastToNPC();
		sleeper:Depop();

		kerafyrm:Shout("I AM FREE!");
		
		for _, t in ipairs(SIGNAL_TYPES) do
			eq.cross_zone_signal_npc_by_npctype_id(t, 1);
		end

	end
end



function WarderDeath(e)
	if(e.self:GetNPCTypeID() == 128093) then		-- Hraashna the Warder
		e.self:Shout("Veeshan, forgive me, I have failed you and all our kind!");
	elseif(e.self:GetNPCTypeID() == 128090) then	-- Nanzata the Warder
		e.self:Say("Woe unto you, pitiful ones, you are about to release something that you cannot comprehend or withstand. The world itself is in peril now.");
	elseif(e.self:GetNPCTypeID() == 128092) then	-- Tukaarak the Warder
		e.self:Say("NO! The Sleeper stirs! Beware, you will unleash DOOM!");
	elseif(e.self:GetNPCTypeID() == 128091) then	-- Ventani the Warder
		e.self:Shout("Warders, I have fallen. Prepare yourselves, these fools are determined to unleash doom!");
	end
	TOTAL_WARDERS = TOTAL_WARDERS + 1;

	if(TOTAL_WARDERS == 4) then
		eq.debug("all warders slain");
		eq.signal(CONTROLLER_TYPE, 1, 2500);
		TOTAL_WARDERS = 0;
	else
		return;
	end
end

function WarderAggro(e)
	if(e.joined) then
		if(e.self:GetNPCTypeID() == 128093) then		-- Hraashna the Warder
			e.self:Shout("IDIOTS! FOOLS! CRETINS! THERE ARE NO ADJECTIVES TO DESCRIBE HOW UTTERLY STUPID YOU ARE FOR COMING HERE!");
		elseif(e.self:GetNPCTypeID() == 128092) then	-- Tukaarak the Warder
			e.self:Shout("I knew letting mindless constructs guard the upper tomb was a mistake! No matter, I shall deal with you myself.");
		elseif(e.self:GetNPCTypeID() == 128090) then	-- Nanzata the Warder
			e.self:Shout("Further proof that all other races are inferior. Only fools would risk waking The Sleeper. But now you shall be dead fools.");
		elseif(e.self:GetNPCTypeID() == 128091) then	-- Ventani the Warder
			e.self:Shout("Foolish mortal, we guard The Sleeper for your sake as well as ours. He must not be allowed to leave this place!");
		end
	end
end

function WarderSlay(e)
	if(e.self:GetNPCTypeID() == 128093) then	-- Hraashna the Warder
		e.self:Say("Ten thousand years of rest here, it feels good to crunch bones and rend flesh again. I'm almost glad you came, if the stakes were not so high.");
	elseif(e.self:GetNPCTypeID() == 128092) then	-- Tukaarak the Warder
		e.self:Say("I must finish you all off quickly and resume my concentration.");
	elseif(e.self:GetNPCTypeID() == 128090) then	-- Nanzata the Warder
		e.self:Say("There is no chance of winning, and if you do win, you lose. I merely hasten the fate you set for yourself when you entered this place.");
	elseif(e.self:GetNPCTypeID() == 128091) then	-- Ventani the Warder
		e.self:Say("I take no pleasure in this killing, but it must be done.");
	end
end

function event_encounter_load(e)
	for _, id in ipairs(WARDER_TYPES) do
		eq.register_npc_event("Sleeper", Event.death_complete, id, WarderDeath);
		eq.register_npc_event("Sleeper", Event.combat, id, WarderAggro);
		eq.register_npc_event("Sleeper", Event.slay, id, WarderSlay);
	end
	
	eq.register_npc_event("Sleeper", Event.signal, CONTROLLER_TYPE, ControllerSignal);
end
