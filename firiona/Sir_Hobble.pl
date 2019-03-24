#Zone: Firiona  NPC: Sir_Hobble (84297)
#Qadar

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("holds a cracked monocle up to his squinty eye. 'I say!! A talking bear!! Squire Fuzzmin, come and take a gander at this rare find. The wonders never cease in the land of Kunark!!'");
    quest::setglobal("hobble",$npc->GetID(),3,"F");   # Set global $hobble with Sir_Hobble's NPC ID so Squire_Fuzzmin can follow
	my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::spawn2(84312,0,0,$x,$y,$z,$h);
    #quest::unique_spawn(84312,0,0,1985,-2243,-75);      # Spawn Squire_Fuzzmin for Wurmslayer quest
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
# For Wurmslayer quest
# Quest depends on Squire_Fuzzmin.pl in Firiona for complete functionality