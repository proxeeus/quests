sub EVENT_SAY
{ 
  if($text=~/hail/i)
  {
    quest::say("How are you? You'd better have a good reason for bothering me. I am a busy man.");
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

#END of FILE Zone:qey2hh1  ID:2306 -- Guard_McCluskey 

