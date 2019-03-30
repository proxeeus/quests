sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("sighs heavily and after a long while says, 'Leave us, Iksar. Leave us to our eternal damnation.");
    }
  if ($text=~/curse/i) {
    quest::emote("twists his face into a frown and says, 'You read what's written, Iksar. It's clear enough so we won't bother to explain the details. We can only stand our guard and hope for [redemption].");
  }
  if($text=~/redemption/i){
	quest::emote("grits his teeth and snaps, 'It's very simple, $name! We are fallen! We seek redemption! We guard our 'brothers' here among the Howling Stones until we are relieved. Whether that will ever happen, we do not know. We can only hope that by providing the great warriors of the legion with our [ancient armor], we will earn salvation.");
  }
  if($text=~/ancient armor/i){
	quest::say("You wish the armor of our ancestors? The armor donned by the Guard whose duty was to protect the Chosen? A warrior relies not on strength alone, but many virtues. If a warrior learns to balance each virtue, then he may be fit to guard the Chosen. Each piece of armor reflects a [virtue], and each virtue must be learned before the armor is given.");
  }
  if($text=~/virtue/i){
	quest::say("The virtues symbolized by the armor I keep are confidence and righteousness. The [boots], [greaves], [gauntlets], and [bracers]. Bring me proof that you have mastered these virtues as well as a piece of Banded armor of the type you desire and the appropriate armor shall be yours, $name. If you wish the other pieces you must speak to my brother.");
  }
  if ($text=~/boots/i) {
    quest::say("You wish the boots worn by the ancients? Then you must first master the virtue of confidence. For our brothers of the dead, confidence is the virtue that allows them to control the forces that would tear them apart if they knew it not. When a warrior steps, he must be confident, for a weak step cannot crush your enemies. Take this note to the current Harbinger in Cabilis and learn from him.");
    quest::summonitem(14794);
  }
  if ($text=~/bracer/i) {
    quest::say("The bracers of our ancestors embody righteousness. When we strike, and our forearms are soaked in the blood of our enemies, our purpose must be pure. Else that blood will burn our souls and anger that which we live for. Go and find the Archduke in Cabilis and give him my note. He will teach you of righteousness. For if our chosen did not know righteousness, our people would not be. Go!");
    quest::summonitem(14791);
  }
  if ($text=~/guantlets/i) {
    quest::say("Our hands are our most useful and deadly instruments, after our minds. When we use them other than in service of our lord and ancestors, our actions are false. Without knowing righteousness we can never be sure if our actions are in the name of fear. The Chosen, the Crusaders of Greenmist, know fear intimately. Their actions are never without the blessing of our lord. Take this note to the Archduke. He will recognize my writing and instruct you.");
    quest::summonitem(14792);
  }
  if ($text=~/greaves/i) {
    quest::say("Our legs move us forward. If we move with hesitance we will surely fall and leave our charge exposed. Before you can wear the greaves, you must learn from the Brood of Kotiz. For if they did not wield their powers over the dead with confidence, their life forces would be sucked from them instantly, leaving them empty husks. Take this note to the Harbinger and listen to his instructions.");
    quest::summonitem(14793);
  }
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14813 =>1,3064 =>1 )) {
    quest::summonitem(4983);
    quest::ding();
    quest::exp(10000);
  }  
  if (plugin::check_handin(\%itemcount, 14808 =>1, 3061 =>1  )) {
    quest::summonitem(4980);
    quest::ding();
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 14831 =>1, 3063 =>1 )) {
    quest::summonitem(4982);
    quest::ding();
    quest::exp(10000);
   }
   if (plugin::check_handin(\%itemcount, 14809 =>1,3062 =>1)) {
     quest::summonitem(4981);
     quest::ding();
     quest::exp(10000);
   }
  
  plugin::return_items(\%itemcount);
  }
