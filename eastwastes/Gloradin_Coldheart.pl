sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 1093 => 1)) {
    quest::say("Thank you. I will return to the Dain and inform him that the battle is underway. Please escort Garadain to the battlefield and see that he returns safely. May Brell bless you and bring you victory over these beasts.");
    quest::settimer("spawn1",5);
    quest::depop(116084);
  }
  else {
    plugin::return_handin(\%itemcount);
  }
}

sub EVENT_TIMER {
  if($timer eq "spawn1") {
    quest::stoptimer("spawn1");
#Garadain Glacierbane
    quest::spawn2(116084,236,0,-389.6,-2713.6,181,38); # NPC: Garadain_Glacierbane
#royal wolven guard
    quest::spawn2(116563,0,0,790.9,-2497.6,168.6,337); # NPC: Royal_Wolven_Guard		#grid 238
    quest::spawn2(116578,0,0,799.8,-2491.6,169.1,337); # NPC: Royal_Wolven_Guard		#grid 239
    quest::spawn2(116579,0,0,808.4,-2485.8,169.6,337); # NPC: Royal_Wolven_Guard		#grid 240
    quest::spawn2(116580,0,0,817,-2480.1,170.1,337); # NPC: Royal_Wolven_Guard		#grid 241
    quest::spawn2(116581,0,0,779.6,-2480.4,168,337); # NPC: Royal_Wolven_Guard		#grid 242
    quest::spawn2(116582,0,0,788,-2474.8,168.5,337); # NPC: Royal_Wolven_Guard		#grid 243
    quest::spawn2(116583,0,0,796.7,-2469,169,337); # NPC: Royal_Wolven_Guard			#grid 244
    quest::spawn2(116584,0,0,805.6,-2463,169.4,337); # NPC: Royal_Wolven_Guard		#grid 245
#priest of brell
    quest::spawn2(116541,0,0,796.2,-2506.7,168.9,337); # NPC: Priest_of_Brell		#grid 246
    quest::spawn2(116585,0,0,805.1,-2500.8,169.4,337); # NPC: Priest_of_Brell		#grid 247
    quest::spawn2(116586,0,0,814,-2494.9,169.9,337); # NPC: Priest_of_Brell			#grid 248
    quest::spawn2(116587,0,0,822.9,-2489,170.4,337); # NPC: Priest_of_Brell			#grid 249
    quest::spawn2(116588,0,0,773.4,-2471.7,167.7,337); # NPC: Priest_of_Brell		#grid 250
    quest::spawn2(116589,0,0,782.2,-2465.9,168.2,337); # NPC: Priest_of_Brell		#grid 251
    quest::spawn2(116590,0,0,791.2,-2459.8,168.6,337); # NPC: Priest_of_Brell		#grid 252
    quest::spawn2(116591,0,0,799.7,-2454.2,169.1,337); # NPC: Priest_of_Brell		#grid 253
#royal archer
    quest::spawn2(116555,0,0,801.8,-2515.1,169.2,337); # NPC: Royal_Archer			#grid 254
    quest::spawn2(116592,0,0,810.8,-2509.1,169.7,337); # NPC: Royal_Archer			#grid 255
    quest::spawn2(116593,0,0,819.6,-2503.3,170.2,337); # NPC: Royal_Archer			#grid 256
    quest::spawn2(116594,0,0,828.5,-2497.3,170.7,337); # NPC: Royal_Archer			#grid 257
    quest::spawn2(116595,0,0,767.5,-2462.8,167.4,337); # NPC: Royal_Archer			#grid 258
    quest::spawn2(116596,0,0,775.9,-2457.2,167.8,337); # NPC: Royal_Archer			#grid 259	
    quest::spawn2(116597,0,0,784.9,-2451.2,168.3,337); # NPC: Royal_Archer			#grid 260
    quest::spawn2(116598,0,0,793.7,-2445.3,169.2,337); # NPC: Royal_Archer			#grid 261
#paladin of brell
    quest::spawn2(116549,0,0,808.4,-2523.6,169.6,337); # NPC: Paladin_of_Brell		#grid 262
    quest::spawn2(116599,0,0,817.1,-2517.8,170.1,337); # NPC: Paladin_of_Brell		#grid 263
    quest::spawn2(116600,0,0,825.8,-2512,170.5,337); # NPC: Paladin_of_Brell			#grid 264
    quest::spawn2(116601,0,0,834.4,-2506.3,171.0,337); # NPC: Paladin_of_Brell		#grid 265
    quest::spawn2(116602,0,0,761.7,-2453.8,167,337); # NPC: Paladin_of_Brell			#grid 266
    quest::spawn2(116603,0,0,770.6,-2447.8,167.7,337); # NPC: Paladin_of_Brell		#grid 267
    quest::spawn2(116604,0,0,779.4,-2442,168.8,337); # NPC: Paladin_of_Brell			#grid 268
    quest::spawn2(116605,0,0,787.8,-2436.4,169.8,337); # NPC: Paladin_of_Brell		#grid 269
#ry'gorr elite
    quest::spawn2(116556,0,0,389.9,-3451.6,146.7,498); # NPC: Ry`Gorr_Elite
    quest::spawn2(116556,0,0,392,-3476.5,146.6,498); # NPC: Ry`Gorr_Elite
    quest::spawn2(116556,0,0,364.6,-3451.7,146.7,498); # NPC: Ry`Gorr_Elite
    quest::spawn2(116556,0,0,366.5,-3477.6,146.6,498); # NPC: Ry`Gorr_Elite
    quest::spawn2(116556,0,0,450.2,-3449.3,146.7,498); # NPC: Ry`Gorr_Elite
    quest::spawn2(116556,0,0,451.7,-3475.3,146.6,498); # NPC: Ry`Gorr_Elite
    quest::spawn2(116556,0,0,475.4,-3447.9,146.7,498); # NPC: Ry`Gorr_Elite
    quest::spawn2(116556,0,0,476.9,-3473.5,146.7,498); # NPC: Ry`Gorr_Elite
#kromrif soldier
    quest::spawn2(116548,0,0,339.5,-3453.3,146.7,498); # NPC: Kromrif_Soldier
    quest::spawn2(116548,0,0,341,-3478.5,146.7,498); # NPC: Kromrif_Soldier
    quest::spawn2(116548,0,0,313.6,-3454.2,146.8,498); # NPC: Kromrif_Soldier
    quest::spawn2(116548,0,0,315.1,-3479.9,146.7,498); # NPC: Kromrif_Soldier
    quest::spawn2(116548,0,0,500.9,-3446.9,146.8,498); # NPC: Kromrif_Soldier
    quest::spawn2(116548,0,0,502.4,-3471.9,146.7,498); # NPC: Kromrif_Soldier
    quest::spawn2(116548,0,0,526.2,-3445,146.8,498); # NPC: Kromrif_Soldier
    quest::spawn2(116548,0,0,527.7,-3470.6,146.8,498); # NPC: Kromrif_Soldier
#kromrif soldier inside fort
    quest::spawn2(116548,0,0,442.6,-3592.8,146.4,510); # NPC: Kromrif_Soldier
    quest::spawn2(116548,0,0,406,-3592.8,146.3,510); # NPC: Kromrif_Soldier
#oracle of ry'gorr
    quest::spawn2(116006,0,0,433.3,-3593,146.3,510); # NPC: Oracle_of_Ry`Gorr
#chief ry'gorr, head dropping version
    quest::spawn2(116575,0,0,425.9,-3593.2,146.3,510); # NPC: #Chief_Ry`Gorr
#Firbrand the black
    quest::spawn2(116012,0,0,416.2,-3592.8,146.3,510); # NPC: Firbrand_the_Black
#ringeightcoord
    quest::spawn2(116576,0,0,0,0,0,0); # NPC: ringeightcoord
    quest::depop_withtimer();
  }
}#END of FILE Zone:eastwastes  ID:116138 -- Gloradin_Coldheart 
