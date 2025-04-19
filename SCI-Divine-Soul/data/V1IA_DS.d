BEGIN ~V1IA_DS~

IF ~TRUE()~ deity
	SAY @20
	+ ~Alignment(LastSummonerOf(Myself),MASK_GOOD)~
	 + @21 + good
	+ ~Alignment(LastSummonerOf(Myself),MASK_LAWFUL)~
	 + @22 + law
	+ ~OR(2) Alignment(LastSummonerOf(Myself),MASK_GENEUTRAL) Alignment(LastSummonerOf(Myself),MASK_LCNEUTRAL)~
	 + @23 + neutral
	+ ~Alignment(LastSummonerOf(Myself),MASK_CHAOTIC)~
	 + @24 + chaos
	+ ~Alignment(LastSummonerOf(Myself),MASK_EVIL)~
	 + @25 + evil
END

IF ~~ good
	SAY @30
	+ ~!TriggerOverride(LastSummonerOf(Myself), HaveKnownSpellRES("%INSERT_GOOD_SPELL%"))~
	 + @31 + good_exit
	+ ~TriggerOverride(LastSummonerOf(Myself), HaveKnownSpellRES("%INSERT_GOOD_SPELL%"))~
	 + @81 + restart
END

IF ~~ law
	SAY @40
	+ ~!TriggerOverride(LastSummonerOf(Myself), HaveKnownSpellRES("%INSERT_LAW_SPELL%"))~
	 + @41 + law_exit
	+ ~TriggerOverride(LastSummonerOf(Myself), HaveKnownSpellRES("%INSERT_LAW_SPELL%"))~
	 + @81 + restart
END

IF ~~ neutral
	SAY @50
	+ ~!TriggerOverride(LastSummonerOf(Myself), HaveKnownSpellRES("%INSERT_NEUTRAL_SPELL%"))~
	 + @51 + neutral_exit
	+ ~TriggerOverride(LastSummonerOf(Myself), HaveKnownSpellRES("%INSERT_NEUTRAL_SPELL%"))~
	 + @81 + restart
END

IF ~~ chaos
	SAY @60
	+ ~!TriggerOverride(LastSummonerOf(Myself), HaveKnownSpellRES("%INSERT_CHAOS_SPELL%"))~
	 + @61 + chaos_exit
	+ ~TriggerOverride(LastSummonerOf(Myself), HaveKnownSpellRES("%INSERT_CHAOS_SPELL%"))~
	 + @81 + restart
END

IF ~~ evil
	SAY @70
	+ ~!TriggerOverride(LastSummonerOf(Myself), HaveKnownSpellRES("%INSERT_EVIL_SPELL%"))~
	 + @71 + evil_exit
	+ ~TriggerOverride(LastSummonerOf(Myself), HaveKnownSpellRES("%INSERT_EVIL_SPELL%"))~
	 + @81 + restart
END

IF ~~ restart
	SAY @20
	+ ~Alignment(LastSummonerOf(Myself),MASK_GOOD)~
	 + @21 + good
	+ ~Alignment(LastSummonerOf(Myself),MASK_LAWFUL)~
	 + @22 + law
	+ ~OR(2) Alignment(LastSummonerOf(Myself),MASK_GENEUTRAL) Alignment(LastSummonerOf(Myself),MASK_LCNEUTRAL)~
	 + @23 + neutral
	+ ~Alignment(LastSummonerOf(Myself),MASK_CHAOTIC)~
	 + @24 + chaos
	+ ~Alignment(LastSummonerOf(Myself),MASK_EVIL)~
	 + @25 + evil
	+ ~~
	 + @82 + reject
END

IF ~~ good_exit
	SAY @90
	+ ~~ + ~...~ DO ~ApplySpellRES("V1IAGDS",LastSummonerOf(Myself)) ActionOverride(LastSummonerOf(Myself),Rest()) SmallWait(1)~ EXIT
END

IF ~~ law_exit
	SAY @90
	+ ~~ + ~...~ DO ~ApplySpellRES("V1IALDS",LastSummonerOf(Myself)) ActionOverride(LastSummonerOf(Myself),Rest()) SmallWait(1)~ EXIT
END

IF ~~ neutral_exit
	SAY @90
	+ ~~ + ~...~ DO ~ApplySpellRES("V1IANDS",LastSummonerOf(Myself)) ActionOverride(LastSummonerOf(Myself),Rest()) SmallWait(1)~ EXIT
END

IF ~~ chaos_exit
	SAY @90
	+ ~~ + ~...~ DO ~ApplySpellRES("V1IACDS",LastSummonerOf(Myself)) ActionOverride(LastSummonerOf(Myself),Rest()) SmallWait(1)~ EXIT
END

IF ~~ evil_exit
	SAY @90
	+ ~~ + ~...~ DO ~ApplySpellRES("V1IAEDS",LastSummonerOf(Myself)) ActionOverride(LastSummonerOf(Myself),Rest()) SmallWait(1)~ EXIT
END

IF ~~ reject
	SAY @90
	+ ~~ + ~...~ DO ~ApplySpellRES("V1IAXDS",LastSummonerOf(Myself)) DestroySelf() SmallWait(1)~ EXIT
END