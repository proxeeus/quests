function event_combat(e)
	e.self:Say("'You invade my realm, and you kill my vassals! For that I shall strip your flesh, and wear it as tassels.");
end


function event_death(e)
	e.self:Shout("I am dead, this is true. But at least my stupid rhymes are through!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail? You should be on your knees, " .. e.other:GetName() .. "! I suffer you in my realm for the moment, but if you and yours keep on with your attempts to destroy us, this will change. Do not think for a second that my subjects will hesitate to do what I command. I have proven myself in battle time and time again, and will do what is needed in the future. Xorbb learned this the hard way, and I am ready to teach this lesson to anyone else who challenges me.");
	elseif(e.message:findi("xorbb")) then
		e.self:Say("Surely you know of Xorbb? The leader of the evil eyes, his home is in Beholder Gorge, which he calls his own. That will soon change. We drove him out of our ancestral home here, and we will drive him out of 'his' gorge as well. We shall not forget what he subjected us to, his foul minions controlling the very thoughts of our people, enslaving us to his bidding. But he is weak now, weaker than ever before, and we will take advantage of this weakness. Mark my words, the gorge will be cleansed, and all evil eyes will learn the true meaning of revenge.");
	elseif(e.message:findi("revenge")) then
		e.self:Say("We are the Pickclaw. Once we were of Runnyeye, but when Xorbb corrupted our king and took over the citadel, we fled, risking death in the caverns of the Serpent's Spine rather than submit to Xorbb's twisted rule. We grew strong in the tunnels, learning much about warfare and survival. We honed our skills against the masters of High Keep, and we learned much about the ways of magic from those we captured. But we never forgot where we had come from, and we vowed to one day return. When I saw that Xorbb had grown careless and complacent here, while our clan had grown strong, I took back our home. The name Runnyeye it shall keep, as a reminder of who we WERE, but all who I suffer to live here must prove themselves, as Pickclaws, for this is who we ARE!");
	end
end
