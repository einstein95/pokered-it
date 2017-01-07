_DaisyInitialText::
	text "Hallo <PLAYER>!"
	line "<RIVAL> wartet"
	cont "in Opas Labor."
	done

_DaisyOfferMapText::
	text "Opa hat Dich um"
	line "einen Botengang"
	cont "gebeten? Hier,"
	cont "das wird Dir"
	cont "weiterhelfen!"
	prompt

_GotMapText::
	text "<PLAYER> erhält"
	line "eine @"
	TX_RAM wcf50
	text "!@@"

_DaisyBagFullText::
	text "Du trägst zu"
	line "viele Dinge mit"
	cont "Dir herum!"
	done

_DaisyUseMapText::
	text "Benutze die"
	line "KARTE, um Deinen"
	cont "Standort zu"
	cont "bestimmen."
	done

_BluesHouseText2::
	text "#MON sind"
	line "Lebewesen! Gönne"
	cont "ihnen eine Pause,"
	cont "wenn sie müde"
	cont "sind!"
	done

_BluesHouseText3::
	text "Eine große Karte!"
	line "Sie ist nützlich!"
	done
