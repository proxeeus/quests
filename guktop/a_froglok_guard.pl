sub EVENT_COMBAT
{
  if($combat_state == 1)
  {
    quest::say("Frrroooaaakkk!");
    quest::say("${class}s like you are better left dead than alive.");
  }
}
