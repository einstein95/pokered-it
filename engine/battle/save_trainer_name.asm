SaveTrainerName:
	ld hl,TrainerNamePointers
	ld a,[wTrainerClass]
	dec a
	ld c,a
	ld b,0
	add hl,bc
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,wcd6d
.CopyCharacter
	ld a,[hli]
	ld [de],a
	inc de
	cp "@"
	jr nz,.CopyCharacter
	ret

TrainerNamePointers:
; what is the point of these?
	dw YoungsterName
	dw BugCatcherName
	dw LassName
	dw wTrainerName
	dw JrTrainerMName
	dw JrTrainerFName
	dw PokemaniacName
	dw SuperNerdName
	dw wTrainerName
	dw wTrainerName
	dw BurglarName
	dw EngineerName
	dw JugglerXName
	dw wTrainerName
	dw SwimmerName
	dw wTrainerName
	dw wTrainerName
	dw BeautyName
	dw wTrainerName
	dw RockerName
	dw JugglerName
	dw wTrainerName
	dw wTrainerName
	dw BlackbeltName
	dw wTrainerName
	dw ProfOakName
	dw ChiefName
	dw ScientistName
	dw wTrainerName
	dw RocketName
	dw CooltrainerMName
	dw CooltrainerFName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName

YoungsterName:
	db "TEENAGER@"
BugCatcherName:
	db "KÄFERSAMMLER@"
LassName:
	db "GÖRE@"
JrTrainerMName:
	db "PFADFINDER@"
JrTrainerFName:
	db "PFADFINDERIN@"
PokemaniacName:
	db "#MANIAC@"
SuperNerdName:
	db "STREBER@"
BurglarName:
	db "DIEB@"
EngineerName:
	db "MECHANIKER@"
JugglerXName:
	db "JONGLEUR@"
SwimmerName:
	db "SCHWIMMER@"
BeautyName:
	db "SCHÖNHEIT@"
RockerName:
	db "ROCKER@"
JugglerName:
	db "JONGLEUR@"
BlackbeltName:
	db "SCHWARZGURT@"
ProfOakName:
	db "PROF.EICH@"
ChiefName:
	db "CHIEF@"
ScientistName:
	db "FORSCHER@"
RocketName:
	db "ROCKET@"
CooltrainerMName:
	db "TRAINER@"
CooltrainerFName:
	db "TRAINERIN@"
