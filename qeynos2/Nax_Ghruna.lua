

function event_say(e)
	if(e.message:findi("stanos")) then
		e.self:Say("Come over here, bub. Listen to me, and don't say a word. That name is one that can get you killed. Hanns wants Stanos dead, Renux wants to please Hanns, and everyone else wants to keep their spinal column intact, you know? So, "..e.other:GetName()..", now you can speak. Where did you hear that name, or did you actually see Stanos somewhere?");
	end
end

