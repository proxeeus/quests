#########################################################
# Bunk Odon (ID:50283)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: House of Odon combat shout
#########################################################

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("To the Overworld with you, foul beast! The House of Odon is upon you!");
   }
}
