function event_combat(e)
	if(e.joined == true) then
		e.self:Say("<BBAAaaaaarrrkkk!!> Your head will make an RRRex-rrex-excellent addition to my collection!");
	end
end

function event_death_complete(e)
	e.self:Say("This act ag-GRRR-grr-ainst the Splitpaws will not go without retribution.. mark.. my.. words..");
end