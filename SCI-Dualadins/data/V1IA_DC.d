BEGIN ~V1IA_DC~

IF ~TRUE()~ deity
	SAY @30
	+ ~!Alignment(LastSummonerOf(Myself),MASK_EVIL) CheckStatGT(LastTalkedToBy,16,WIS) CheckStatGT(LastTalkedToBy,14,CHR) CheckStatGT(LastTalkedToBy,14,STR)~
	 + @31 + sacred
	+ ~Alignment(LastSummonerOf(Myself),MASK_EVIL) CheckStatGT(LastTalkedToBy,16,WIS) CheckStatGT(LastTalkedToBy,14,CON) CheckStatGT(LastTalkedToBy,14,STR) CheckStatGT(LastTalkedToBy,14,CHR)~
	 + @32 + unsacred
	+ ~!Alignment(LastSummonerOf(Myself),MASK_EVIL)~
	 + @33 + renounce
	+ ~Alignment(LastSummonerOf(Myself),MASK_EVIL)~
	 + @34 + denounce
	+ ~!Alignment(LastSummonerOf(Myself),MASK_EVIL)~
	 + @35 + reconsider
	+ ~Alignment(LastSummonerOf(Myself),MASK_EVIL)~
	 + @35 + deconsider
END

IF ~~ sacred
	SAY @40
	+ ~!Kit(LastSummonerOf(Myself),CAVALIER) !Kit(LastSummonerOf(Myself),INQUISITOR) !Kit(LastSummonerOf(Myself),UNDEADHUNTER) !Kit(LastSummonerOf(Myself),BLACKGUARD)~
	 + @41 DO ~ApplySpellRES("V1IAPDC",LastSummonerOf(Myself)) ChangeClass(LastSummonerOf(Myself),RANGER) ActionOverride(LastSummonerOf(Myself),AddKit(V1_PseudoPaladin)) SmallWait(1)~ EXIT
	+ ~Kit(LastSummonerOf(Myself),CAVALIER)~
	 + @41 DO ~ApplySpellRES("V1IACDC",LastSummonerOf(Myself)) ChangeClass(LastSummonerOf(Myself),RANGER) ActionOverride(LastSummonerOf(Myself),AddKit(V1_PseudoCavalier)) SmallWait(1)~ EXIT
	+ ~Kit(LastSummonerOf(Myself),INQUISITOR)~
	 + @41 DO ~ApplySpellRES("V1IAIDC",LastSummonerOf(Myself)) ChangeClass(LastSummonerOf(Myself),RANGER) ActionOverride(LastSummonerOf(Myself),AddKit(V1_PseudoInquisitor)) SmallWait(1)~ EXIT
	+ ~Kit(LastSummonerOf(Myself),UNDEADHUNTER)~
	 + @41 DO ~ApplySpellRES("V1IAUDC",LastSummonerOf(Myself)) ChangeClass(LastSummonerOf(Myself),RANGER) ActionOverride(LastSummonerOf(Myself),AddKit(V1_PseudoUndeadHunter)) SmallWait(1)~ EXIT
	+ ~Kit(LastSummonerOf(Myself),BLACKGUARD)~
	 + @44 DO ~DestroySelf() SmallWait(1)~ EXIT
END

IF ~~ unsacred
	SAY @42
	+ ~Kit(LastSummonerOf(Myself),BLACKGUARD)~
	 + @43 DO ~ApplySpellRES("V1IABDC",LastSummonerOf(Myself)) ChangeClass(LastSummonerOf(Myself),RANGER) ActionOverride(LastSummonerOf(Myself),AddKit(V1_PseudoBlackguard)) SmallWait(1)~ EXIT
	+ ~!Kit(LastSummonerOf(Myself),BLACKGUARD)~
	 + @44 DO ~DestroySelf() SmallWait(1)~ EXIT
END

IF ~~ renounce
	SAY @50
	+ ~!Kit(LastSummonerOf(Myself),BLACKGUARD)~
	 + @51 DO ~ApplySpellRES("V1IAXDC",LastSummonerOf(Myself)) DestroySelf() SmallWait(1)~ EXIT
	+ ~Kit(LastSummonerOf(Myself),BLACKGUARD)~
	 + @54 DO ~DestroySelf() SmallWait(1)~ EXIT
END

IF ~~ denounce
	SAY @52
	+ ~Kit(LastSummonerOf(Myself),BLACKGUARD)~
	 + @53 DO ~ApplySpellRES("V1IAXDC",LastSummonerOf(Myself)) DestroySelf() SmallWait(1)~ EXIT
	+ ~!Kit(LastSummonerOf(Myself),BLACKGUARD)~
	 + @54 DO ~DestroySelf() SmallWait(1)~ EXIT
END

IF ~~ reconsider
	SAY @60
	+ ~CheckStatGT(LastTalkedToBy,16,WIS) CheckStatGT(LastTalkedToBy,14,CHR) CheckStatGT(LastTalkedToBy,14,STR)~ + ~...~ DO ~DestroySelf() SmallWait(1)~ EXIT
	+ ~OR(3) CheckStatLT(LastTalkedToBy,17,WIS) CheckStatLT(LastTalkedToBy,15,CHR) CheckStatLT(LastTalkedToBy,15,STR)~ + @61 DO ~DestroySelf() SmallWait(1)~ EXIT
END

IF ~~ deconsider
	SAY @62
	+ ~CheckStatGT(LastTalkedToBy,16,WIS) CheckStatGT(LastTalkedToBy,14,CON) CheckStatGT(LastTalkedToBy,14,STR) CheckStatGT(LastTalkedToBy,14,CHR)~ + ~...~ DO ~DestroySelf() SmallWait(1)~ EXIT
	+ ~OR(4) CheckStatLT(LastTalkedToBy,17,WIS) CheckStatLT(LastTalkedToBy,15,CON) CheckStatLT(LastTalkedToBy,15,STR) CheckStatLT(LastTalkedToBy,15,CHR)~ + @63 DO ~DestroySelf() SmallWait(1)~ EXIT
END