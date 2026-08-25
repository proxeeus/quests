#########################################################
# Rell Ostodl (ID:50277)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: House of Ostodl combat shout
#########################################################

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("The hand of the House of Ostodl shall cut you down.");
   }
}
