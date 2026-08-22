sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::emote("narrows his eyes and gives a cruel, sinister smirk of delight as he gives a stunning display of grace in readying his blades, 'How marvelous to find one who invites death so openly. Come, let us dance and allow me the pleasure of delivering you unto the hands of the fate you so desire.");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::emote("staggers for a moment, his blades dropping from his shaking hands. His eyes wide upon his beautiful, marred face, Fittorin gasps one last breath before crumbling to the ground in a lifeless heap.");
}
