# Westwastes emote pollution log (Alkabor ref)

Ref: `C:/eqemu/ref_emotes/Emotes_Alkabor/westwastes/*.txt`
Zone: westwastes (Western Wastes — Velious dragon plains)

## Boilerplate / suspected pollution

The vast majority of NPCs in the Alkabor ref dump share the identical
Claws-of-Veeshan boilerplate triad:

```
Enter Combat  : You should not have dared!
After Death   : You will pay, and pay dearly, for this.  The Claws will exterminate you.
(Slay)        : A messy death, but a death nonetheless.
```

Twenty-plus dragon-cult NPCs in westwastes share this exact text: #Amcilla,
Bratavar, Pantrilla, Glati, Derasinal, Ayillish, Karkona, Ionat, Entariz,
Gafala, Yeldema, Mav_Sapara, Honvar, Rak_Sapara, Makala, #Nintal, #Zil_Sapara,
Vitaela, Hechaeva, Atpaev, Gangel, #Von, Kar_Sapara, Quoza, #Mraaka, #Cargalia,
Mazi, Bufa, Crial, Onava, Del_Sapara, Myga.

This is very likely a Verant boilerplate template applied to the entire dragon
faction rather than per-NPC authored dialogue. Retained on grounds of "default
include" — flavor is lore-appropriate and the ref file is definitive for
Alkabor-timeline behavior. If a future pass finds packet-cap evidence that
individual dragons had unique lines, revisit.

## Judgement calls

- **Julius_Oresko (120031)**: ref has `bested by a !` with an empty class
  placeholder (Verant's runtime substitution artefact). Existing .lua already
  substitutes `e.other:GetRaceName()` and adds a combat line. Kept existing —
  it does what Verant intended.

- **Sontalak (120005)**: unique dragon-eating flavor ("The insects try to
  sting me! ... crunchy, not pulped!"). Kept as-is.

- **Neordla (120032)**: ref shows After-Death only, but existing .lua also has
  the standard "You should not have dared!" combat line. Combat text is the
  faction standard for a Claws dragon so it stays — not treated as pollution.

- **Rontar O`Karn (120028)**: giant flavor ("smash you with my savage fists /
  join the spirits"). Kept as-is.

- **Sadeem Oujva (120029)**: fire-mage NPC ("mastery of the elements"). Kept.

- **Grenth Drakebane (120030)**: dwarf ("marr cherry / Kingdom of Brell").
  Kept.

- **Guardian_Kozzalym (120035)**: velium ore guardian, ref is Enter Combat
  only; wired as event_combat with `e.joined`. Included — clearly authored.

- **#Travala (120063) / Tranala (120076)**: both share `Eeeeeraaaaaaawwwwwwwk!`
  (wyvern shriek). Kept as-is — sound-effect emote is fine.

- **Harla_Dar (120057)**: bereaved-mother dragon flavor, kept custom text in
  existing .pl.

- **Klandicar (120084)**: unique "worn shell / hurl into fire in the Necropolis"
  dying request. Kept.

- **Esorpa_of_the_Ring (120086)**: Ring of Scale flavor, ref matches existing.

- **The_Dragon_Sage (120066)**: ref is a single death emote where the sage
  taunts and his robes fall as he fades. Added as EVENT_DEATH_COMPLETE in
  existing .pl. The trailing "The Dragon Sage's robes fall to the ground as
  his form fades." was split into a separate quest::emote to match the ref
  structure.

## No skips

Nothing in the ref was skipped as clearly-wrong. All 46 ref files are
lore-appropriate for a Velious dragon plains zone.

## Non-ref NPCs in zone folder (informational — untouched)

`#Diddugu.pl`, `#Scout_Charisa.pl`, `A_sentinel-s_voice.pl`,
`Breezeboot_Swordrattler.pl`, `Melalafen.pl`, `a_slain_dragon.pl`,
`Draazak.pl`, `Makil_Rargon.pl`, `Jen_Sapara.lua`, `Uiliak.lua`,
`Scout_Charisa.lua`, `a_shipwrecked_pirate.lua`, `encounters/Scout_Charisa.lua`
have no Alkabor ref file (out of scope).
