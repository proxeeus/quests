## Watches skiffs status
# Zone: butcher
# AngeloX

sub EVENT_SAY {if ($text=~/hail/i)
	{
	    $x = $npc->GetX();
		$y = $npc->GetY();
		$z = $npc->GetZ();
		quest::say("Hail $name! If it's the Skiffs to Timorous you are waiting for, they will arrive at this pier, you might have to wait a while...");
		$npc->SetHeading(368);
		#$npc->PauseWandering();
	}
}
  

 
