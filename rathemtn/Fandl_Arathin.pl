#########################################################
# Fandl Arathin (ID:50293)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: House of Arathin combat shout
#########################################################

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("Die, beast! The mighty hand of the House of Arathin shall slay thee!");
   }
}
