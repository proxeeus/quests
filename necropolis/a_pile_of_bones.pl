sub EVENT_COMBAT {
	if ($combat_state == 1) {
		quest::emote("begins to clatter.");
	}
	quest::depop_withtimer();
        quest::spawn2(123097,0,0,$x,$y,$z,$h);
}

sub EVENT_DEPOP {
	quest::emote("clatters and shakes!");
}
