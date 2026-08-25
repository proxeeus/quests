function event_combat(e)
    if e.joined then
        e.self:Say("The might of the oceans is at my command, and with it I shall end your existence, strange one!!")
    end
end

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("I can't wait till the warriors take us out for a swim in the bay!  They say it is too dangerous for us to go out ourselves because of the sharks, buthar, sirens, and that nasty sea dragon Kel...Kelo...Kelorek'Dar.")
    end
end
