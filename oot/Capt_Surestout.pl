# This is to spawn a lesser spirit upon the Capn's death for Shaman epic 1.0

sub EVENT_DEATH_COMPLETE {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(69149,0,0,$x,$y,$z,$h);
  quest::say("You have run me through! Beware the Pirates of Gunthak.. They will avenge me.. Unngh!!");
}


#Submitted by: Jim Mills