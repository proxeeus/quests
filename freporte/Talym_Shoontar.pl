sub EVENT_SAY
{
   if($text=~/hail/i)
   {
   quest::say("Hello $name, I hope your hunt is going well.");
   }
}

sub EVENT_SIGNAL
{

# Sent from Tlin Bowfright ID-10186
if ($signal == 1)
   {
    quest::say("Antonius Bayle is a blithering fool.");
   
   # Tlin Bowfright ID-10186
   quest::signal(10186,1);
   } 

# Sent from Tlin Bowfright ID-10186
if ($signal == 2)
   {
    quest::say("All right, Tlin! I am going to smash your face in!");
   } 
}

