function event_death_complete(e)
    e.self:Say("Well now, look what you have done here!  Dead I am, as I knew I would be, if not a bit sooner than I would have liked.. But a rotting carcass upon the ground is no fit end for a Dragon.  Grant me this boon, take my heart and hurl it into the fire in the Necropolis, so that my ashes may fly free.");
end

function event_slay(e)
    e.self:Say("I hate wasting food, but when the food comes looking for a fight, what can you do?");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Oh great Veeshan, give this worn shell strength, for I do battle this day in your name!");
	end
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("'Oi, what is this? A ".. e.other:GetRaceName() .. ", if my tired old eyes are not mistaken. Knew it would happen. Sooner rather than later. No stopping the flood now, eh?");
    elseif(e.message:findi("flood")) then
        e.self:Say("The flood of beings to Velious. Starts with a trickle, like all floods. Sweeps the old away in the end, leaving a new landscape. Blessing and shame that I will not be around to see it all unfold.");
    elseif(e.message:findi("be around")) then
        e.self:Say("I will be leaving this world soon enough, I think. Too tired to continue this existence, too jaded to believe tomorrow would be any different than today. Seeing you here is the most exciting thing that has happened to me in aeons, and even that isn't enough to make me want to continue. Yes, it is the Necropolis for me, and the swift embrace of fire, and then my dust shall fly free as I once did.");
    elseif(e.message:findi("fly free")) then
        e.self:Say("Dragons have never been truly free. The Claws, the Ring, the One Who Sleeps, our very nature, all conspire to keep us enslaved. We can not grow beyond what we are now, so doomed we all are. Masters of this world we are not. Your very presence here screams this to any who have ears to hear. The Age of Scale is long past.");
    elseif(e.message:findi("long past")) then
        e.self:Say("It proves how weak and static our race has become. Here you stand, in the most sacred of places, fearing nothing, daring to converse with me. If I were to consume you now, a dozen would appear to replace you. As mighty as Dragonkind is, we can never hope to match the power you wield. Dragons have limits set upon themselves, while you and your kind refuse to accept any limits. We can not compete with that. If only we could throw off these shackles we bind ourselves with.");
    elseif(e.message:findi("cast off the shackles")) then
        e.self:Say("I do not see this happening. Too proud, too sure of ourselves, as a race we could never concede that we have anything to learn from the likes of you. We need a revelation. Something to open our eye, a poke in the rump. The Iksar almost woke us up, they had us united and striving for something for a brief while, but the Iksar Empire was in many ways as doomed as we are, too inflexible. What does not bend will break. The same could be said of the Kromzek.");
    elseif(e.message:findi("kromzek")) then
        e.self:Say("The Kromzek are also clinging to the old ways, they have changed no more than we have over the generations. We kill some,they kill some, nothing really changes. Now the Coldain, they are a group to admire, the first trickles of that flood I spoke of.");
    elseif(e.message:findi("coldain")) then
        e.self:Say("'I admire the Coldain. They are strong because they adapt. They fought the Kromzek to a standstill, then pushed them back. They have not really crossed Dragons yet, but I feel that if they had a feud with us, they would present quite a challenge. And lo! There is a whole WORLD of peoples such as yourself, hardy and flexible as the Coldain, and here you stand at our doorstep, knocking.");
    end
end

function event_signal(e)
	if ( e.signal == 1 ) then
		e.self:Shout("Damnation and doom!  Some fool has awakened The Sleeper!  Avoid those places where Dragons dwell, for Kerafyrm shall surely seek revenge upon us!");
	end
end