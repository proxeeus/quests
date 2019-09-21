# Zordak_Ragefire.pl
# NPC: 32038
# EPIC CLERIC (Soldungb)

sub EVENT_SAY {
	if ($text =~/hail/i){
		quest::emote("Zordak Ragefire stares at you with unblinking eyes. A wide grin crosses Zordak's face and flames flicker in the depths of his eyes.");
		quest::say("Welcome to the new fortress of the Plasmatic Priesthood! It's a shame about Lord Nagafen's untimely death, really it is! Such a powerful and noble creature should not perish at the hands of mortals.");
	}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,28054=>1)) { # Shimmering Pearl
	quest::emote("laughs maniacally as he crushes the pearl in his hands with inhuman strength. 'The Triumvirate missionaries think their petty magic can affect me!! I will send your heads to Omat as a symbol of what is to come for all of his missionaries!'");
	quest::unique_spawn(32084,0,0,$x,$y,$z); #KOS Human form
	quest::depop();
  }

  else {
    quest::say("I have no need of this, $name.");
    plugin::return_items(\%itemcount);
  }
}

#End of File, Zone:soldungb  NPC:32038 -- Zordak Ragefire