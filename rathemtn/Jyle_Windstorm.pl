#########################################################
# Jyle Windstorm (ID:50313)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: Paladin of Tunare — spawn benediction + combat shout
#########################################################

sub EVENT_SPAWN {
   quest::say("Let no evil beings stand in the way of the righteousness of the Paladins of Tunare!");
}

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("Run! I have need of the hunt!");
   }
}
