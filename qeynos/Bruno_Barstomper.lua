function event_signal(e)
  e.self:Say("Yeah, Yeah. I hope you fall in, you little creep.");
end

function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say(string.format("Greetings, %s.  Welcome to Fish's Ale.  Have fun but watch your step.  We get a rough crowd in here and I would hate to have to bust your head in if you started trouble.",e.other:GetName()));
  end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("That's it, swine!  You're outta here!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end
