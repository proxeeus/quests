function event_combat(e)
    if e.joined then
        e.self:Say("Areeeeewwwww")
    end
end

-- Spawns lucid_spirit_of_Abrams upon death
function event_death_complete(e)
    eq.spawn2(111147, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
end
