_DayCareIntroText::
	text "Ich leite diese"
	line "PENSION. Soll"
	cont "ich eines Deiner"
	cont "#MON"
	cont "großziehen?"
	done

_DayCareWhichMonText::
	text "Welches #MON"
	line "soll hierbleiben?"
	prompt

_DayCareWillLookAfterMonText::
	text "OK, ich kümmere"
	line "mich eine Weile"
	cont "um @"
	TX_RAM wcd6d
	text "."
	prompt

_DayCareComeSeeMeInAWhileText::
	text "Komm später"
	line "wieder vorbei, um"
	cont "es abzuholen."
	done

_DayCareMonHasGrownText::
	TX_RAM wcd6d
	text ""
	line "hat sich toll "
	cont "entwickelt!"

	para "Es ist um @"
	TX_NUM wDayCareNumLevelsGrown,$1,$3
	text ""
	line "Level gestiegen!"

	para "Das habe ich gut"
	line "gemacht, oder?"
	prompt

_DayCareOweMoneyText::
	text "Bevor Du Dein"
	line "#MON wieder"
	cont "mitnimmst, "
	cont "bekomme ich noch"
	cont "¥@"
	TX_BCD wDayCareTotalCost, $c2
	text " von Dir!"
	done

_DayCareGotMonBackText::
	text "<PLAYER> erhält"
	line "@"
	TX_RAM wDayCareMonName

	text ""
	cont "zurück!"
	done

_DayCareMonNeedsMoreTimeText::
	text "Du bist schon"
	line "wieder zurück?"
	cont "@"
	TX_RAM wcd6d
	text " sollte"
	cont "noch ein bißchen"
	cont "bei mir bleiben."
	prompt
