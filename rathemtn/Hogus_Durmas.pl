#########################################################
# Hogus Durmas (ID:50296)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: Hall of Durmas combat shout
#########################################################

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("Your hide will make a fine rug in the Hall of Durmas!");
   }
}
