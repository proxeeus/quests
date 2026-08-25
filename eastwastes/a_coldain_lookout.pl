# Part of Coldain Ring 5 Quest

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30136 => 1)) {
    quest::shout("Aahhh.. You're too late! They're upon us! To arms, men! Death to Scarbrow!");
    my $entid = quest::spawn2(116570, 0, 0, -642, -2591, 190, 0);
    my $mob = $entity_list->GetMobID($entid);
    my $mobnpc = $mob->CastToNPC();
    $mobnpc->SignalNPC(1);

    # Factions: +Coldain, +Dain Frostreaver IV, -Kromrif, -Kromzek
    quest::faction(406, 30);
    quest::faction(405, 30);
    quest::faction(419, -30);
    quest::faction(448, -30);
	quest::exp(100);
	quest::ding();
  }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("I'll hack at your knees 'till you fall down!  Out of love for the Dain, for the glory of the crown!");
  }
}

# Quest by mystic414
