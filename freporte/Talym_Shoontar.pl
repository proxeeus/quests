sub EVENT_SAY
{
   if($text=~/hail/i)
   {
   quest::say("Hello $name, I hope your hunt is going well.");
   }
}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM
{

   # itemname ID- itemid
   if($itemcount{0000} == 1)
   {
   
   quest::say("Thanks");
   quest::ding(); quest::exp("0");
   quest::givecash("0","0","0","0");

   ### Random Item choosing if needed
   # $random=int(rand itemid+itemid+itemid);
   # quest::summonitem($randon);

   # itemname ID- itemid
   quest::summonitem("0000");

   # factionname Faction ID - factionid
   quest::faction("0","1");
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

