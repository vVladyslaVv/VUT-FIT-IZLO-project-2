(set-logic NIA)

(set-option :produce-models true)
(set-option :incremental true)

; Deklarace promennych pro vstupy
; ===============================

; Ceny
(declare-fun c1 () Int)
(declare-fun c2 () Int)
(declare-fun c3 () Int)
(declare-fun c4 () Int)
(declare-fun c5 () Int)

; Kaloricke hodnoty
(declare-fun k1 () Int)
(declare-fun k2 () Int)
(declare-fun k3 () Int)
(declare-fun k4 () Int)
(declare-fun k5 () Int)

; Maximalni pocty porci
(declare-fun m1 () Int)
(declare-fun m2 () Int)
(declare-fun m3 () Int)
(declare-fun m4 () Int)
(declare-fun m5 () Int)

; Maximalni cena obedu
(declare-fun max_cena () Int)

; Deklarace promennych pro reseni
(declare-fun n1 () Int)
(declare-fun n2 () Int)
(declare-fun n3 () Int)
(declare-fun n4 () Int)
(declare-fun n5 () Int)
(declare-fun best () Int)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; START OF SOLUTION ;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Definujeme pomocne funkce pro soucet cen, kalorii a dostupnych jidel
(define-fun cost_sum () Int (+ (* c1 n1) (* c2 n2) (* c3 n3) (* c4 n4) (* c5 n5)))
(define-fun calorie_sum () Int (+ (* k1 n1) (* k2 n2) (* k3 n3) (* k4 n4) (* k5 n5)))

; Definujeme pomocne funkce pro maximalni pocet jidel
(define-fun max_meals_1 () Bool (and (>= n1 0) (<= n1 m1)))
(define-fun max_meals_2 () Bool (and (>= n2 0) (<= n2 m2)))
(define-fun max_meals_3 () Bool (and (>= n3 0) (<= n3 m3)))
(define-fun max_meals_4 () Bool (and (>= n4 0) (<= n4 m4)))
(define-fun max_meals_5 () Bool (and (>= n5 0) (<= n5 m5)))

; Potvrdime, ze pocet jidel nesmi prekrocit maximalni hodnotu pro kazde jidlo
(assert (and max_meals_1 max_meals_2 max_meals_3 max_meals_4 max_meals_5))

; Potvrdime, ze celkova cena nesmi prekrocit maximalni cenu
(assert (<= cost_sum max_cena))

; Potvrdime, ze celkovy pocet kalorii je roven nejlepsimu poctu kalorii
(assert (= calorie_sum best))

; Potvrdime, ze neexistuje lepsi reseni
(assert (not (exists ((o1 Int) (o2 Int) (o3 Int) (o4 Int) (o5 Int))
                     (and (<= (+ (* c1 o1) (* c2 o2) (* c3 o3) (* c4 o4) (* c5 o5)) max_cena)
                          (<= 0 o1 m1) (<= 0 o2 m2) (<= 0 o3 m3) (<= 0 o4 m4) (<= 0 o5 m5)
                          (> (+ (* k1 o1) (* k2 o2) (* k3 o3) (* k4 o4) (* k5 o5)) best)
                     ))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; END OF SOLUTION ;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Testovaci vstupy
; ================

(echo "Test 1.a - ocekavany vystup je sat, promenna best ma hodnotu 34")
(check-sat-assuming (
  (= c1 7) (= c2 3) (= c3 6) (= c4 10) (= c5 8)
  (= k1 5) (= k2 2) (= k3 4) (= k4 7)  (= k5 3)
  (= m1 3) (= m2 2) (= m3 4) (= m4 1)  (= m5 3)
  (= max_cena 50)
))
(get-value (best n1 n2 n3 n4 n5))

(echo "Test 1.b - neexistuje jine reseni nez 34, ocekavany vystup je unsat")
(check-sat-assuming (
  (= c1 7) (= c2 3) (= c3 6) (= c4 10) (= c5 8)
  (= k1 5) (= k2 2) (= k3 4) (= k4 7)  (= k5 3)
  (= m1 3) (= m2 2) (= m3 4) (= m4 1)  (= m5 3)
  (= max_cena 50)
  (not (= best 34))
))

; =========================================================


(echo "Test 2.a - ocekavany vystup je sat, promenna best ma hodnotu 0")
(check-sat-assuming (
  (= c1 7) (= c2 3) (= c3 6) (= c4 10) (= c5 8)
  (= k1 5) (= k2 2) (= k3 4) (= k4 7)  (= k5 3)
  (= m1 3) (= m2 2) (= m3 4) (= m4 1)  (= m5 3)
  (= max_cena 0)
))
(get-value (best n1 n2 n3 n4 n5))

(echo "Test 2.b - neexistuje jine reseni nez 0, ocekavany vystup je unsat")
(check-sat-assuming (
  (= c1 7) (= c2 3) (= c3 6) (= c4 10) (= c5 8)
  (= k1 5) (= k2 2) (= k3 4) (= k4 7)  (= k5 3)
  (= m1 3) (= m2 2) (= m3 4) (= m4 1)  (= m5 3)
  (= max_cena 0)
  (not (= best 0))
))
