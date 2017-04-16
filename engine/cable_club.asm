; performs the appropriate action when the player uses the gameboy on the table in the Colosseum or Trade Center
; In the Colosseum, it starts a battle. In the Trade Center, it displays the trade selection screen.
; Before doing either action, it swaps random numbers, trainer names and party data with the other gameboy.
CableClub_DoBattleOrTrade:
	ld c, 80
	call DelayFrames
	call ClearScreen
	call UpdateSprites
	call LoadFontTilePatterns
	call LoadHpBarAndStatusTilePatterns
	call LoadTrainerInfoTextBoxTiles
	coord hl, 3, 8
	ld b, 2
	ld c, 13
	call CableClub_TextBoxBorder
	coord hl, 4, 10
	ld de, PleaseWaitString
	call PlaceString
	ld hl, wPlayerNumHits
	xor a
	ld [hli], a
	ld [hl], $50
	; fall through

; This is called after completing a trade.
CableClub_DoBattleOrTradeAgain:
	ld hl, wSerialPlayerDataBlock
	ld a, SERIAL_PREAMBLE_BYTE
	ld b, 6
.writePlayerDataBlockPreambleLoop
	ld [hli], a
	dec b
	jr nz, .writePlayerDataBlockPreambleLoop
	ld hl, wSerialRandomNumberListBlock
	ld a, SERIAL_PREAMBLE_BYTE
	ld b, 7
.writeRandomNumberListPreambleLoop
	ld [hli], a
	dec b
	jr nz, .writeRandomNumberListPreambleLoop
	ld b, 10
.generateRandomNumberListLoop
	call Random
	cp SERIAL_PREAMBLE_BYTE ; all the random numbers have to be less than the preamble byte
	jr nc, .generateRandomNumberListLoop
	ld [hli], a
	dec b
	jr nz, .generateRandomNumberListLoop
	ld hl, wSerialPartyMonsPatchList
	ld a, SERIAL_PREAMBLE_BYTE
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld b, $c8
	xor a
.zeroPlayerDataPatchListLoop
	ld [hli], a
	dec b
	jr nz, .zeroPlayerDataPatchListLoop
	ld hl, wGrassRate
	ld bc, wTrainerHeaderPtr - wGrassRate
.zeroEnemyPartyLoop
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .zeroEnemyPartyLoop
	ld hl, wPartyMons - 1
	ld de, wSerialPartyMonsPatchList + 10
	ld bc, 0
.patchPartyMonsLoop
	inc c
	ld a, c
	cp SERIAL_PREAMBLE_BYTE
	jr z, .startPatchListPart2
	ld a, b
	dec a ; are we in part 2 of the patch list?
	jr nz, .checkPlayerDataByte ; jump if in part 1
; if we're in part 2
	ld a, c
	cp (wPartyMonOT - (wPartyMons - 1)) - (SERIAL_PREAMBLE_BYTE - 1)
	jr z, .finishedPatchingPlayerData
.checkPlayerDataByte
	inc hl
	ld a, [hl]
	cp SERIAL_NO_DATA_BYTE
	jr nz, .patchPartyMonsLoop
; if the player data byte matches SERIAL_NO_DATA_BYTE, patch it with $FF and record the offset in the patch list
	ld a, c
	ld [de], a
	inc de
	ld [hl], $ff
	jr .patchPartyMonsLoop
.startPatchListPart2
	ld a, SERIAL_PATCH_LIST_PART_TERMINATOR
	ld [de], a ; end of part 1
	inc de
	lb bc, 1, 0
	jr .patchPartyMonsLoop
.finishedPatchingPlayerData
	ld a, SERIAL_PATCH_LIST_PART_TERMINATOR
	ld [de], a ; end of part 2
	call Serial_SyncAndExchangeNybble
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .skipSendingTwoZeroBytes
; if using internal clock
; send two zero bytes for syncing purposes?
	call Delay3
	xor a
	ld [hSerialSendData], a
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ld [rSC], a
	call DelayFrame
	xor a
	ld [hSerialSendData], a
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ld [rSC], a
.skipSendingTwoZeroBytes
	call Delay3
	ld a, (1 << SERIAL)
	ld [rIE], a
	ld hl, wSerialRandomNumberListBlock
	ld de, wSerialOtherGameboyRandomNumberListBlock
	ld bc, $11
	call Serial_ExchangeBytes
	ld a, SERIAL_NO_DATA_BYTE
	ld [de], a
	ld hl, wSerialPlayerDataBlock
	ld de, wSerialEnemyDataBlock
	ld bc, $1a8
	call Serial_ExchangeBytes
	ld a, SERIAL_NO_DATA_BYTE
	ld [de], a
	ld hl, wSerialPartyMonsPatchList
	ld de, wSerialEnemyMonsPatchList
	ld bc, $c8
	call Serial_ExchangeBytes
	ld a, (1 << SERIAL) | (1 << TIMER) | (1 << VBLANK)
	ld [rIE], a
	ld a, $ff
	call PlaySound
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .skipCopyingRandomNumberList ; the list generated by the gameboy clocking the connection is used by both gameboys
	ld hl, wSerialOtherGameboyRandomNumberListBlock
.findStartOfRandomNumberListLoop
	ld a, [hli]
	and a
	jr z, .findStartOfRandomNumberListLoop
	cp SERIAL_PREAMBLE_BYTE
	jr z, .findStartOfRandomNumberListLoop
	cp SERIAL_NO_DATA_BYTE
	jr z, .findStartOfRandomNumberListLoop
	dec hl
	ld de, wLinkBattleRandomNumberList
	ld c, 10
.copyRandomNumberListLoop
	ld a, [hli]
	cp SERIAL_NO_DATA_BYTE
	jr z, .copyRandomNumberListLoop
	ld [de], a
	inc de
	dec c
	jr nz, .copyRandomNumberListLoop
.skipCopyingRandomNumberList
	ld hl, wSerialEnemyDataBlock + 3
.findStartOfEnemyNameLoop
	ld a, [hli]
	and a
	jr z, .findStartOfEnemyNameLoop
	cp SERIAL_PREAMBLE_BYTE
	jr z, .findStartOfEnemyNameLoop
	cp SERIAL_NO_DATA_BYTE
	jr z, .findStartOfEnemyNameLoop
	dec hl
	ld de, wLinkEnemyTrainerName
	ld c, NAME_LENGTH
.copyEnemyNameLoop
	ld a, [hli]
	cp SERIAL_NO_DATA_BYTE
	jr z, .copyEnemyNameLoop
	ld [de], a
	inc de
	dec c
	jr nz, .copyEnemyNameLoop
	ld de, wEnemyPartyCount
	ld bc, wTrainerHeaderPtr - wEnemyPartyCount
.copyEnemyPartyLoop
	ld a, [hli]
	cp SERIAL_NO_DATA_BYTE
	jr z, .copyEnemyPartyLoop
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copyEnemyPartyLoop
	ld de, wSerialPartyMonsPatchList
	ld hl, wPartyMons
	ld c, 2 ; patch list has 2 parts
.unpatchPartyMonsLoop
	ld a, [de]
	inc de
	and a
	jr z, .unpatchPartyMonsLoop
	cp SERIAL_PREAMBLE_BYTE
	jr z, .unpatchPartyMonsLoop
	cp SERIAL_NO_DATA_BYTE
	jr z, .unpatchPartyMonsLoop
	cp SERIAL_PATCH_LIST_PART_TERMINATOR
	jr z, .finishedPartyMonsPatchListPart
	push hl
	push bc
	ld b, 0
	dec a
	ld c, a
	add hl, bc
	ld a, SERIAL_NO_DATA_BYTE
	ld [hl], a
	pop bc
	pop hl
	jr .unpatchPartyMonsLoop
.finishedPartyMonsPatchListPart
	ld hl, wPartyMons + (SERIAL_PREAMBLE_BYTE - 1)
	dec c ; is there another part?
	jr nz, .unpatchPartyMonsLoop
	ld de, wSerialEnemyMonsPatchList
	ld hl, wEnemyMons
	ld c, 2 ; patch list has 2 parts
.unpatchEnemyMonsLoop
	ld a, [de]
	inc de
	and a
	jr z, .unpatchEnemyMonsLoop
	cp SERIAL_PREAMBLE_BYTE
	jr z, .unpatchEnemyMonsLoop
	cp SERIAL_NO_DATA_BYTE
	jr z, .unpatchEnemyMonsLoop
	cp SERIAL_PATCH_LIST_PART_TERMINATOR
	jr z, .finishedEnemyMonsPatchListPart
	push hl
	push bc
	ld b, 0
	dec a
	ld c, a
	add hl, bc
	ld a, SERIAL_NO_DATA_BYTE
	ld [hl], a
	pop bc
	pop hl
	jr .unpatchEnemyMonsLoop
.finishedEnemyMonsPatchListPart
	ld hl, wEnemyMons + (SERIAL_PREAMBLE_BYTE - 1)
	dec c
	jr nz, .unpatchEnemyMonsLoop
	ld a, wEnemyMonOT % $100
	ld [wUnusedCF8D], a
	ld a, wEnemyMonOT / $100
	ld [wUnusedCF8D + 1], a
	xor a
	ld [wTradeCenterPointerTableIndex], a
	ld a, $ff
	call PlaySound
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ld c, 66
	call z, DelayFrames ; delay if using internal clock
	ld a, [wLinkState]
	cp LINK_STATE_START_BATTLE
	ld a, LINK_STATE_TRADING
	ld [wLinkState], a
	jr nz, .trading
	ld a, LINK_STATE_BATTLING
	ld [wLinkState], a
	ld a, OPP_SONY1
	ld [wCurOpponent], a
	call ClearScreen
	call Delay3
	ld hl, wOptions
	res 7, [hl]
	predef InitOpponent
	predef HealParty
	jp ReturnToCableClubRoom
.trading
	ld c, BANK(Music_GameCorner)
	ld a, MUSIC_GAME_CORNER
	call PlayMusic
	jr CallCurrentTradeCenterFunction

PleaseWaitString:
	db "BITTE WARTEN!@"

CallCurrentTradeCenterFunction:
	ld hl, TradeCenterPointerTable
	ld b, 0
	ld a, [wTradeCenterPointerTableIndex]
	cp $ff
	jp z, DisplayTitleScreen
	add a
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

TradeCenter_SelectMon:
	call ClearScreen
	call LoadTrainerInfoTextBoxTiles
	call TradeCenter_DrawPartyLists
	call TradeCenter_DrawCancelBox
	xor a
	ld hl, wSerialSyncAndExchangeNybbleReceiveData
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuJoypadPollCount], a
	inc a
	ld [wSerialExchangeNybbleSendData], a
	jp .playerMonMenu
.enemyMonMenu
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	inc a
	ld [wWhichTradeMonSelectionMenu], a
	ld a, D_DOWN | D_LEFT | A_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, [wEnemyPartyCount]
	ld [wMaxMenuItem], a
	ld a, 9
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
.enemyMonMenu_HandleInput
	ld hl, hFlags_0xFFF6
	set 1, [hl]
	call HandleMenuInput
	ld hl, hFlags_0xFFF6
	res 1, [hl]
	and a
	jp z, .getNewInput
	bit 0, a ; A button pressed?
	jr z, .enemyMonMenu_ANotPressed
; if A button pressed
	ld a, [wMaxMenuItem]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr c, .displayEnemyMonStats
	ld a, [wMaxMenuItem]
	dec a
	ld [wCurrentMenuItem], a
.displayEnemyMonStats
	ld a, INIT_ENEMYOT_LIST
	ld [wInitListType], a
	callab InitList ; the list isn't used
	ld hl, wEnemyMons
	call TradeCenter_DisplayStats
	jp .getNewInput
.enemyMonMenu_ANotPressed
	bit 5, a ; Left pressed?
	jr z, .enemyMonMenu_LeftNotPressed
; if Left pressed, switch back to the player mon menu
	xor a ; player mon menu
	ld [wWhichTradeMonSelectionMenu], a
	ld a, [wMenuCursorLocation]
	ld l, a
	ld a, [wMenuCursorLocation + 1]
	ld h, a
	ld a, [wTileBehindCursor]
	ld [hl], a
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wPartyCount]
	dec a
	cp b
	jr nc, .playerMonMenu
	ld [wCurrentMenuItem], a
	jr .playerMonMenu
.enemyMonMenu_LeftNotPressed
	bit 7, a ; Down pressed?
	jp z, .getNewInput
	jp .selectedCancelMenuItem ; jump if Down pressed
.playerMonMenu
	xor a ; player mon menu
	ld [wWhichTradeMonSelectionMenu], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, D_DOWN | D_RIGHT | A_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, [wPartyCount]
	ld [wMaxMenuItem], a
	ld a, 1
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wTopMenuItemX], a
	coord hl, 1, 1
	lb bc, 6, 1
	call ClearScreenArea
.playerMonMenu_HandleInput
	ld hl, hFlags_0xFFF6
	set 1, [hl]
	call HandleMenuInput
	ld hl, hFlags_0xFFF6
	res 1, [hl]
	and a ; was anything pressed?
	jr nz, .playerMonMenu_SomethingPressed
	jp .getNewInput
.playerMonMenu_SomethingPressed
	bit 0, a ; A button pressed?
	jr z, .playerMonMenu_ANotPressed
	jp .chosePlayerMon ; jump if A button pressed
; unreachable code
	ld a, INIT_PLAYEROT_LIST
	ld [wInitListType], a
	callab InitList ; the list isn't used
	call TradeCenter_DisplayStats
	jp .getNewInput
.playerMonMenu_ANotPressed
	bit 4, a ; Right pressed?
	jr z, .playerMonMenu_RightNotPressed
; if Right pressed, switch to the enemy mon menu
	ld a, $1 ; enemy mon menu
	ld [wWhichTradeMonSelectionMenu], a
	ld a, [wMenuCursorLocation]
	ld l, a
	ld a, [wMenuCursorLocation + 1]
	ld h, a
	ld a, [wTileBehindCursor]
	ld [hl], a
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wEnemyPartyCount]
	dec a
	cp b
	jr nc, .notPastLastEnemyMon
; when switching to the enemy mon menu, if the menu selection would be past the last enemy mon, select the last enemy mon
	ld [wCurrentMenuItem], a
.notPastLastEnemyMon
	jp .enemyMonMenu
.playerMonMenu_RightNotPressed
	bit 7, a ; Down pressed?
	jr z, .getNewInput
	jp .selectedCancelMenuItem ; jump if Down pressed
.getNewInput
	ld a, [wWhichTradeMonSelectionMenu]
	and a
	jp z, .playerMonMenu_HandleInput
	jp .enemyMonMenu_HandleInput
.chosePlayerMon
	call SaveScreenTilesToBuffer1
	call PlaceUnfilledArrowMenuCursor
	ld a, [wMaxMenuItem]
	ld c, a
	ld a, [wCurrentMenuItem]
	cp c
	jr c, .displayStatsTradeMenu
	ld a, [wMaxMenuItem]
	dec a
.displayStatsTradeMenu
	push af
	coord hl, 0, 14
	ld b, 2
	ld c, 18
	call CableClub_TextBoxBorder
	coord hl, 2, 16
	ld de, .statsTrade
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuJoypadPollCount], a
	ld [wMaxMenuItem], a
	ld a, 16
	ld [wTopMenuItemY], a
.selectStatsMenuItem
	ld a, " "
	Coorda 11, 16
	ld a, D_RIGHT | B_BUTTON | A_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, 1
	ld [wTopMenuItemX], a
	call HandleMenuInput
	bit 4, a ; Right pressed?
	jr nz, .selectTradeMenuItem
	bit 1, a ; B button pressed?
	jr z, .displayPlayerMonStats
.cancelPlayerMonChoice
	pop af
	ld [wCurrentMenuItem], a
	call LoadScreenTilesFromBuffer1
	jp .playerMonMenu
.selectTradeMenuItem
	ld a, " "
	Coorda 1, 16
	ld a, D_LEFT | B_BUTTON | A_BUTTON
	ld [wMenuWatchedKeys], a
	ld a, 11
	ld [wTopMenuItemX], a
	call HandleMenuInput
	bit 5, a ; Left pressed?
	jr nz, .selectStatsMenuItem
	bit 1, a ; B button pressed?
	jr nz, .cancelPlayerMonChoice
	jr .choseTrade
.displayPlayerMonStats
	pop af
	ld [wCurrentMenuItem], a
	ld a, INIT_PLAYEROT_LIST
	ld [wInitListType], a
	callab InitList ; the list isn't used
	call TradeCenter_DisplayStats
	call LoadScreenTilesFromBuffer1
	jp .playerMonMenu
.choseTrade
	call PlaceUnfilledArrowMenuCursor
	pop af
	ld [wCurrentMenuItem], a
	ld [wTradingWhichPlayerMon], a
	ld [wSerialExchangeNybbleSendData], a
	call Serial_PrintWaitingTextAndSyncAndExchangeNybble
	ld a, [wSerialSyncAndExchangeNybbleReceiveData]
	cp $f
	jp z, CallCurrentTradeCenterFunction ; go back to the beginning of the trade selection menu if the other person cancelled
	ld [wTradingWhichEnemyMon], a
	call TradeCenter_PlaceSelectedEnemyMonMenuCursor
	ld a, $1 ; TradeCenter_Trade
	ld [wTradeCenterPointerTableIndex], a
	jp CallCurrentTradeCenterFunction
.statsTrade
	db "STATUS    TAUSCH@"
.selectedCancelMenuItem
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wMaxMenuItem]
	cp b
	jp nz, .getNewInput
	ld a, [wMenuCursorLocation]
	ld l, a
	ld a, [wMenuCursorLocation + 1]
	ld h, a
	ld a, " "
	ld [hl], a
.cancelMenuItem_Loop
	ld a, "▶" ; filled arrow cursor
	Coorda 1, 16
.cancelMenuItem_JoypadLoop
	call JoypadLowSensitivity
	ld a, [hJoy5]
	and a ; pressed anything?
	jr z, .cancelMenuItem_JoypadLoop
	bit 0, a ; A button pressed?
	jr nz, .cancelMenuItem_APressed
	bit 6, a ; Up pressed?
	jr z, .cancelMenuItem_JoypadLoop
; if Up pressed
	ld a, " "
	Coorda 1, 16
	ld a, [wPartyCount]
	dec a
	ld [wCurrentMenuItem], a
	jp .playerMonMenu
.cancelMenuItem_APressed
	ld a, "▷" ; unfilled arrow cursor
	Coorda 1, 16
	ld a, $f
	ld [wSerialExchangeNybbleSendData], a
	call Serial_PrintWaitingTextAndSyncAndExchangeNybble
	ld a, [wSerialSyncAndExchangeNybbleReceiveData]
	cp $f ; did the other person choose Cancel too?
	jr nz, .cancelMenuItem_Loop
	; fall through

ReturnToCableClubRoom:
	call GBPalWhiteOutWithDelay3
	ld hl, wFontLoaded
	ld a, [hl]
	push af
	push hl
	res 0, [hl]
	xor a
	ld [wd72d], a
	dec a
	ld [wDestinationWarpID], a
	call LoadMapData
	callba ClearVariablesOnEnterMap
	pop hl
	pop af
	ld [hl], a
	call GBFadeInFromWhite
	ret

TradeCenter_DrawCancelBox:
	coord hl, 8, 15
	ld a, $7e
	ld bc, 2 * SCREEN_WIDTH + 12
	call FillMemory
	coord hl, 0, 15
	ld b, 1
	ld c, 12
	call CableClub_TextBoxBorder
	coord hl, 2, 16
	ld de, CancelTextString
	jp PlaceString

CancelTextString:
	db "ABBRECHEN@"

TradeCenter_PlaceSelectedEnemyMonMenuCursor:
	ld a, [wSerialSyncAndExchangeNybbleReceiveData]
	coord hl, 1, 9
	ld bc, SCREEN_WIDTH
	call AddNTimes
	ld [hl], "▷" ; cursor
	ret

TradeCenter_DisplayStats:
	ld a, [wCurrentMenuItem]
	ld [wWhichPokemon], a
	predef StatusScreen
	predef StatusScreen2
	call GBPalNormal
	call LoadTrainerInfoTextBoxTiles
	call TradeCenter_DrawPartyLists
	jp TradeCenter_DrawCancelBox

TradeCenter_DrawPartyLists:
	coord hl, 0, 0
	ld b, 6
	ld c, 18
	call CableClub_TextBoxBorder
	coord hl, 0, 8
	ld b, 6
	ld c, 18
	call CableClub_TextBoxBorder
	coord hl, 5, 0
	ld de, wPlayerName
	call PlaceString
	coord hl, 5, 8
	ld de, wLinkEnemyTrainerName
	call PlaceString
	coord hl, 2, 1
	ld de, wPartySpecies
	call TradeCenter_PrintPartyListNames
	coord hl, 2, 9
	ld de, wEnemyPartyMons
	; fall through

TradeCenter_PrintPartyListNames:
	ld c, $0
.loop
	ld a, [de]
	cp $ff
	ret z
	ld [wd11e], a
	push bc
	push hl
	push de
	push hl
	ld a, c
	ld [$ff95], a
	call GetMonName
	pop hl
	call PlaceString
	pop de
	inc de
	pop hl
	ld bc, 20
	add hl, bc
	pop bc
	inc c
	jr .loop

TradeCenter_Trade:
	ld c, 100
	call DelayFrames
	xor a
	ld [wSerialExchangeNybbleSendData + 1], a ; unnecessary
	ld [wSerialExchangeNybbleReceiveData], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld [wMenuJoypadPollCount], a
	coord hl, 0, 12
	ld b, 4
	ld c, 18
	call CableClub_TextBoxBorder
	ld a, [wTradingWhichPlayerMon]
	ld hl, wPartySpecies
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wd11e], a
	call GetMonName
	ld hl, wcd6d
	ld de, wNameOfPlayerMonToBeTraded
	ld bc, NAME_LENGTH
	call CopyData
	ld a, [wTradingWhichEnemyMon]
	ld hl, wEnemyPartyMons
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wd11e], a
	call GetMonName
	ld hl, WillBeTradedText
	coord bc, 1, 14
	call TextCommandProcessor
	call SaveScreenTilesToBuffer1
	coord hl, 10, 7
	lb bc, 8, 11
	ld a, TRADE_CANCEL_MENU
	ld [wTwoOptionMenuID], a
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call LoadScreenTilesFromBuffer1
	ld a, [wCurrentMenuItem]
	and a
	jr z, .tradeConfirmed
; if trade cancelled
	ld a, $1
	ld [wSerialExchangeNybbleSendData], a
	coord hl, 0, 12
	ld b, 4
	ld c, 18
	call CableClub_TextBoxBorder
	coord hl, 1, 14
	ld de, TradeCanceled
	call PlaceString
	call Serial_PrintWaitingTextAndSyncAndExchangeNybble
	jp .tradeCancelled
.tradeConfirmed
	ld a, $2
	ld [wSerialExchangeNybbleSendData], a
	call Serial_PrintWaitingTextAndSyncAndExchangeNybble
	ld a, [wSerialSyncAndExchangeNybbleReceiveData]
	dec a ; did the other person cancel?
	jr nz, .doTrade
; if the other person cancelled
	coord hl, 0, 12
	ld b, 4
	ld c, 18
	call CableClub_TextBoxBorder
	coord hl, 1, 14
	ld de, TradeCanceled
	call PlaceString
	jp .tradeCancelled
.doTrade
	ld a, [wTradingWhichPlayerMon]
	ld hl, wPartyMonOT
	call SkipFixedLengthTextEntries
	ld de, wTradedPlayerMonOT
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wPartyMon1Species
	ld a, [wTradingWhichPlayerMon]
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld bc, wPartyMon1OTID - wPartyMon1
	add hl, bc
	ld a, [hli]
	ld [wTradedPlayerMonOTID], a
	ld a, [hl]
	ld [wTradedPlayerMonOTID + 1], a
	ld a, [wTradingWhichEnemyMon]
	ld hl, wEnemyMonOT
	call SkipFixedLengthTextEntries
	ld de, wTradedEnemyMonOT
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wEnemyMons
	ld a, [wTradingWhichEnemyMon]
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld bc, wEnemyMon1OTID - wEnemyMon1
	add hl, bc
	ld a, [hli]
	ld [wTradedEnemyMonOTID], a
	ld a, [hl]
	ld [wTradedEnemyMonOTID + 1], a
	ld a, [wTradingWhichPlayerMon]
	ld [wWhichPokemon], a
	ld hl, wPartySpecies
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wTradedPlayerMonSpecies], a
	xor a
	ld [wRemoveMonFromBox], a
	call RemovePokemon
	ld a, [wTradingWhichEnemyMon]
	ld c, a
	ld [wWhichPokemon], a
	ld hl, wEnemyPartyMons
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wcf91], a
	ld hl, wEnemyMons
	ld a, c
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld de, wLoadedMon
	ld bc, wEnemyMon2 - wEnemyMon1
	call CopyData
	call AddEnemyMonToPlayerParty
	ld a, [wPartyCount]
	dec a
	ld [wWhichPokemon], a
	ld a, $1
	ld [wForceEvolution], a
	ld a, [wTradingWhichEnemyMon]
	ld hl, wEnemyPartyMons
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wTradedEnemyMonSpecies], a
	ld a, 10
	ld [wAudioFadeOutControl], a
	ld a, $2
	ld [wAudioSavedROMBank], a
	ld a, MUSIC_SAFARI_ZONE
	ld [wNewSoundID], a
	call PlaySound
	ld c, 100
	call DelayFrames
	call ClearScreen
	call LoadHpBarAndStatusTilePatterns
	xor a
	ld [wUnusedCC5B], a
	ld a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .usingExternalClock
	predef InternalClockTradeAnim
	jr .tradeCompleted
.usingExternalClock
	predef ExternalClockTradeAnim
.tradeCompleted
	callab TryEvolvingMon
	call ClearScreen
	call LoadTrainerInfoTextBoxTiles
	call Serial_PrintWaitingTextAndSyncAndExchangeNybble
	ld c, 40
	call DelayFrames
	coord hl, 0, 12
	ld b, 4
	ld c, 18
	call CableClub_TextBoxBorder
	coord hl, 1, 14
	ld de, TradeCompleted
	call PlaceString
	predef SaveSAVtoSRAM2
	ld c, 50
	call DelayFrames
	xor a
	ld [wTradeCenterPointerTableIndex], a
	jp CableClub_DoBattleOrTradeAgain
.tradeCancelled
	ld c, 100
	call DelayFrames
	xor a ; TradeCenter_SelectMon
	ld [wTradeCenterPointerTableIndex], a
	jp CallCurrentTradeCenterFunction

WillBeTradedText:
	TX_FAR _WillBeTradedText
	db "@"

TradeCompleted:
	db "TAUSCH VOLLZOGEN!@"

TradeCanceled:
	db "Schade! Der tausch"
	next "wurde abgebrochen!@"

TradeCenterPointerTable:
	dw TradeCenter_SelectMon
	dw TradeCenter_Trade

CableClub_Run:
	ld a, [wLinkState]
	cp LINK_STATE_START_TRADE
	jr z, .doBattleOrTrade
	cp LINK_STATE_START_BATTLE
	jr z, .doBattleOrTrade
	cp LINK_STATE_RESET ; this is never used
	ret nz
	predef EmptyFunc3
	jp Init
.doBattleOrTrade
	call CableClub_DoBattleOrTrade
	ld hl, Club_GFX
	ld a, h
	ld [wTilesetGfxPtr + 1], a
	ld a, l
	ld [wTilesetGfxPtr], a
	ld a, Bank(Club_GFX)
	ld [wTilesetBank], a
	ld hl, Club_Coll
	ld a, h
	ld [wTilesetCollisionPtr + 1], a
	ld a, l
	ld [wTilesetCollisionPtr], a
	xor a
	ld [wGrassRate], a
	inc a ; LINK_STATE_IN_CABLE_CLUB
	ld [wLinkState], a
	ld [hJoy5], a
	ld a, 10
	ld [wAudioFadeOutControl], a
	ld a, BANK(Music_Celadon)
	ld [wAudioSavedROMBank], a
	ld a, MUSIC_CELADON
	ld [wNewSoundID], a
	jp PlaySound

EmptyFunc3:
	ret

Diploma_TextBoxBorder:
	call GetPredefRegisters

; b = height
; c = width
CableClub_TextBoxBorder:
	push hl
	ld a, $78 ; border upper left corner tile
	ld [hli], a
	inc a ; border top horizontal line tile
	call CableClub_DrawHorizontalLine
	inc a ; border upper right corner tile
	ld [hl], a
	pop hl
	ld de, 20
	add hl, de
.loop
	push hl
	ld a, $7b ; border left vertical line tile
	ld [hli], a
	ld a, " "
	call CableClub_DrawHorizontalLine
	ld [hl], $77 ; border right vertical line tile
	pop hl
	ld de, 20
	add hl, de
	dec b
	jr nz, .loop
	ld a, $7c ; border lower left corner tile
	ld [hli], a
	ld a, $76 ; border bottom horizontal line tile
	call CableClub_DrawHorizontalLine
	ld [hl], $7d ; border lower right corner tile
	ret

; c = width
CableClub_DrawHorizontalLine:
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

LoadTrainerInfoTextBoxTiles:
	ld de, TrainerInfoTextBoxTileGraphics
	ld hl, vChars2 + $760
	lb bc, BANK(TrainerInfoTextBoxTileGraphics), (TrainerInfoTextBoxTileGraphicsEnd - TrainerInfoTextBoxTileGraphics) / $10
	jp CopyVideoData
