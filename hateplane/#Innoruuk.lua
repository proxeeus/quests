function event_slay(e)
	e.self:Say("I feel your rage as your body fights for life.  You feed me well! My children, your father protects you, praise to him!");
end

function event_death_complete(e)
	e.self:Say("This is no victory,  mortals!  We shall meet again, and I WILL exact my revenge.");
end