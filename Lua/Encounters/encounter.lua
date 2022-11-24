-- A basic encounter script skeleton you can copy and modify for your own creations.

-- music = "shine_on_you_crazy_diamond" --Either OGG or WAV. Extension is added automatically. Uncomment for custom music.
encountertext = "Kia's one kill away from his 100 victory streak!" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"rifle"}
wavetimer = 4.0
arenasize = {155, 130}
flee = false
autolinebreak = true
deathtext = {"[effect:none]YOU CAN'T KILL THE PEOPLE'S STREAMER!"}

enemies = {
"Kia"
}

enemypositions = {
{0, 0}
}

SetGlobal("intro", true)
SetGlobal("firstAtk", true)

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"trap", "deagle", "rifle", "shotgun"}

function EncounterStarting()
    State("ENEMYDIALOGUE")
    Player.name = "Hater"
    Player.lv = 2
    Player.hp = 24
    Player.SetAttackAnim({"hit1", "hit2", "hit3", "hit4"}, 1/4)
    Inventory.AddCustomItems({"Shield", "Shotgun", "Bandage", "Chat"}, {2, 1, 0, 3})
    Inventory.SetInventory({"Shield", "Shotgun", "Bandage", "Bandage", "Chat", "Chat", "Chat", "Chat"})
    Audio.Stop()
end

function EnemyDialogueStarting()
    local intro = GetGlobal("intro")
    if intro == true then
        enemies[1].SetVar('currentdialogue', {"[effect:none]...", "[effect:none]LOL LOOK AT THAT DEFAULT SKIN XD"})
        SetGlobal("intro", false)
    end
    
end

function EnemyDialogueEnding()
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    local firstAtk = GetGlobal("firstAtk")
    if firstAtk == true then
        State("ACTIONSELECT")
        SetGlobal("firstAtk", false)
        Audio.LoadFile("theme")
    elseif firstAtk == false then 
        nextwaves = { possible_attacks[math.random(#possible_attacks)] }
    end
end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
end

function HandleSpare()
    State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    if ItemID == "SHIELD" then
        Inventory.SetAmount(8)
        BattleDialog({"You decided to shiel' up.\n Your DEF has increased."})
    else if ItemID == "SHOTGUN" then
        Inventory.SetAmount(15)
        BattleDialog({"You pulled out your tactical shotgun.\n Your ATK has increased."})
    else if ItemID == "BANDAGE" then
        BattleDialog({"You applied a bandage.\n Your HP maxed out."})
        Player.hp = 24
    end
    end
    end
end