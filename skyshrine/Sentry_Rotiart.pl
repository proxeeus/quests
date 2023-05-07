# Friend of the Kin - 114437

#

sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 29626 => 1)) {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    my $traitor = quest::spawn2(114437,0,0,$x,$y,$z,$h);
    my $attack = $entity_list->GetMobID($traitor);
    my $traitorattack = $attack->CastToNPC();
    $traitorattack->AddToHateList($client, 1);
    quest::depop();
  }

  else {
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("This one will prevent the invader from going forth.");
  }
}

sub EVENT_DEATH_COMPLETE {
    #Spawns "The velium golem" for the death emote, purely cosmetic.
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    my $emote = quest::spawn2(114588,0,0,$x,$y,$z,$h);
}

# EOF zone: skyshrine ID: 114129 NPC: Sentry_Rotiart



