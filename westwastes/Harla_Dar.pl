# Shroud of the Dar Brood

sub EVENT_SAY {
  if ($faction <= 4) {
    if ($text=~/hail/i) {
      quest::say("I do not have time for you now, $name. My son is lost, and you can not help me.");
    }
    if ($text=~/son/i) {
      quest::say("Have you seen him? I must find him, he has been gone far to long! If you have harmed him, I will slay you and all of your race! Tell me where he is!");
    }
  }
}

sub EVENT_ITEM {
  if ($faction <= 4) {
    if (plugin::check_handin(\%itemcount, 27260 => 1)) {
      quest::say("This...this is not what I had hoped for. My whelp is lost, but I take some comfort in knowing that you helped destroy his killer. Zlandicar has been a blight upon our race since the beginning. Here is your reward, as I promised. It will protect you in more ways than are obvious. Leave me now, it is time to mourn.");
      quest::summonitem(27261);
      quest::exp(150000);
      quest::faction(430,10);   #Claws of Veeshan
      quest::faction(436,10);  #Yelinak
      quest::faction(448,-30); #Kromzek
      quest::ding();
    }
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("I have no time for this foolishness!  Die quickly, so that I may continue my search.");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My son, I have failed you!");
}

# EOF zone: westwastes ID: 120057 NPC: Harla_Dar
