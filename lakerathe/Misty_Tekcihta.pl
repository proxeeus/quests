#Zone: Lake Rathetear
#Short Name: lakerathe
#Zone ID: 51
#
#NPC Name: Misty Tekcihta
#NPC ID: 51052
#Quest Status: finished
#

sub EVENT_SAY { 
  if ($text=~/Hail/i) {
    quest::emote("smiles and taps her foot.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20534 => 1)) {
    quest::emote("hands you a small ring.");
    quest::summonitem(20379);
	quest::exp(500);
	quest::ding();
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:lakerathe  ID:51052 -- Misty Tekcihta

