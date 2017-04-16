INCLUDE "charmap.asm"
INCLUDE "constants/text_constants.asm"
TEXT_1  EQU $20
TEXT_2  EQU TEXT_1 + 1
TEXT_3  EQU TEXT_2 + 1
TEXT_4  EQU TEXT_3 + 1
TEXT_5  EQU TEXT_4 + 1
TEXT_6  EQU TEXT_5 + 1
TEXT_7  EQU TEXT_6 + 1
TEXT_8  EQU TEXT_7 + 1
TEXT_9  EQU TEXT_8 + 1
TEXT_10 EQU TEXT_9 + 1
TEXT_11 EQU TEXT_10 + 1

POKEDEX_TEXT EQU TEXT_11 + 1
MOVE_NAMES   EQU POKEDEX_TEXT + 1

INCLUDE "macros.asm"
INCLUDE "hram.asm"


SECTION "Text 1", ROMX[$4000], BANK[TEXT_1]

_CardKeySuccessText1::
	text "Bingo! @@"

_CardKeySuccessText2::
	text "Der"
	line "TÜRÖFFNER hat die"
	cont "Tür entriegelt!"
	done

_CardKeyFailText::
	text "Mist! Die Tür"
	line "geht nur mit dem"
	cont "TÜRÖFFNER auf!"
	done

_TrainerNameText::
	TX_RAM wcd6d
	text ": @@"

_NoNibbleText::
	text "Nicht einmal ein"
	line "alter Stiefel hat"
	cont "angebissen!"
	prompt

_NothingHereText::
	text "Hier findet man"
	line "nichts. Schade!"
	prompt

_ItsABiteText::
	text "Oh! Da hat etwas"
	line "angebissen!!!"
	prompt

_ExclamationText::
	text "!"
	done

_GroundRoseText::
	text "Irgendwo hat"
	line "sich der Boden"
	cont "gehoben!"
	done

_BoulderText::
	text "Du benötigst"
	line "STÄRKE, um den"
	cont "Fels zu bewegen!"
	done

_MartSignText::
	text "Wir erfüllen alle"
	line "Item-Wünsche!"

	para "PKMN-SUPERMARKT"
	done

_PokeCenterSignText::
	text "Erfrische Deine"
	line "#MON! "

	para "PKMN-CENTER"
	done

_FoundItemText::
	text "<PLAYER> findet..."
	line "@"
	TX_RAM wcf50
	text "!@@"

_NoMoreRoomForItemText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "tragen!"
	done

_OaksAideHiText::
	text "Hallo! Erinnerst"
	line "Du Dich? Ich bin"
	cont "PROF. EICHS"
	cont "Gehilfe!"

	para "Wenn Du"
	line "mindestens @"
	TX_NUM hOaksAideRequirement, 1, 3
	text ""
	cont "verschiedene"
	cont "#MON gefangen"
	cont "hast, habe ich"
	cont "ein Geschenk für"
	cont "Dich: @"
	TX_RAM wOaksAideRewardItemName
	text ""

	para "Also, <PLAYER>, "
	line "hast Du @"
	TX_NUM hOaksAideRequirement, 1, 3
	text ""
	cont "unterschiedliche"
	cont "#MON gefangen?"
	done

_OaksAideUhOhText::
	text "Mal schauen..."
	line "Oh! Du hast erst"
	cont "@"
	TX_NUM hOaksAideNumMonsOwned, 1, 3
	text " verschiedene"
	cont "#MON gefangen!"

	para "Du benötigst @"
	TX_NUM hOaksAideRequirement, 1, 3
	text ","
	line "um das Geschenk"
	cont "zu erhalten."
	done

_OaksAideComeBackText::
	text "Ich habe"
	line "eine gute Idee."

	para "Komm wieder, wenn"
	line "Du @"
	TX_NUM hOaksAideRequirement, 1, 3
	text " #MON"
	cont "besitzt. Ich"
	cont "hebe Dir Dein"
	cont "Geschenk auf."
	done

_OaksAideHereYouGoText::
	text "Super! Du hast"
	line "@"
	TX_NUM hOaksAideNumMonsOwned, 1, 3
	text " verschiedene"
	cont "#MON gefangen!"
	cont "Einfach klasse!"

	para "Hier, das hast"
	line "Du Dir redlich"
	cont "verdient!"
	prompt

_OaksAideGotItemText::
	text "<PLAYER> erhält"
	line "@"
	TX_RAM wOaksAideRewardItemName
	text "!@@"

_OaksAideNoRoomText::
	text "Oh! Du hast"
	line "momentan keinen"
	cont "Platz für den"
	cont "@"
	TX_RAM wOaksAideRewardItemName
	text "."
	done

INCLUDE "text/maps/viridian_forest.asm"
INCLUDE "text/maps/mt_moon_1f.asm"
INCLUDE "text/maps/mt_moon_b1f.asm"
INCLUDE "text/maps/mt_moon_b2f.asm"
INCLUDE "text/maps/ss_anne_1.asm"
INCLUDE "text/maps/ss_anne_2.asm"
INCLUDE "text/maps/ss_anne_3.asm"
INCLUDE "text/maps/ss_anne_5.asm"
INCLUDE "text/maps/ss_anne_6.asm"
INCLUDE "text/maps/ss_anne_7.asm"
INCLUDE "text/maps/ss_anne_8.asm"
INCLUDE "text/maps/ss_anne_9.asm"
INCLUDE "text/maps/ss_anne_10.asm"
INCLUDE "text/maps/victory_road_3f.asm"
INCLUDE "text/maps/rocket_hideout_b1f.asm"
INCLUDE "text/maps/rocket_hideout_b2f.asm"
INCLUDE "text/maps/rocket_hideout_b3f.asm"
INCLUDE "text/maps/rocket_hideout_b4f.asm"
INCLUDE "text/maps/rocket_hideout_elevator.asm"
INCLUDE "text/maps/silph_co_2f.asm"
INCLUDE "text/maps/silph_co_3f.asm"
INCLUDE "text/maps/silph_co_4f.asm"
INCLUDE "text/maps/silph_co_5f_1.asm"


SECTION "Text 2", ROMX[$4000], BANK[TEXT_2]

INCLUDE "text/maps/silph_co_5f_2.asm"
INCLUDE "text/maps/silph_co_6f.asm"
INCLUDE "text/maps/silph_co_7f.asm"
INCLUDE "text/maps/silph_co_8f.asm"
INCLUDE "text/maps/silph_co_9f.asm"
INCLUDE "text/maps/silph_co_10f.asm"
INCLUDE "text/maps/silph_co_11f.asm"
INCLUDE "text/maps/mansion_2f.asm"
INCLUDE "text/maps/mansion_3f.asm"
INCLUDE "text/maps/mansion_b1f.asm"
INCLUDE "text/maps/safari_zone_east.asm"
INCLUDE "text/maps/safari_zone_north.asm"
INCLUDE "text/maps/safari_zone_west.asm"
INCLUDE "text/maps/safari_zone_center.asm"
INCLUDE "text/maps/safari_zone_rest_house_1.asm"
INCLUDE "text/maps/safari_zone_secret_house.asm"
INCLUDE "text/maps/safari_zone_rest_house_2.asm"
INCLUDE "text/maps/safari_zone_rest_house_3.asm"
INCLUDE "text/maps/safari_zone_rest_house_4.asm"
INCLUDE "text/maps/unknown_dungeon_b1f.asm"
INCLUDE "text/maps/victory_road_1f.asm"
INCLUDE "text/maps/lance.asm"
INCLUDE "text/maps/hall_of_fame.asm"
INCLUDE "text/maps/champion.asm"
INCLUDE "text/maps/lorelei.asm"
INCLUDE "text/maps/bruno.asm"
INCLUDE "text/maps/agatha.asm"
INCLUDE "text/maps/rock_tunnel_b2f_1.asm"


SECTION "Text 3", ROMX[$4000], BANK[TEXT_3]

INCLUDE "text/maps/rock_tunnel_b2f_2.asm"
INCLUDE "text/maps/seafoam_islands_b4f.asm"

_AIBattleWithdrawText::
	TX_RAM wTrainerName
	text " ruft"
	line "@"
	TX_RAM wEnemyMonNick
	text ""
	cont "zurück!"
	prompt

_AIBattleUseItemText::
	TX_RAM wTrainerName
	text ""
	line "gibt @"
	TX_RAM wcd6d
	text ""
	cont "@"
	TX_RAM wEnemyMonNick
	text "!"
	prompt

_TradeWentToText::
	TX_RAM wcf50
	text " geht"
	line "zu @"
	TX_RAM wGrassRate
	text "."
	done

_TradeForText::
	text "<PLAYER> tauscht"
	line "@"
	TX_RAM wcf50
	text ""
	done

_TradeSendsText::
	text "gegen @"
	TX_RAM wGrassRate
	text "s"
	line "@"
	TX_RAM wcd6d
	text "."
	done

_TradeWavesFarewellText::
	TX_RAM wGrassRate
	text " winkt"
	line "zum Abschied, als"
	done

_TradeTransferredText::
	text "sein @"
	TX_RAM wcd6d
	text ""
	line "übertragen wird."
	done

_TradeTakeCareText::
	text "Kümmere Dich gut"
	line "um @"
	TX_RAM wcd6d
	text "."
	done

_TradeWillTradeText::
	TX_RAM wGrassRate
	text " möchte"
	line "@"
	TX_RAM wcd6d
	text " gegen"
	done

_TradeforText::
	text "<PLAYER>s @"
	TX_RAM wcf50
	text ""
	line "tauschen."
	done

_PlaySlotMachineText::
	text "Ein einarmiger"
	line "Bandit! Möchtest"
	cont "Du spielen?"
	done

_OutOfCoinsSlotMachineText::
	text "Mist!"
	line "Ich habe keine"
	cont "Münzen mehr!"
	done

_BetHowManySlotMachineText::
	text "Wie viele Münzen"
	line "möchtest Du"
	cont "setzen?"
	done

_StartSlotMachineText::
	text "Auf geh",$B3,"'s! " ; "{t}{'s}" instead of "{t'}{s}"
	done

_NotEnoughCoinsSlotMachineText::
	text "Du hast nicht"
	line "genug Münzen!"
	prompt

_OneMoreGoSlotMachineText::
	text "Noch eine"
	line "Runde?"
	done

_LinedUpText::
	text "Super! Du hast"
	line "@"
	TX_RAM wcf50
	text " Münzen"
	cont "gewonnen!"
	done

_NotThisTimeText::
	text "Vielleicht beim"
	line "nächsten Mal!"
	prompt

_YeahText::
	text "Ja!!!@@"

_DexSeenOwnedText::
	text "Gesehen: @"
	TX_NUM wDexRatingNumMonsSeen, 1, 3
	text " PKMN"
	line "Besitz: @"
	TX_NUM wDexRatingNumMonsOwned, 1, 3
	text " PKMN"
	done

_DexRatingText::
	text ""
	done

_GymStatueText1::
	TX_RAM wGymCityName
	text ""
	line "PKMN-ARENA"
	cont "LEITUNG:"
	cont "@"
	TX_RAM wGymLeaderName
	text " "

	para "BISHERIGE SIEGER:"
	line "<RIVAL>"
	done

_GymStatueText2::
	TX_RAM wGymCityName
	text ""
	line "PKMN-ARENA"
	cont "LEITUNG: "
	cont "@"
	TX_RAM wGymLeaderName
	text ""

	para "BISHERIGE SIEGER:"
	line "<RIVAL>"
	cont "<PLAYER>"
	done

_ViridianCityPokecenterGuyText::
	text "Im PKMN-CENTER"
	line "kannst Du müde,"
	cont "verletzte und"
	cont "besiegte #MON"
	cont "heilen!"
	done

_PewterCityPokecenterGuyText::
	text "Gähn!"

	para "Von PUMMELUFFS"
	line "GESANG werden"
	cont "#MON ganz"
	cont "müde..."

	para "Ich auch..."
	line "Schnarch..."
	done

_CeruleanPokecenterGuyText::
	text "BILL besitzt"
	line "viele #MON!"

	para "Er hat einige"
	line "sehr seltene in"
	cont "seiner Sammlung!"
	done

_LavenderPokecenterGuyText::
	text "TRAGOSSO tragen"
	line "Schädelmasken!"

	para "Man zahlt für sie"
	line "eine Menge Geld!"
	done

_MtMoonPokecenterBenchGuyText::
	text "Wenn Du keine"
	line "weiteren #MON"
	cont "tragen kannst,"
	cont "solltest Du"
	cont "einige via PC"
	cont "ablegen!"
	done

_RockTunnelPokecenterGuyText::
	text "Ich habe gehört,"
	line "daß in LAVANDIA"
	cont "böse GEISTER"
	cont "spuken!"
	done

_UnusedBenchGuyText1::
	text "Ich wünschte, ich"
	line "könnte #MON"
	cont "fangen..."
	done

_UnusedBenchGuyText2::
	text "Nach all dem Spaß"
	line "bin ich nun müde."
	done

_UnusedBenchGuyText3::
	text "Der Leiter der"
	line "SILPH CO."
	cont "versteckt sich in"
	cont "der SAFARI-ZONE."
	done

_VermilionPokecenterGuyText::
	text "Es stimmt, daß"
	line "ein #MON mit"
	cont "einem hohen Level"
	cont "sehr stark ist..."

	para "Allerdings haben"
	line "alle #MON"
	cont "Schwächen. Die"
	cont "richtige Attacke"
	cont "kann sie leicht"
	cont "besiegen!"

	para "Daher gibt es"
	line "kein Universal-"
	cont "#MON."
	done

_CeladonCityPokecenterGuyText::
	text "Wenn ich ein"
	line "FAHRRAD hätte,"
	cont "würde ich den"
	cont "RADWEG benutzen!"
	done

_FuchsiaCityPokecenterGuyText::
	text "Du studierst die"
	line "#MON?"
	cont "Dann gehe in die"
	cont "SAFARI-ZONE."

	para "Dort gibt es"
	line "viele seltene"
	cont "#MON."
	done

_CinnabarPokecenterGuyText::
	text "Brichst Du ihre"
	line "Entwicklung ab,"
	cont "dann können Deine"
	cont "#MON weitere"
	cont "Attacken lernen."

	para "Die weitere"
	line "Entwicklung kann"
	cont "warten, bis sie"
	cont "neue Attacken"
	cont "gelernt haben!"
	done

_SaffronCityPokecenterGuyText1::
	text "Ich wünschte, die"
	line "TOP VIER kämen"
	cont "und stampften das"
	cont "TEAM ROCKET"
	cont "in den Boden!"
	done

_SaffronCityPokecenterGuyText2::
	text "Das TEAM ROCKET"
	line "ist geflohen! Wir"
	cont "können wieder aus"
	cont "dem Haus gehen!"
	done

_CeladonCityHotelText::
	text "Dieser Urlaub war"
	line "eine Idee meiner"
	cont "Schwester!"
	done

_BookcaseText::
	text "Wow! Unmengen"
	line "von Büchern über"
	cont "#MON!"
	done

_NewBicycleText::
	text "Ein brandneues"
	line "FAHRRAD!"
	done

_PushStartText::
	text "Drücke START,"
	line "um das MENÜ"
	cont "aufzurufen!"
	done

_SaveOptionText::
	text "Im MENÜ kannst Du"
	line "unter SICHERN"
	cont "Deinen Spielstand"
	cont "abspeichern."
	done

_StrengthsAndWeaknessesText::
	text "#MON besitzen"
	line "unterschiedliche"
	cont "Attacken, deren"
	cont "Wirkung je nach"
	cont "Gegner variiert."
	done

_TimesUpText::
	text "DURCHSAGE: Gong!"

	para "Die Zeit ist um!"
	prompt

_GameOverText::
	text "DURCHSAGE: Deine"
	line "SAFARI-TOUR ist"
	cont "vorüber!"
	done

_CinnabarGymQuizIntroText::
	text "Willkommen beim"
	line "#MON-Quiz!"

	para "Weißt Du die"
	line "richtige Antwort,"
	cont "dann öffnet sich"
	cont "die Tür!"

	para "Ist die Antwort"
	line "falsch, dann mußt"
	cont "Du kämpfen..."

	para "Je mehr Antworten"
	line "Du weißt, desto"
	cont "fitter sind Deine"
	cont "#MON beim"
	cont "Kampf gegen den"
	cont "ARENALEITER!"

	para "Laß uns beginnen!"
	prompt

_CinnabarQuizQuestionsText1::
	text "Entwickelt sich"
	line "RAUPY zu SMETTBO?"
	done

_CinnabarQuizQuestionsText2::
	text "Gibt es neun"
	line "offizielle"
	cont "#MON-ORDEN?"
	done

_CinnabarQuizQuestionsText3::
	text "Entwickelt sich"
	line "QUAPSEL dreimal?"
	done

_CinnabarQuizQuestionsText4::
	text "Sind DONNER-"
	line "ATTACKEN gegen"
	cont "BODEN-#MON"
	cont "sehr effektiv?"
	done

_CinnabarQuizQuestionsText5::
	text "Unterscheiden"
	line "sich zwei gleiche"
	cont "#MON mit"
	cont "gleichem Level?"
	done

_CinnabarQuizQuestionsText6::
	text "Ist TM28 die "
	line "FROSCH-ATTACKE?"
	done

_CinnabarGymQuizCorrectText::
	text "Und die Antwort"
	line "ist... RICHTIG!"

	para "Geh weiter!@@"

_CinnabarGymQuizIncorrectText::
	text "FALSCH!"
	line "So ein Pech!"
	prompt

_MagazinesText::
	text "#MON-"
	line "Zeitschriften!"

	para "#MON-"
	line "Notizbücher!"

	para "#MON-"
	line "Schaubilder!"
	done

_BillsHouseMonitorText::
	text "Auf dem PC läuft"
	line "ein Programm zur"
	cont "Steuerung des"
	cont "TELEPORTERS."
	done

_BillsHouseInitiatedText::
	text "<PLAYER> hat den"
	line "ZELL-SEPARATOR"
	cont "in Gang gesetzt!@@"

_BillsHousePokemonListText1::
	text "Ein Liste von"
	line "BILLS LIEBLINGS-"
	cont "#MON!"
	prompt

_BillsHousePokemonListText2::
	text "Welches #MON"
	line "möchtest Du"
	cont "betrachten?"
	done

_OakLabEmailText::
	text "Im Briefkasten"
	line "ist eine E-Mail!"

	para "..."

	para "An alle"
	line "#MON-TRAINER!"

	para "Die TRAINER-ELITE"
	line "der PKMN-LIGA"
	cont "wartet auf mutige"
	cont "Herausforderer!"

	para "Bringt Eure"
	line "stärksten #MON"
	cont "mit und zeigt,"
	cont "wie gut Ihr seid!"

	para "PKMN-LIGA-LEITUNG"
	line "INDIGO-PLATEAU"

	para "PS.: PROF. EICH,"
	line "bitte melden Sie"
	cont "sich bei uns!"
	cont "..."
	done

_GameCornerCoinCaseText::
	text "Du benötigst"
	line "einen MÜNZKORB!"
	done

_GameCornerNoCoinsText::
	text "Du hast keine"
	line "Münzen!"
	done

_GameCornerOutOfOrderText::
	text "AUSSER BETRIEB!"
	done

_GameCornerOutToLunchText::
	text "BIN ZU TISCH!"
	line "Oh, dieser Platz"
	cont "ist besetzt."
	done

_GameCornerSomeonesKeysText::
	text "Da liegt ein"
	line "Schlüsselbund."

	para "Der Platz scheint"
	line "besetzt zu sein."
	done

_JustAMomentText::
	text "Warte einen"
	line "Augenblick."
	done

TMNotebookText::
	text "Ein INFOBLATT"
	line "über TM."

	para "..."

	para "Es gibt"
	line "insgesamt 50 TM."

	para "Außerdem gibt es"
	line "fünf VM, die"
	cont "mehrfach nutzbar"
	cont "sind."

	para "SILPH CO.@@"

_TurnPageText::
	text "Umblättern?"
	done

_ViridianSchoolNotebookText5::
	text "MÄDCHEN: Hey! Laß"
	line "die Finger von"
	cont "meinen Notizen!@@"

_ViridianSchoolNotebookText1::
	text "Du schaust in"
	line "das Notizbuch!"

	para "Erste Seite..."

	para "Zum Fangen von"
	line "#MON benutzt"
	cont "man #BÄLLE."

	para "Man kann bis zu"
	line "sechs #MON auf"
	cont "einmal tragen."

	para "#MON-TRAINER"
	line "ziehen #MON"
	cont "groß und"
	cont "trainieren sie."
	prompt

_ViridianSchoolNotebookText2::
	text "Zweite Seite..."

	para "Ein #MON bei"
	line "voller Stärke ist"
	cont "schwer zu fangen!"
	cont "Man sollte es"
	cont "erst schwächen."

	para "Feuer, Gift und"
	line "andere Attacken"
	cont "wirken Wunder!"
	prompt

_ViridianSchoolNotebookText3::
	text "Dritte Seite..."

	para "#MON-TRAINER"
	line "suchen einander"
	cont "und lassen ihre"
	cont "#MON kämpfen."

	para "In den"
	line "PKMN-ARENEN"
	cont "finden stets"
	cont "Kämpfe statt."
	prompt

_ViridianSchoolNotebookText4::
	text "Vierte Seite..."

	para "Das Ziel jedes"
	line "#MON-TRAINERS"
	cont "ist es, die acht"
	cont "Leiter der"
	cont "PKMN-ARENEN"
	cont "zu besiegen."

	para "Nur dann darf er"
	line "den TOP VIER in"
	cont "der PKMN-LIGA"
	cont "gegenübertreten!"
	prompt

_EnemiesOnEverySideText::
	text "Wandle Dich"
	line "abhängig vom"
	cont "Gegner!"
	done

_WhatGoesAroundComesAroundText::
	text "Wie die Saat,"
	line "so die Ernte!"
	done

_FightingDojoText::
	text "KAMPFARENA"
	done

_IndigoPlateauHQText::
	text "INDIGO PLATEAU"
	line "#MON-LIGA"
	cont "HAUPTQUARTIER"
	done

_RedBedroomSNESText::
	text "<PLAYER> spielt"
	line "SUPER NINTENDO!"
	cont "...OK! Die Reise"
	cont "kann beginnen!"
	done

_Route15UpstairsBinocularsText::
	text "Du schaust durch"
	line "das Fernrohr..."

	para "Ein großer Vogel"
	line "fliegt anmutig"
	cont "aufs Meer hinaus."
	done

_AerodactylFossilText::
	text "AERODACTYL-Fossil"
	line "Ein urzeitliches"
	cont "und seltenes"
	cont "#MON."
	done

_KabutopsFossilText::
	text "KABUTOPS-Fossil"
	line "Ein urzeitliches"
	cont "und seltenes"
	cont "#MON."
	done

_LinkCableHelpText1::
	text "TIPS FÜR TRAINER"

	para "Die Benutzung des"
	line "Link-Kabels"
	prompt

_LinkCableHelpText2::
	text "Wähle bitte ein"
	line "Themengebiet aus."
	done

_LinkCableInfoText1::
	text "Spricht man die"
	line "Bedienung bei"
	cont "der rechten Theke"
	cont "im PKMN-CENTER"
	cont "an, während zwei"
	cont "GAME BOYS über"
	cont "das Link-Kabel"
	cont "verbunden sind,"
	cont "dann gelangt man"
	cont "in den 2-Spieler-"
	cont "Raum."
	prompt

_LinkCableInfoText2::
	text "Im KOLOSSEUM"
	line "kannst Du gegen"
	cont "einen Freund"
	cont "antreten."
	prompt

_LinkCableInfoText3::
	text "Im HANDELSCENTER"
	line "können #MON"
	cont "getauscht werden."
	prompt

_ViridianSchoolBlackboardText1::
	text "Die Tafel zeigt"
	line "Statuswechsel der"
	cont "#MON während"
	cont "des Kampfes an."
	prompt

_ViridianSchoolBlackboardText2::
	text "Wähle bitte ein"
	line "Themengebiet aus."
	done

_ViridianBlackboardSleepText::
	text "Wenn ein #MON"
	line "schläft, kann es"
	cont "nicht angreifen!"

	para "Ein schlafendes"
	line "#MON wacht"
	cont "auch nach dem"
	cont "Kampf nicht auf."

	para "Benutze"
	line "AUFWECKER, damit"
	cont "es aufwacht."
	prompt

_ViridianBlackboardPoisonText::
	text "Ein vergiftetes"
	line "#MON verliert"
	cont "stetig KP."

	para "Die Wirkung des"
	line "Giftes hält auch"
	cont "nach einem Kampf"
	cont "an."

	para "GEGENGIFT heilt"
	line "Vergiftungen."
	prompt

_ViridianBlackboardPrlzText::
	text "Ein paralysiertes"
	line "#MON"
	cont "verliert an"
	cont "Treffgenauigkeit!"

	para "Die Paralyse hält"
	line "auch nach einem"
	cont "Kampf an."

	para "Man behandelt sie"
	line "mit PARA-HEILER."
	prompt

_ViridianBlackboardBurnText::
	text "Eine Verbrennung"
	line "vermindert Kraft"
	cont "und Stärke. Die"
	cont "KP sinken stetig."

	para "Verbrennungen"
	line "dauern auch nach"
	cont "einem Kampf an."

	para "Man heilt sie mit"
	line "FEUERHEILER."
	prompt

_ViridianBlackboardFrozenText::
	text "Ein eingefrorenes"
	line "#MON ist"
	cont "bewegungsunfähig."

	para "Es behält auch"
	line "nach dem Kampf"
	cont "diesen Zustand"
	cont "bei."

	para "Nur der EISHEILER"
	line "kann es wieder"
	cont "auftauen!"
	prompt

_VermilionGymTrashText::
	text "Hier ist nichts,"
	line "bloß Abfall."
	done

_VermilionGymTrashSuccessText1::
	text "Hey! Hier ist ein"
	line "Hebel versteckt!"
	cont "Ich werde ihn"
	cont "betätigen!"

	para "Das erste Schloß"
	line "wurde entriegelt!@@"

_VermilionGymTrashSuccessText2::
	text "Hier ist noch ein"
	line "Hebel unter dem"
	cont "Abfall versteckt!"
	cont "Ich betätige ihn!"
	prompt

_VermilionGymTrashSuccessText3::
	text "Das zweite Schloß"
	line "wurde entriegelt!"

	para "Die mechanische"
	line "Tür hat sich"
	cont "geöffnet!@@"

_VermilionGymTrashFailText::
	text "Nichts! Hier ist"
	line "nur Abfall..."
	cont "Hey! Das Schloß"
	cont "wurde wieder"
	cont "verriegelt!@@"

_FoundHiddenItemText::
	text "<PLAYER> findet"
	line "@"
	TX_RAM wcd6d
	text "!@@"

_HiddenItemBagFullText::
	text "Aber <PLAYER> kann"
	line "keine weiteren"
	cont "Items tragen!"
	done

_FoundHiddenCoinsText::
	text "<PLAYER> findet"
	line "@"
	TX_BCD hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " Münzen!@@"

_FoundHiddenCoins2Text::
	text "<PLAYER> findet"
	line "@"
	TX_BCD hCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " Münzen!@@"

_DroppedHiddenCoinsText::
	text ""

	para "Ups! Ich glaube,"
	line "ich habe ein paar"
	cont "Münzen verloren!"
	done

_IndigoPlateauStatuesText1::
	text "INDIGO PLATEAU"
	prompt

_IndigoPlateauStatuesText2::
	text "Das große Ziel"
	line "aller Trainer ist"
	cont "die PKMN-LIGA!"
	done

_IndigoPlateauStatuesText3::
	text "Das PKMN-LIGA-"
	line "HAUPTQUARTIER"
	cont "ist die höchste"
	cont "PKMN-AUTORITÄT!"
	done

_PokemonBooksText::
	text "Wow! Unmengen"
	line "Bücher über"
	cont "#MON!"
	done

_DiglettSculptureText::
	text "Eine Plastik, die"
	line "DIGDA darstellt."
	done

_ElevatorText::
	text "Dies ist ein"
	line "Aufzug."
	done

_TownMapText::
	text "Eine KARTE!@@"

_PokemonStuffText::
	text "Wow! Jede Menge"
	line "#MON-"
	cont "Gegenstände!"
	done

_OutOfSafariBallsText::
	text "DURCHSAGE: Gong!"

	para "Du hast keine"
	line "SAFARIBÄLLE mehr!"
	prompt

_WildRanText::
	text "Das wilde"
	line "@"
	TX_RAM wEnemyMonNick
	text " ist"
	cont "geflüchtet!"
	prompt

_EnemyRanText::
	TX_RAM wEnemyMonNick
	text ""
	line "ist geflüchtet!"
	prompt

_HurtByPoisonText::
	text "Das Gift schadet"
	line "<USER>!"
	prompt

_HurtByBurnText::
	text "Die Verbrennung"
	line "schadet"
	cont "<USER>!"
	prompt

_HurtByLeechSeedText::
	text "Die SCHMAROTZER-"
	line "ATTACKE schadet"
	cont "<USER>!"
	prompt

_EnemyMonFaintedText::
	TX_RAM wEnemyMonNick
	text ""
	line "wurde besiegt!"
	prompt

_MoneyForWinningText::
	text "<PLAYER>"
	line "gewinnt ¥@"
	TX_BCD wAmountMoneyWon, $c3
	text "!"
	prompt

_TrainerDefeatedText::
	text "<PLAYER> besiegt"
	line "@"
	TX_RAM wTrainerName
	text "!"
	prompt

_PlayerMonFaintedText::
	TX_RAM wBattleMonNick
	text ""
	line "wurde besiegt!"
	prompt

_UseNextMonText::
	text "Nächstes #MON"
	line "einsetzen?"
	done

_Sony1WinText::
	text "<RIVAL>: Ja! Ich"
	line "bin der Beste!"
	prompt

_PlayerBlackedOutText2::
	text "Alle #MON von"
	line "<PLAYER> wurden"
	cont "besiegt!"

	para "<PLAYER> fällt"
	line "in Ohnmacht!"
	prompt

_LinkBattleLostText::
	TX_RAM wTrainerName
	text " hat"
	line "<PLAYER> besiegt!"
	prompt

_TrainerAboutToUseText::
	TX_RAM wTrainerName
	text " wird"
	line "@"
	TX_RAM wEnemyMonNick
	text " in den"
	cont "Kampf schicken!"

	para "Möchtest Du das"
	line "#MON wechseln?"
	done

_TrainerSentOutText::
	TX_RAM wTrainerName
	text " setzt"
	line "@"
	TX_RAM wEnemyMonNick
	text " ein!"
	done

_NoWillText::
	text "Das #MON"
	line "wurde besiegt!"
	prompt

_CantEscapeText::
	text "Du kannst nicht"
	line "davonlaufen!"
	prompt

_NoRunningText::
	text "Man kann aus"
	line "TRAINER-KÄMPFEN"
	cont "nicht fliehen!"
	prompt

_GotAwayText::
	text "Du bist"
	line "entkommen!"
	prompt

_ItemsCantBeUsedHereText::
	text "Du kannst hier"
	line "keine Items "
	cont "einsetzen."
	prompt

_AlreadyOutText::
	TX_RAM wBattleMonNick
	text ""
	line "kämpft bereits!"
	prompt

_MoveNoPPText::
	text "Du hast keine AP"
	line "für diese Attacke"
	cont "mehr übrig!"
	prompt

_MoveDisabledText::
	text "Diese Attacke"
	line "ist blockiert!"
	prompt

_NoMovesLeftText::
	TX_RAM wBattleMonNick
	text " hat"
	line "keine Attacken"
	cont "mehr übrig!"
	done

_MultiHitText::
	text "Der Gegner wurde"
	line "@"
	TX_NUM wPlayerNumHits,1,1
	text " mal getroffen!"
	prompt

_ScaredText::
	TX_RAM wBattleMonNick
	text " kann"
	line "sich vor Angst"
	cont "nicht bewegen!"
	prompt

_GetOutText::
	text "GEIST: Hau ab..."
	line "Verschwinde..."
	prompt

_FastAsleepText::
	text "<USER>"
	line "schläft!"
	prompt

_WokeUpText::
	text "<USER>"
	line "ist aufgewacht!"
	prompt

_IsFrozenText::
	text "<USER>"
	line "ist festgefroren!"
	prompt

_FullyParalyzedText::
	text "<USER>"
	line "ist paralysiert!"
	prompt

_FlinchedText::
	text "<USER>"
	line "ist ausgewichen!"
	prompt

_MustRechargeText::
	text "<USER>"
	line "muß sich wieder "
	cont "aufladen!"
	prompt

_DisabledNoMoreText::
	text "<USER>"
	line "wird nicht mehr"
	cont "blockiert!"
	prompt

_IsConfusedText::
	text "<USER>"
	line "ist verwirrt!"
	prompt

_HurtItselfText::
	text "Es hat sich vor"
	line "Verwirrung selbst"
	cont "verletzt!"
	prompt

_ConfusedNoMoreText::
	text "<USER>"
	line "ist nicht mehr"
	cont "verwirrt!"
	prompt

_SavingEnergyText::
	text "<USER>"
	line "sammelt Kräfte!"
	prompt

_UnleashedEnergyText::
	text "<USER>"
	line "erzeugt Energie!"
	prompt

_ThrashingAboutText::
	text "<USER>"
	line "schlägt um sich!"
	done

_AttackContinuesText::
	text "<USER>"
	line "greift weiter an!"
	done

_CantMoveText::
	text "<USER>"
	line "ist gelähmt!"
	prompt

_MoveIsDisabledText::
	text "<USER>s"
	line "@"
	TX_RAM wcd6d
	text " ist"
	cont "blockiert!"
	prompt

_MonName1Text::
	text "<USER>@@"

_Used1Text::
	text ""
	line "ben. @@"

_Used2Text::
	text ""
	line "ben. @@"

_InsteadText::
	text "stattdessen"
	cont "@@"
_CF50Text::
	TX_RAM wcf50
	text "@"

_ExclamationPoint1Text::
	text "!"
	done

_ExclamationPoint2Text::
	text "!"
	done

_ExclamationPoint3Text::
	text "!"
	done

_ExclamationPoint4Text::
	text "!"
	done

_ExclamationPoint5Text::
	text "!"
	done

_AttackMissedText::
	text "<USER>s"
	line "Attacke ging"
	cont "daneben!"
	prompt

_KeptGoingAndCrashedText::
	text "<USER>"
	line "verfehlt das Ziel"
	cont "und fällt hin!"
	prompt

_UnaffectedText::
	text "<TARGET>"
	line "ist unversehrt!"
	prompt

_DoesntAffectMonText::
	text "Keine Wirkung auf"
	line "<TARGET>!"
	prompt

_CriticalHitText::
	text "Volltreffer!"
	prompt

_OHKOText::
	text "K.O.-TREFFER!"
	prompt

_LoafingAroundText::
	TX_RAM wBattleMonNick
	text ""
	line "faulenzt!"
	prompt

_BeganToNapText::
	TX_RAM wBattleMonNick
	text " hält"
	line "ein Nickerchen!"
	prompt

_WontObeyText::
	TX_RAM wBattleMonNick
	text " will"
	line "nicht gehorchen!"
	prompt

_TurnedAwayText::
	TX_RAM wBattleMonNick
	text ""
	line "wendet sich ab!"
	prompt

_IgnoredOrdersText::
	TX_RAM wBattleMonNick
	text ""
	line "mißachtet die"
	cont "Befehle!"
	prompt

_SubstituteTookDamageText::
	text "Der DELEGATOR hat"
	line "<TARGET>"
	cont "vor Schaden"
	cont "bewahrt!"
	prompt

_SubstituteBrokeText::
	text "<TARGET>s"
	line "DELEGATOR wurde"
	cont "zerstört!"
	prompt

_BuildingRageText::
	text "<USER>"
	line "verfällt in"
	cont "RASEREI!"
	prompt

_MirrorMoveFailedText::
	text "Der SPIEGELTRICK"
	next "war erfolglos!"
	prompt

_HitXTimesText::
	TX_NUM wEnemyNumHits, 1, 1
	text " Mal getroffen!"
	prompt

_GainedText::
	TX_RAM wcd6d
	text " erhält"
	line "@@"

_WithExpAllText::
	text "mittels EP-TEILER"
	cont "@@"

_BoostedText::
	text "spezielle"
	cont "@@"

_ExpPointsText::
	TX_NUM wExpAmountGained, 2, 4
	text " EP!"
	prompt

_GrewLevelText::
	TX_RAM wcd6d
	text ""
	line "erreicht"
	cont "Level @"
	TX_NUM wCurEnemyLVL, 1, 3
	text "!@@"

_WildMonAppearedText::
	text "Ein wildes"
	line "@"
	TX_RAM wEnemyMonNick
	text "!"
	prompt

_HookedMonAttackedText::
	text "Das gefangene"
	line "@"
	TX_RAM wEnemyMonNick
	text ""
	cont "greift an!"
	prompt

_EnemyAppearedText::
	TX_RAM wEnemyMonNick
	text ""
	line "taucht auf!"
	prompt

_TrainerWantsToFightText::
	TX_RAM wTrainerName
	text ""
	line "möchte kämpfen!"
	prompt

_UnveiledGhostText::
	text "Das SILPH SCOPE"
	line "hat den GEIST"
	cont "identifiziert!"
	prompt

_GhostCantBeIDdText::
	text "Mist! Dieser"
	line "GEIST ist nicht"
	cont "identifizierbar!"
	prompt

_GoText::
	text "Los! @@"

_DoItText::
	text "Los! @@"

_GetmText::
	text "Los! @@"

_EnemysWeakText::
	text "Mach ihn fertig!"
	line "Los! @@"

_PlayerMon1Text::
	TX_RAM wBattleMonNick
	text "!"
	done

_PlayerMon2Text::
	TX_RAM wBattleMonNick
	text ", @@"

_EnoughText::
	text "genug!@@"

_OKExclamationText::
	text "OK!@@"

_GoodText::
	text "super!@@"

_ComeBackText::
	text ""
	line "Komm zurück!"
	done

_SuperEffectiveText::
	text "Die Attacke ist"
	line "sehr effektiv!"
	prompt

_NotVeryEffectiveText::
	text "Die Attacke ist"
	line "nicht effektiv..."
	prompt

_SafariZoneEatingText::
	text "Das wilde"
	line "@"
	TX_RAM wEnemyMonNick
	text " frißt!"
	prompt

_SafariZoneAngryText::
	text "Das wilde"
	line "@"
	TX_RAM wEnemyMonNick
	text " ist"
	cont "wütend!"
	prompt

; money related
_PickUpPayDayMoneyText::
	text "<PLAYER> sammelt"
	line "¥@"
	TX_BCD wTotalPayDayMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text " auf!"
	prompt

_ClearSaveDataText::
	text "Alle Spielstände"
	line "löschen?"
	done

_WhichFloorText::
	text "Wähle ein"
	line "Stockwerk aus:"
	done

_PartyMenuNormalText::
	text "Wähle ein #MON"
	line "aus!"
	done

_PartyMenuItemUseText::
	text "Welches #MON"
	line "erhält das Item?"
	done

_PartyMenuBattleText::
	text "Welches #MON"
	line "soll antreten?"
	done

_PartyMenuUseTMText::
	text "Wähle ein"
	line "#MON aus!"
	done

_PartyMenuSwapMonText::
	text "Mit wem soll das"
	line "#MON tauschen?"
	done

_PotionText::
	TX_RAM wcd6d
	text " erhält"
	line "@"
	TX_NUM wHPBarHPDifference, 2, 3
	text " Kraftpunkte!"
	done

_AntidoteText::
	text "Die Vergiftung"
	line "wurde geheilt!"
	done

_ParlyzHealText::
	text "Die Paralyse"
	line "wurde aufgehoben!"
	done

_BurnHealText::
	TX_RAM wcd6d
	text ""
	line "wurde geheilt!"
	done

_IceHealText::
	TX_RAM wcd6d
	text ""
	line "wurde aufgetaut!"
	done

_AwakeningText::
	TX_RAM wcd6d
	text ""
	line "ist aufgewacht!"
	done

_FullHealText::
	TX_RAM wcd6d
	text " wurde"
	line "komplett geheilt!"
	done

_ReviveText::
	TX_RAM wcd6d
	text ""
	line "ist wieder fit!"
	done

_RareCandyText::
	TX_RAM wcd6d
	text ""
	line "erreicht"
	cont "Level  @"
	TX_NUM wCurEnemyLVL, $1,$3
	text "!@@"

_TurnedOnPC1Text::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

_AccessedBillsPCText::
	text "Die Verbindung zu"
	line "BILLS PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das #MON-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_AccessedSomeonesPCText::
	text "Die Verbindung"
	line "zum GAST-PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das #MON-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_AccessedMyPCText::
	text "Die Verbindung zu"
	line "Deinem PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das ITEM-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_TurnedOnPC2Text::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

_WhatDoYouWantText::
	text "Wähle einen"
	line "Menüpunkt aus."
	done

_WhatToDepositText::
	text "Welches Item soll"
	line "gelagert werden?"
	done

_DepositHowManyText::
	text "Anzahl?"
	done

_ItemWasStoredText::
	TX_RAM wcd6d
	text ""
	line "wurde gelagert."
	prompt

_NothingToDepositText::
	text "Du hast keine"
	line "Items, die Du"
	cont "lagern könntest."
	prompt

_NoRoomToStoreText::
	text "Die"
	line "Lagerkapazität"
	cont "ist erschöpft."
	prompt

_WhatToWithdrawText::
	text "Welches Item"
	line "möchtest Du"
	cont "mitnehmen?"
	done

_WithdrawHowManyText::
	text "Anzahl?"
	done

_WithdrewItemText::
	TX_RAM wcd6d
	text ""
	line "mitgenommen."
	prompt


_NothingStoredText::
	text "Hier lagern keine"
	line "Items."
	prompt


_CantCarryMoreText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "tragen."
	prompt


_WhatToTossText::
	text "Welches Item"
	line "möchtest Du"
	cont "ausmustern?"
	done


_TossHowManyText::
	text "Anzahl?"
	done


_AccessedHoFPCText::
	text "Verbindung zur"
	line "PKMN-LIGA-WEBSITE"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf die Datenbank"
	cont "der RUHMESHALLE."
	prompt


_SwitchOnText::
	text "Schalte ein!"
	prompt


_WhatText::
	text "Wähle!"
	done


_DepositWhichMonText::
	text "Welches #MON"
	line "lagern?"
	done

_MonWasStoredText::
	TX_RAM wcf50
	text " wurde"
	line "in Box @"
	TX_RAM wBoxNumString
	text ""
	cont "transferiert."
	prompt

_CantDepositLastMonText::
	text "Du kannst Dein"
	line "letztes #MON"
	cont "nicht lagern!"
	prompt


_BoxFullText::
	text "In dieser Box ist"
	line "kein Platz für"
	cont "weitere #MON."
	prompt

_MonIsTakenOutText::
	TX_RAM wcf50
	text " wurde"
	line "transferiert."

	para "@"
	TX_RAM wcf50

	text ""
	line "erhalten."
	prompt

_NoMonText::
	text "Diese Box enthält"
	line "keine #MON!"
	prompt


_CantTakeMonText::
	text "Du kannst keine"
	line "#MON mehr"
	cont "tragen!"

	para "Du mußt erst"
	line "#MON via PC"
	cont "lagern."
	prompt


_ReleaseWhichMonText::
	text "Welches #MON"
	line "soll freigelassen"
	cont "werden?"
	done


_OnceReleasedText::
	text "Ist es erstmal"
	line "freigelassen,"
	cont "kommt @"
	TX_RAM wcf50

	text ""
	cont "nicht wieder"
	cont "zurück. OK?"
	done

_MonWasReleasedText::
	TX_RAM wcf50
	text " wurde"
	line "freigelassen. Leb"
	cont "wohl, @"
	TX_RAM wcf50

_CF50ExclamationText::
	text "!"
	prompt

_RequireCoinCaseText::
	text "Du benötigst"
	line "einen MÜNZKORB!@@"

_ExchangeCoinsForPrizesText::
	text "Wir tauschen"
	line "Münzen gegen"
	cont "Preise ein."
	prompt

_WhichPrizeText::
	text "Welcher Preis"
	line "soll es sein?"
	done

_HereYouGoText::
	text "Hier ist Dein"
	line "Preis!@@"

_SoYouWantPrizeText::
	text "Du möchtest also"
	line "@"
	TX_RAM wcd6d

	text ""
	cont "haben?"
	done

_SorryNeedMoreCoinsText::
	text "Schade. Du hast"
	line "zu wenig Münzen!@@"

_OopsYouDontHaveEnoughRoomText::
	text "Ups! Du hast"
	line "momentan keinen"
	cont "Platz dafür!@@"

_OhFineThenText::
	text "Dann ist ja alles"
	line "klar.@@"

_GetDexRatedText::
	text "Soll Dein #DEX"
	line "bewertet werden?"
	done

_ClosedOaksPCText::
	text "Die Verbindung zu"
	line "PROF. EICHS PC"
	cont "wurde getrennt.@@"

_AccessedOaksPCText::
	text "Die Verbindung zu"
	line "PROF. EICHS PC"
	cont "wurde erstellt."

	para "Du hast Zugriff"
	line "auf die #DEX-"
	cont "BEWERTUNG."
	prompt

_WhereWouldYouLikeText::
	text "Wohin möchtest"
	line "Du gehen?"
	done

_PleaseWaitText::
	text "OK. Bitte warte"
	line "einen Augenblick!"
	done

_LinkCanceledText::
	text "Die Verbindung"
	line "wurde getrennt."
	done

INCLUDE "text/oakspeech.asm"

_DoYouWantToNicknameText::
	text "Möchtest Du"
	line "@"
	TX_RAM wcd6d

	text " einen"
	cont "Spitznamen geben?"
	done

_YourNameIsText::
	text "Richtig! Dein"
	line "Name ist <PLAYER>!"
	prompt

_HisNameIsText::
	text "<RIVAL>! Stimmt!"
	line "Es lag mir auf"
	cont "der Zunge!"
	prompt

_WillBeTradedText::
	TX_RAM wNameOfPlayerMonToBeTraded
	text " soll"
	line "gegen @"
	TX_RAM wcd6d
	text ""
	cont "getauscht werden."
	done

_Char00Text::
	TX_NUM hSpriteIndexOrTextID,1,2
	text " FEHLER"
	done

_Char55Text::
	text $4B,"@@"

INCLUDE "text/maps/digletts_cave_route_2_entrance.asm"
INCLUDE "text/maps/viridian_forest_exit.asm"
INCLUDE "text/maps/route_2_house.asm"
INCLUDE "text/maps/route_2_gate.asm"
INCLUDE "text/maps/viridian_forest_entrance.asm"
INCLUDE "text/maps/mt_moon_pokecenter.asm"
INCLUDE "text/maps/saffron_gates.asm"
INCLUDE "text/maps/daycare_1.asm"


SECTION "Text 4", ROMX[$4000], BANK[TEXT_4]

INCLUDE "text/maps/daycare_2.asm"
INCLUDE "text/maps/underground_path_route_6_entrance.asm"
INCLUDE "text/maps/underground_path_route_7_entrance.asm"
INCLUDE "text/maps/underground_path_route_7_entrance_unused.asm"
INCLUDE "text/maps/underground_path_route_8_entrance.asm"
INCLUDE "text/maps/rock_tunnel_pokecenter.asm"
INCLUDE "text/maps/rock_tunnel_b1f.asm"
INCLUDE "text/maps/power_plant.asm"
INCLUDE "text/maps/route_11_gate.asm"
INCLUDE "text/maps/route_11_gate_upstairs.asm"
INCLUDE "text/maps/digletts_cave_route_11_entrance.asm"
INCLUDE "text/maps/route_12_gate.asm"
INCLUDE "text/maps/route_12_gate_upstairs.asm"
INCLUDE "text/maps/route_12_house.asm"
INCLUDE "text/maps/route_15_gate.asm"
INCLUDE "text/maps/route_15_gate_upstairs.asm"
INCLUDE "text/maps/route_16_gate.asm"
INCLUDE "text/maps/route_16_gate_upstairs.asm"
INCLUDE "text/maps/route_16_house.asm"
INCLUDE "text/maps/route_18_gate.asm"
INCLUDE "text/maps/route_18_gate_upstairs.asm"
INCLUDE "text/maps/pokemon_league_gate.asm"
INCLUDE "text/maps/victory_road_2f.asm"
INCLUDE "text/maps/bills_house.asm"
INCLUDE "text/maps/route_1.asm"
INCLUDE "text/maps/route_2.asm"
INCLUDE "text/maps/route_3.asm"
INCLUDE "text/maps/route_4.asm"
INCLUDE "text/maps/route_5.asm"
INCLUDE "text/maps/route_6.asm"
INCLUDE "text/maps/route_7.asm"
INCLUDE "text/maps/route_8.asm"
INCLUDE "text/maps/route_9.asm"
INCLUDE "text/maps/route_10.asm"
INCLUDE "text/maps/route_11_1.asm"


SECTION "Text 5", ROMX[$4000], BANK[TEXT_5]

INCLUDE "text/maps/route_11_2.asm"
INCLUDE "text/maps/route_12.asm"
INCLUDE "text/maps/route_13.asm"
INCLUDE "text/maps/route_14.asm"
INCLUDE "text/maps/route_15.asm"
INCLUDE "text/maps/route_16.asm"
INCLUDE "text/maps/route_17.asm"
INCLUDE "text/maps/route_18.asm"
INCLUDE "text/maps/route_19.asm"
INCLUDE "text/maps/route_20.asm"
INCLUDE "text/maps/route_21.asm"
INCLUDE "text/maps/route_22.asm"
INCLUDE "text/maps/route_23.asm"
INCLUDE "text/maps/route_24_1.asm"


SECTION "Text 6", ROMX[$4000], BANK[TEXT_6]

INCLUDE "text/maps/route_24_2.asm"
INCLUDE "text/maps/route_25.asm"

_FileDataDestroyedText::
	text "Die Speicherdaten"
	line "sind defekt!"
	prompt

_WouldYouLikeToSaveText::
	text "Möchtest Du das"
	line "Spiel SICHERN?"
	done

_GameSavedText::
	text "<PLAYER> hat das"
	line "Spiel gesichert!"
	done

_OlderFileWillBeErasedText::
	text "Der bisherige"
	line "Spielstand wird"
	cont "überschrieben!"
	cont "OK?"
	done

_WhenYouChangeBoxText::
	text "Vor einem Wechsel"
	line "der #MON-BOX"
	cont "wird das Spiel"
	cont "gesichert!"

	para "Einverstanden?"
	done

_ChooseABoxText::
	text "Wähle eine"
	line "<pkmn>-BOX!@@"

_EvolvedText::
	TX_RAM wcf50
	text " wurde"
	done

_IntoText::
	text ""
	line "zu @"
	TX_RAM wcd6d
	text "!"
	done

_StoppedEvolvingText::
	text "Hmm? @"
	TX_RAM wcf50
	text "s"
	line "Entwicklung ist"
	cont "abgebrochen!"
	prompt

_IsEvolvingText::
	text "Hey! @"
	TX_RAM wcf50
	text ""
	line "entwickelt sich!"
	done

_FellAsleepText::
	text "<TARGET>"
	line "schläft!"
	prompt

_AlreadyAsleepText::
	text "<TARGET>"
	line "schläft bereits!"
	prompt

_PoisonedText::
	text "<TARGET>"
	line "wurde vergiftet!"
	prompt

_BadlyPoisonedText::
	text "<TARGET>"
	line "ist vergiftet!"
	prompt

_BurnedText::
	text "<TARGET>"
	line "brennt!"
	prompt

_FrozenText::
	text "<TARGET>"
	line "erstarrt zu Eis!"
	prompt

_FireDefrostedText::
	text "<TARGET>"
	line "ist aufgetaut!"
	prompt

_MonsStatsRoseText::
	text "<USER>s"
	line "@"
	TX_RAM wcf50
	text "@@"

_GreatlyRoseText::
	text "@@"

_RoseText::
	text " nimmt zu!"
	prompt

_MonsStatsFellText::
	text "<TARGET>s"
	line "@"
	TX_RAM wcf50
	text "@@"

_GreatlyFellText::
	text "@@"

_FellText::
	text " sinkt! "
	prompt

_RanFromBattleText::
	text "<USER>"
	line "ist geflohen!"
	prompt

_RanAwayScaredText::
	text "<TARGET>"
	line "läuft davon!"
	prompt

_WasBlownAwayText::
	text "<TARGET>"
	line "wurde weggeweht!"
	prompt

_ChargeMoveEffectText::
	text "<USER>@@"

_MadeWhirlwindText::
	text ""
	line "erz. WIRBELWIND!"
	prompt

_TookInSunlightText::
	text ""
	line "badet im Licht!"
	prompt

_LoweredItsHeadText::
	text ""
	line "duckt sich!"
	prompt

_SkyAttackGlowingText::
	text ""
	line "leuchtet!"
	prompt

_FlewUpHighText::
	text ""
	line "fliegt empor!"
	prompt

_DugAHoleText::
	text ""
	line "gräbt sich ein!"
	prompt

_BecameConfusedText::
	text "<TARGET>"
	line "ist verwirrt!"
	prompt

_MimicLearnedMoveText::
	text "<USER> hat"
	line "@"
	TX_RAM wcd6d
	text ""
	cont "gelernt!"
	prompt

_MoveWasDisabledText::
	text "<TARGET>s"
	line "@"
	TX_RAM wcd6d
	text ""
	cont "wird blockiert!"
	prompt

_NothingHappenedText::
	text "Nichts geschieht!"
	prompt

_NoEffectText::
	text "Es hat keine"
	line "Wirkung!"
	prompt

_ButItFailedText::
	text "Die Attacke"
	line "schlug fehl!"
	prompt

_DidntAffectText::
	text "Es hat keine"
	line "Wirkung!"
	prompt

_IsUnaffectedText::
	text "<TARGET>"
	line "blieb unversehrt!"
	prompt

_ParalyzedMayNotAttackText::
	text "<TARGET>"
	line "ist paralysiert!"
	prompt

_SubstituteText::
	text "Es setzt einen"
	line "DELEGATOR ein!"
	prompt

_HasSubstituteText::
	text "<USER>"
	line "ben. DELEGATOR!"
	prompt

_TooWeakSubstituteText::
	text "Keine Energie für"
	line "den DELEGATOR!"
	prompt

_CoinsScatteredText::
	text "Es liegen überall"
	line "Münzen verstreut!"
	prompt

_GettingPumpedText::
	text "<USER>"
	line "pumpt sich auf!"
	prompt

_WasSeededText::
	text "<TARGET>"
	line "wurde bepflanzt!"
	prompt

_EvadedAttackText::
	text "<TARGET>"
	line "ist ausgewichen!"
	prompt

_HitWithRecoilText::
	text "<USER>"
	line "wird verletzt!"
	prompt

_ConvertedTypeText::
	text "<TARGET>s"
	line "Elem. adaptiert!"
	prompt

_StatusChangesEliminatedText::
	text "Alle STATUS-"
	line "VERÄNDERUNGEN"
	cont "wurden entfernt!"
	prompt

_StartedSleepingEffect::
	text "<USER>"
	line "schläft!"
	done

_FellAsleepBecameHealthyText::
	text "<USER>"
	line "ist eingeschlafen"
	cont "und genesen!"
	done

_RegainedHealthText::
	text "<USER>"
	line "erholt sich!"
	prompt

_TransformedText::
	text "<USER>"
	line "verwandelt sich"
	cont "in  @"
	TX_RAM wcd6d
	text "!"
	prompt

_LightScreenProtectedText::
	text "<USER>"
	line "ist gegen "
	cont "SPEZIAL-ATTACKEN"
	cont "immun!"
	prompt

_ReflectGainedArmorText::
	text "<USER>"
	line "erhält Panzer!"
	prompt

_ShroudedInMistText::
	text "<USER>"
	line "ist eingenebelt!"
	prompt

_SuckedHealthText::
	text "<TARGET>"
	line "hat KP verloren!"
	prompt

_DreamWasEatenText::
	text "<TARGET>s"
	line "Traum gefressen!"
	prompt

_TradeCenterText1::
	text "!"
	done

_ColosseumText1::
	text "!"
	done

INCLUDE "text/maps/reds_house_1f.asm"
INCLUDE "text/maps/blues_house.asm"
INCLUDE "text/maps/oaks_lab.asm"
INCLUDE "text/maps/viridian_pokecenter.asm"
INCLUDE "text/maps/viridian_mart.asm"
INCLUDE "text/maps/school.asm"
INCLUDE "text/maps/viridian_house.asm"
INCLUDE "text/maps/viridian_gym.asm"
INCLUDE "text/maps/museum_1f.asm"
INCLUDE "text/maps/museum_2f.asm"
INCLUDE "text/maps/pewter_gym_1.asm"


SECTION "Text 7", ROMX[$4000], BANK[TEXT_7]

INCLUDE "text/maps/pewter_gym_2.asm"
INCLUDE "text/maps/pewter_house_1.asm"
INCLUDE "text/maps/pewter_mart.asm"
INCLUDE "text/maps/pewter_house_2.asm"
INCLUDE "text/maps/pewter_pokecenter.asm"
INCLUDE "text/maps/cerulean_trashed_house.asm"
INCLUDE "text/maps/cerulean_trade_house.asm"
INCLUDE "text/maps/cerulean_pokecenter.asm"
INCLUDE "text/maps/cerulean_gym.asm"
INCLUDE "text/maps/bike_shop.asm"
INCLUDE "text/maps/cerulean_mart.asm"
INCLUDE "text/maps/cerulean_badge_house.asm"
INCLUDE "text/maps/lavender_pokecenter.asm"
INCLUDE "text/maps/pokemon_tower_1f.asm"
INCLUDE "text/maps/pokemon_tower_2f.asm"
INCLUDE "text/maps/pokemon_tower_3f.asm"
INCLUDE "text/maps/pokemon_tower_4f.asm"
INCLUDE "text/maps/pokemon_tower_5f.asm"
INCLUDE "text/maps/pokemon_tower_6f.asm"
INCLUDE "text/maps/pokemon_tower_7f.asm"
INCLUDE "text/maps/fujis_house.asm"
INCLUDE "text/maps/lavender_mart.asm"
INCLUDE "text/maps/lavender_house.asm"
INCLUDE "text/maps/name_rater.asm"
INCLUDE "text/maps/vermilion_pokecenter.asm"
INCLUDE "text/maps/fan_club.asm"
INCLUDE "text/maps/vermilion_mart.asm"
INCLUDE "text/maps/vermilion_gym_1.asm"


SECTION "Text 8", ROMX[$4000], BANK[TEXT_8]

INCLUDE "text/maps/vermilion_gym_2.asm"
INCLUDE "text/maps/vermilion_house.asm"
INCLUDE "text/maps/vermilion_dock.asm"
INCLUDE "text/maps/vermilion_fishing_house.asm"
INCLUDE "text/maps/celadon_dept_store_1f.asm"
INCLUDE "text/maps/celadon_dept_store_2f.asm"
INCLUDE "text/maps/celadon_dept_store_3f.asm"
INCLUDE "text/maps/celadon_dept_store_4f.asm"
INCLUDE "text/maps/celadon_dept_store_roof.asm"
INCLUDE "text/maps/celadon_mansion_1f.asm"
INCLUDE "text/maps/celadon_mansion_2f.asm"
INCLUDE "text/maps/celadon_mansion_3f.asm"
INCLUDE "text/maps/celadon_mansion_4f_outside.asm"
INCLUDE "text/maps/celadon_mansion_4f_inside.asm"
INCLUDE "text/maps/celadon_pokecenter.asm"
INCLUDE "text/maps/celadon_gym.asm"
INCLUDE "text/maps/celadon_game_corner.asm"
INCLUDE "text/maps/celadon_dept_store_5f.asm"
INCLUDE "text/maps/celadon_prize_room.asm"
INCLUDE "text/maps/celadon_diner.asm"
INCLUDE "text/maps/celadon_house.asm"
INCLUDE "text/maps/celadon_hotel.asm"
INCLUDE "text/maps/fuchsia_mart.asm"
INCLUDE "text/maps/fuchsia_house.asm"
INCLUDE "text/maps/fuchsia_pokecenter.asm"
INCLUDE "text/maps/wardens_house.asm"
INCLUDE "text/maps/safari_zone_entrance.asm"
INCLUDE "text/maps/fuchsia_gym_1.asm"


SECTION "Text 9", ROMX[$4000], BANK[TEXT_9]

INCLUDE "text/maps/fuchsia_gym_2.asm"
INCLUDE "text/maps/fuchsia_meeting_room.asm"
INCLUDE "text/maps/fuchsia_fishing_house.asm"
INCLUDE "text/maps/mansion_1f.asm"
INCLUDE "text/maps/cinnabar_gym.asm"
INCLUDE "text/maps/cinnabar_lab.asm"
INCLUDE "text/maps/cinnabar_lab_trade_room.asm"
INCLUDE "text/maps/cinnabar_lab_metronome_room.asm"
INCLUDE "text/maps/cinnabar_lab_fossil_room.asm"
INCLUDE "text/maps/cinnabar_pokecenter.asm"
INCLUDE "text/maps/cinnabar_mart.asm"
INCLUDE "text/maps/indigo_plateau_lobby.asm"
INCLUDE "text/maps/copycats_house_1f.asm"
INCLUDE "text/maps/copycats_house_2f.asm"
INCLUDE "text/maps/fighting_dojo.asm"
INCLUDE "text/maps/saffron_gym.asm"
INCLUDE "text/maps/saffron_house.asm"
INCLUDE "text/maps/saffron_mart.asm"
INCLUDE "text/maps/silph_co_1f.asm"
INCLUDE "text/maps/saffron_pokecenter.asm"
INCLUDE "text/maps/mr_psychics_house.asm"

_PokemartGreetingText::
	text "Hallo!"
	next "Kann ich Dir"
	cont "behilflich sein?"
	done

_PokemonFaintedText::
	TX_RAM wcd6d
	text ""
	line "wurde besiegt!"
	done

_PlayerBlackedOutText::
	text "<PLAYER> hat keine"
	line "einsatzbereiten"
	cont "#MON mehr!"

	para "<PLAYER> fällt"
	line "in Ohnmacht!"
	prompt

_RepelWoreOffText::
	text "Der SCHUTZ wirkt"
	line "nicht mehr."
	done

_PokemartBuyingGreetingText::
	text "Schau Dich in"
	line "Ruhe um."
	done

_PokemartTellBuyPriceText::
	TX_RAM wcf50
	text "?"
	line "Das macht dann"
	cont "¥@"
	TX_BCD hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "! OK?"
	done

_PokemartBoughtItemText::
	text "Hier, bitte sehr!"
	line "Vielen Dank!"
	prompt

_PokemartNotEnoughMoneyText::
	text "Du hast nicht"
	line "genug Geld."
	prompt

_PokemartItemBagFullText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	prompt

_PokemonSellingGreetingText::
	text "Was möchtest Du"
	line "verkaufen?"
	done

_PokemartTellSellPriceText::
	text "Ich gebe Dir"
	line "¥@"
	TX_BCD hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text " dafür."
	done

_PokemartItemBagEmptyText::
	text "Du hast nichts,"
	line "was Du verkaufen"
	cont "könntest!"
	prompt

_PokemartUnsellableItemText::
	text "Das kann ich"
	line "nicht gebrauchen."
	prompt

_PokemartThankYouText::
	text "Vielen Dank!"
	done

_PokemartAnythingElseText::
	text "Kann ich sonst"
	line "irgendwie helfen?"
	done

_LearnedMove1Text::
	TX_RAM wLearnMoveMonName
	text " lernt"
	line "@"
	TX_RAM wcf50
	text "!@@"

_WhichMoveToForgetText::
	text "Welche Attacke"
	next "soll vergessen"
	cont "werden?"
	done

_AbandonLearningText::
	TX_RAM wcf50
	text ""
	line "nicht erlernen?"
	done

_DidNotLearnText::
	TX_RAM wLearnMoveMonName
	text ""
	line "hat @"
	TX_RAM wcf50
	text ""
	cont "nicht erlernt!"
	prompt

_TryingToLearnText::
	TX_RAM wLearnMoveMonName
	text ""
	line "versucht,"
	cont "@"
	TX_RAM wcf50
	text " zu"
	cont "erlernen!"

	para "Aber @"
	TX_RAM wLearnMoveMonName
	text ""
	line "kann nicht mehr"
	cont "als vier Attacken"
	cont "erlernen!"

	para "Soll eine andere"
	line "Attacke zugunsten"
	cont "von @"
	TX_RAM wcf50
	text ""
	cont "vergessen werden?"
	done

_OneTwoAndText::
	text "1, 2, @@"

_PoofText::
	text "schwupp!@@"

_ForgotAndText::
	text ""
	para "@"
	TX_RAM wLearnMoveMonName
	text " hat"
	line "@"
	TX_RAM wcd6d
	text ""
	cont "vergessen!"

	para "Und..."
	prompt

_HMCantDeleteText::
	text "VM-Attacken"
	line "können nicht"
	cont "gelöscht werden!"
	prompt

_PokemonCenterWelcomeText::
	text "Willkommen im"
	line "PKMN-CENTER!"

	para "Wir heilen Deine"
	line "#MON und"
	cont "machen sie wieder"
	cont "fit!"
	prompt

_ShallWeHealYourPokemonText::
	text "Sollen wir Deine"
	line "#MON heilen?"
	done

_NeedYourPokemonText::
	text "OK. Wir benötigen"
	line "Deine #MON."
	done

_PokemonFightingFitText::
	text "Danke! Deine"
	line "#MON sind"
	cont "wieder topfit!"
	prompt

_PokemonCenterFarewellText::
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

_CableClubNPCAreaReservedFor2FriendsLinkedByCableText::
	text "Dieser Bereich"
	line "ist für Freunde"
	cont "reserviert, die"
	cont "über Game Link"
	cont "Kabel miteinander"
	cont "spielen!"
	done

_CableClubNPCWelcomeText::
	text "Willkommen im"
	line "KABEL-CLUB!"
	done

_CableClubNPCPleaseApplyHereHaveToSaveText::
	text "Bitte melde Dich"
	line "hier an."

	para "Das Spiel wird"
	line "gesichert, bevor"
	cont "die Verbindung"
	cont "hergestellt wird!"
	done

_CableClubNPCPleaseWaitText::
	text "Bitte warten.@@"

_CableClubNPCLinkClosedBecauseOfInactivityText::
	text "Die Verbindung"
	line "wurde getrennt."

	para "Es erfolgte keine"
	line "Bestätigung von"
	cont "der Gegenseite!"

	para "Versuche es"
	line "noch einmal!"
	done


SECTION "Text 10", ROMX[$4000], BANK[TEXT_10]

_CableClubNPCPleaseComeAgainText::
	text "Komm jederzeit"
	line "wieder vorbei!"
	done

_CableClubNPCMakingPreparationsText::
	text "Wir treffen"
	line "gerade die"
	cont "Vorbereitungen."
	cont "Bitte warte!"
	done

_UsedStrengthText::
	TX_RAM wcd6d
	text ""
	line "setzt STÄRKE ein.@@"

_CanMoveBouldersText::
	TX_RAM wcd6d
	text " kann"
	line "Felsen bewegen."
	prompt

_CurrentTooFastText::
	text "Die Strömung"
	line "ist zu stark!"
	prompt

_CyclingIsFunText::
	text "Radfahren macht"
	line "Spaß! Surfen"
	cont "dagegen ist"
	cont "nichts!"
	prompt

_FlashLightsAreaText::
	text "Ein gleißender"
	line "BLITZ erhellt"
	cont "das Gebiet!"
	prompt

_WarpToLastPokemonCenterText::
	text "In das letzte"
	line "PKMN-CENTER"
	cont "zurückkehren?"
	done

_CannotUseTeleportNowText::
	TX_RAM wcd6d
	text " kann"
	line "TELEPORT momentan"
	cont "nicht einsetzen!"
	prompt

_CannotFlyHereText::
	TX_RAM wcd6d
	text ""
	line "kann hier nicht"
	cont "FLIEGEN."
	prompt

_NotHealthyEnoughText::
	text "Nicht genug"
	line "Kraftpunkte!"
	prompt

_NewBadgeRequiredText::
	text "Nein! Hier"
	line "benötigt man"
	cont "einen neuen"
	cont "ORDEN!"
	prompt

_CannotUseItemsHereText::
	text "Du kannst hier"
	line "keine Items"
	cont "einsetzen!"
	prompt

_CannotGetOffHereText::
	text "Du kannst hier"
	line "nicht absteigen!"
	prompt

_GotMonText::
	text "<PLAYER> erhält"
	line "@"
	TX_RAM wcd6d
	text "!@@"

_SetToBoxText::
	text "Es ist nicht"
	line "genug Platz für"
	cont "das #MON!"
	cont "@"
	TX_RAM wBoxMonNicks
	text " wurde"
	cont "mittels PC in"
	cont "#MON-BOX @"
	TX_RAM wcf50
	text ""
	cont "transferiert!"
	done

_BoxIsFullText::
	text "Es ist kein Platz"
	line "für das #MON!"

	para "Die #MON-BOX"
	line "ist voll und kann"
	cont "keine weiteren"
	cont "#MON"
	cont "aufnehmen!"

	para "Wechsle in einem"
	line "#MON-CENTER"
	cont "die BOX!"
	done

INCLUDE "text/maps/pallet_town.asm"
INCLUDE "text/maps/viridian_city.asm"
INCLUDE "text/maps/pewter_city.asm"
INCLUDE "text/maps/cerulean_city.asm"
INCLUDE "text/maps/lavender_town.asm"
INCLUDE "text/maps/vermilion_city.asm"
INCLUDE "text/maps/celadon_city.asm"
INCLUDE "text/maps/fuchsia_city.asm"
INCLUDE "text/maps/cinnabar_island.asm"
INCLUDE "text/maps/saffron_city.asm"

_ItemUseBallText00::
	text "Es weicht dem"
	line "BALL aus!"

	para "Dieses #MON"
	line "läßt sich nicht"
	cont "fangen!"
	prompt

_ItemUseBallText01::
	text "Du hast das"
	line "#MON verfehlt!"
	prompt

_ItemUseBallText02::
	text "Mist! Das #MON"
	line "hat sich befreit!"
	prompt

_ItemUseBallText03::
	text "Fast hätte es"
	line "geklappt! "
	prompt

_ItemUseBallText04::
	text "Verflixt! Es"
	line "hätte beinahe"
	cont "geklappt!"
	prompt

_ItemUseBallText05::
	text "Wunderbar!"
	line "@"
	TX_RAM wEnemyMonNick
	text " wurde"
	cont "gefangen!@@"

_ItemUseBallText07::
	TX_RAM wBoxMonNicks
	text " wurde"
	line "auf BILLS PC"
	cont "übertragen!"
	prompt

_ItemUseBallText08::
	TX_RAM wBoxMonNicks
	text " wurde"
	line "auf den GAST-PC"
	cont "übertragen!"
	prompt

_ItemUseBallText06::
	text "Für @"
	TX_RAM wEnemyMonNick
	text ""
	line "wird ein neuer"
	cont "Eintrag im"
	cont "#DEX angelegt!@@"

_SurfingGotOnText::
	text "<PLAYER> steigt"
	line "auf @"
	TX_RAM wcd6d
	text "!"
	prompt

_SurfingNoPlaceToGetOffText::
	text "Hier kann man"
	line "nicht absteigen!"
	prompt

_VitaminStatRoseText::
	TX_RAM wcd6d
	text "s"
	line "@"
	TX_RAM wcf50
	text " ist"
	cont "gestiegen."
	prompt

_VitaminNoEffectText::
	text "Das würde keinen"
	line "Effekt haben."
	prompt

_ThrewBaitText::
	text "<PLAYER> wirft"
	line "einen KÖDER aus."
	done

_ThrewRockText::
	text "<PLAYER> hat "
	line "einen STEIN"
	cont "geworfen."
	done

_PlayedFluteNoEffectText::
	text "Die #FLÖTE"
	line "wurde gespielt!"

	para "Eine schöne"
	line "Melodie!"
	prompt

_FluteWokeUpText::
	text "Alle schlafenden"
	line "#MON sind"
	cont "aufgewacht."
	prompt

_PlayedFluteHadEffectText::
	text "<PLAYER> spielt"
	line "die #FLÖTE.@@"

_CoinCaseNumCoinsText::
	text "Münzen"
	line "@"
	TX_BCD wPlayerCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " "
	prompt

_ItemfinderFoundItemText::
	text "Oh! Der DETEKTOR"
	line "zeigt an, daß ein"
	cont "Item in der Nähe"
	cont "liegt!"
	prompt

_ItemfinderFoundNothingText::
	text "Nichts! Der"
	line "DETEKTOR schlägt"
	cont "nicht an."
	prompt

_RaisePPWhichTechniqueText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP erhöht"
	cont "werden?"
	done

_RestorePPWhichTechniqueText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP erneuert"
	cont "werden?"
	done

_PPMaxedOutText::
	text "Die AP von"
	line "@"
	TX_RAM wcf50
	text " sind"
	cont "auf dem Maximum!"
	prompt

_PPIncreasedText::
	text "Die AP von"
	line "@"
	TX_RAM wcf50
	text ""
	cont "sind gestiegen."
	prompt

_PPRestoredText::
	text "Die AP wurden"
	line "aufgefüllt!"
	prompt

_BootedUpTMText::
	text "TM aktiviert!"
	prompt

_BootedUpHMText::
	text "VM aktiviert!"
	prompt

_TeachMachineMoveText::
	text "Sie enthält"
	line "@"
	TX_RAM wcf50
	text "!"

	para "@"
	TX_RAM wcf50
	text ""
	line "einem #MON"
	cont "beibringen?"
	done

_MonCannotLearnMachineMoveText::
	TX_RAM wcf50
	text ""
	line "paßt nicht zu"
	cont "@"
	TX_RAM wcd6d
	text "."

	para "Es kann"
	line "@"
	TX_RAM wcf50
	text ""
	cont "nicht lernen."
	prompt

_ItemUseNotTimeText::
	text "EICH: <PLAYER>!"
	line "Es ist noch nicht"
	cont "an der Zeit, dies"
	cont "zu benutzen!"
	prompt

_ItemUseNotYoursToUseText::
	text "Dies gehört Dir"
	line "nicht!"
	prompt

_ItemUseNoEffectText::
	text "Das hätte keinen"
	line "Effekt!"
	prompt

_ThrowBallAtTrainerMonText1::
	text "Der Trainer hat"
	line "den BALL"
	cont "abgeblockt!"
	prompt

_ThrowBallAtTrainerMonText2::
	text "Sei kein Dieb!"
	prompt

_NoCyclingAllowedHereText::
	text "Das Radfahren ist"
	next "hier verboten!"
	prompt

_NoSurfingHereText::
	text "Hier kann nicht"
	line "auf @"
	TX_RAM wcd6d
	text ""
	cont "gesurft werden!"
	prompt

_BoxFullCannotThrowBallText::
	text "Die #MON-BOX"
	line "ist voll! Das"
	cont "Item kann nicht"
	cont "benutzt werden!"
	prompt


SECTION "Text 11", ROMX[$4000], BANK[TEXT_11]

_ItemUseText001::
	text "<PLAYER> setzt@@"

_ItemUseText002::
	TX_RAM wcf50
	text " ein!"
	done

_GotOnBicycleText1::
	text "<PLAYER> steigt@@"

_GotOnBicycleText2::
	text "auf das @"
	TX_RAM wcf50
	text "!"
	prompt

_GotOffBicycleText1::
	text "<PLAYER> steigt@@"

_GotOffBicycleText2::
	text "vom @"
	TX_RAM wcf50
	text " ab."
	prompt

_ThrewAwayItemText::
	TX_RAM wcd6d
	text ""
	line "weggeworfen!"
	prompt

_IsItOKToTossItemText::
	text "Willst Du"
	line "@"
	TX_RAM wcf50
	text ""
	cont "wegwerfen?"
	prompt

_TooImportantToTossText::
	text "Dieses Item ist"
	line "zu wichtig! Du"
	cont "kannst es nicht"
	cont "wegwerfen!"
	prompt

_AlreadyKnowsText::
	TX_RAM wcd6d
	text " kennt"
	line "@"
	TX_RAM wcf50
	text ""
	cont "bereits!"
	prompt

_ConnectCableText::
	text "OK, verbinde die"
	line "Kabel so! "
	prompt

_TradedForText::
	text "<PLAYER> hat"
	line "@"
	TX_RAM wInGameTradeGiveMonName
	text " gegen"
	cont "@"
	TX_RAM wInGameTradeReceiveMonName
	text ""
	cont "getauscht!@@"

_WannaTrade1Text::
	text "Ich suche nach"
	line "@"
	TX_RAM wInGameTradeGiveMonName
	text "!"

	para "Tauschst Du es"
	line "gegen @"
	TX_RAM wInGameTradeReceiveMonName
	text "?"
	done

_NoTrade1Text::
	text "Oje! Wenn"
	line "das so ist..."
	done

_WrongMon1Text::
	text "Was? Das ist aber"
	line "kein @"
	TX_RAM wInGameTradeGiveMonName
	text "!"

	para "Komm wieder,"
	line "wenn Du eins"
	cont "besitzt!"
	done

_Thanks1Text::
	text "Vielen Dank!"
	done

_AfterTrade1Text::
	text "Ist @"
	TX_RAM wInGameTradeReceiveMonName
	text ""
	line "nicht cool?"
	done

_WannaTrade2Text::
	text "Hallo! Willst Du"
	line "Dein @"
	TX_RAM wInGameTradeGiveMonName
	text ""

	para "nicht gegen ein"
	line "@"
	TX_RAM wInGameTradeReceiveMonName
	text ""
	para "tauschen?"
	done

_NoTrade2Text::
	text "Wenn Du nicht"
	line "magst, kann man"
	cont "nichts machen!"
	done

_WrongMon2Text::
	text "Hm? Das ist kein"
	line "@"
	TX_RAM wInGameTradeGiveMonName
	text "!"

	para "Denk an mich,"
	line "wenn Du eins"
	cont "gefangen hast!"
	done

_Thanks2Text::
	text "Danke!"
	done

_AfterTrade2Text::
	text "Der @"
	TX_RAM wInGameTradeGiveMonName
	text ","
	line "den Du mir"

	para "gegeben hast, hat"
	line "sich entwickelt!"
	done

_WannaTrade3Text::
	text "Besitzt Du ein"
	line "@"
	TX_RAM wInGameTradeGiveMonName
	text "?"

	para "Willst Du es"
	line "gegen @"
	TX_RAM wInGameTradeReceiveMonName
	text ""

	para "tauschen?"
	done

_NoTrade3Text::
	text "Schade!"
	done

_WrongMon3Text::
	text "Das ist kein"
	line "@"
	TX_RAM wInGameTradeGiveMonName
	text "!"

	para "Komm wieder,"
	line "wenn Du eins"
	cont "besitzt!"
	done

_Thanks3Text::
	text "Vielen Dank!"
	done

_AfterTrade3Text::
	text "Wie geht es"
	line "@"
	TX_RAM wInGameTradeReceiveMonName
	text "?"

	para "Mein @"
	TX_RAM wInGameTradeGiveMonName
	text ""
	line "fühlt sich super!"
	done

_NothingToCutText::
	text "Hier kann"
	line "man nichts"
	cont "zerschneiden!"
	prompt

_UsedCutText::
	TX_RAM wcd6d
	text " setzt"
	line "den ZERSCHNEIDER"
	cont "ein!"
	prompt


SECTION "Pokedex Text", ROMX[$4000], BANK[POKEDEX_TEXT]

INCLUDE "text/pokedex.asm"


SECTION "Move Names", ROMX[$4000], BANK[MOVE_NAMES]

INCLUDE "text/move_names.asm"
