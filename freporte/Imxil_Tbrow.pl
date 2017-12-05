sub EVENT_SAY
{
   if($text=~/hail/i)
   {
      quest::say("There are no greater circles of magic than those of the Teir'Dal.");
   }
}
