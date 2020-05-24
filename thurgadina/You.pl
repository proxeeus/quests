# flavor dialogue during the seventh prayer shawl quest
# 
# this is the npc on live servers that responds to the player reciting prayer to brell.


sub EVENT_SIGNAL {
  if ($signal == 33) {
    quest::emote("can feel a strong presence beginning to take shape in the chapel. Perhaps you should recite the prayer again.");
  }
  elsif ($signal == 66) {
    quest::emote("sense a being of great power focusing its attention on you.");
  }
  elsif ($signal == 99) {
    quest::emote("have been inspired. The sacred pattern of the Coldain rune materializes on the ground before you. ");
	quest::creategroundobject(1855, 801, -319,  -11,  $npc->GetHeading(), 300000);
  }
}

# EOF zone: thurgadina ID: 115230 NPC: You

