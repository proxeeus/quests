sub EVENT_SAY 
{ 
  if($text=~/hail/i)
  {
    quest::say("Welcome, traveler. Have I informed you about the travel tax?"); 
  }
}

sub EVENT_COMBAT
{
  if($combat_state == 1)
  {
    quest::say("Time to die, $name.");
    quest::say("Your intolerable reputation insults all this realm!");
  }
}
#END of FILE Zone:qey2hh1  ID:2179 -- Guard_Donlan 

