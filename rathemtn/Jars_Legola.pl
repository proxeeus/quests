#########################################################
# Jars Legola (ID:50287)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: House Legola combat shout
#########################################################

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("None shall flee from the might of House Legola!");
   }
}
