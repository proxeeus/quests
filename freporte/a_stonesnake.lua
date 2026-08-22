function event_combat(e)
	if(e.joined) then
		e.self:Emote(eq.ChooseRandom(
										"hisses and strikes!",
										"rattles and strikes!"
									 ));
	end
end
