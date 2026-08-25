#########################################################
# Sylp Tyanathin (ID:50284)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: House of Tyanathin combat shout
#########################################################

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("Bow down and die before the House of Tyanathin!");
   }
}
