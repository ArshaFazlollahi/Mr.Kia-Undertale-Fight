-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Kia glances at his chat for a quick boost of confidence.", "There's a reason why they call him the people's streamer.", "Kia gets a donation."}
commands = {"Emote", "Join Stream", "Spam L"}
randomdialogue = {"[effect:none]Report him chat!", "[effect:none]MY PING....\nI'M LAGGING!", "[effect:none]ALO??", "[effect:none]COME HERE BOY!", "[effect:none]Noob.", "[effect:none]I CAN'T WITH THIS PACKET LOSS!", "[effect:none]And once again...I win.", "[effect:none]Your ping is like...1\nYou clearly have an advantage.", "[effect:none]WHAT?", "[effect:none]I have 7K followers!\nWhat do you have??", "[effect:none]You can't even build!"}

sprite = "poseur" --Always PNG. Extension is added automatically.
name = "Kia"
hp = 370
atk = 5
def = 8
check = "7K twitch followers.\n5K instagram followers.\nTruly the people's streamer."
dialogbubble = "rightwide" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "EMOTE" then
        currentdialogue = {"[effect:none]NO YOU DIDN'T!"}
    elseif command == "JOIN STREAM" then
        currentdialogue = {"[effect:none]Mods!\nBaaaaan himmmm!"}
    elseif command == "SPAM L" then
        currentdialogue = {"[effect:none]TITAB FOR YOU!"}
    end
    BattleDialog({"You decided to " .. command .. ", oh boy..."})
end