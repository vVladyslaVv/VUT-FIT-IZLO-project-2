# VUT-FIT-IZLO-project-2
VUT FIT v Brne IZLO project 2

# IZLO – Projekt 2: SMT solvery
# Úvod

Poté, co si náš známý student z prvního projektu úspěšně naplánoval předměty s využitím SAT solveru, dostal hlad a rozhodl se vyrazit na oběd do menzy. Když dorazil na místo, byl velmi překvapen širokou nabídkou jídel (především různých variant kuřecích plátků) a zmocnila se ho rozhodovací paralýza. Nakonec usoudil, že jediným možným způsobem, jak ideálně vybrat oběd, je aplikovat na tento problém logiku. Jelikož už byl unaven kódováním problémů do výrokové logiky, rozhodl se zvolit expresivnější prvořádovou logiku a využít SMT solver.
Zadání

Vstupem problému je pět jídel reprezentovaných čísly

, kde každé z jídel má následující parametry nabývající hodnot z přirozených čísel (včetně 0):

    Cena 

, kterou je potřeba zaplatit za jednu porci daného jídlo.
Kalorická hodnota
jedné porce daného jídla (čím vyšší, tím lepší).
Počet porcí

    daného jídla k dispozici.

Cílem je najít vhodnou kombinaci jídel s co největší kalorickou hodnotou, přičemž si student může objednat více porcí jednoho druhu jídla. Tato kombinace musí splňovat následující podmínky:

    Celková cena obědu je maximálně 

.
Požadovaný počet porcí každého jídla nepřesahuje maximální počet.
Celkový součet kalorií je maximální, jinými slovy, neexistuje jiné řešení, které by splňovalo podmínky 1 a 2 a mělo vyšší celkový součet kalorií.
