! This macro modifies a surface thickess, updates the contents of
! a window, and then saves the window text to a file.

tmin = -2.5
tmax = 2.5
tstep = 0.1
win = 6

surfA = 17
surfB = 29

SURP surfA, THIC, 0
SURP surfB, THIC, 0
prefix$ = "C:/Users/map/Desktop/OlympusLens/dataA/"
mag$ = prefix$ + "AMAG.TXT"
OUTPUT mag$
FOR t, tmin, tmax+tstep, tstep
	FORMAT .1
	IF (t < 0)
		filename$ = prefix$ + "zernikes" + $STR(t) + ".TXT"
	ELSE 
		filename$ = prefix$ + "zernikes+" + $STR(t) + ".TXT"
	ENDIF
	SURP surfA, THIC, t
	FORMAT E-f
	OUTPUT mag$, APPEND
	PRINT OPEV(OCOD("AMAG"), 0, 0, 0, 0, 0, 0)
	UPDATE 0
	UPDATE win
	SAVEWINDOW win, filename$
NEXT

SURP surfA, THIC, 0
SURP surfB, THIC, 0
prefix$ = "C:/Users/map/Desktop/OlympusLens/dataB/"
mag$ = prefix$ + "AMAG.TXT"
OUTPUT mag$
FOR t, tmin, tmax+tstep, tstep
	FORMAT .1
	IF (t < 0)
		filename$ = prefix$ + "zernikes" + $STR(t) + ".TXT"
	ELSE 
		filename$ = prefix$ + "zernikes+" + $STR(t) + ".TXT"
	ENDIF
	SURP surfB, THIC, t
	FORMAT E-f
	OUTPUT mag$, APPEND
	PRINT OPEV(OCOD("AMAG"), 0, 0, 0, 0, 0, 0)
	UPDATE
	UPDATE win
	SAVEWINDOW win, filename$
NEXT