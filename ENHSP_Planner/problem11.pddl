(define (problem swerve)
  (:domain racetrack)
  (:objects w1 w2 w3 w4 w5 w6 w7 - wall)
  (:init (= (x) 2)
         (= (y) 2)
         (= (vx) 0)
         (= (vy) 0)
         (= (ax w1) 0)
         (= (ay w1) 0)
         (= (bx w1) 16)
         (= (by w1) 0)
         (= (ax w2) 16)
         (= (ay w2) 0)
         (= (bx w2) 16)
         (= (by w2) 16)
         (= (ax w3) 0)
         (= (ay w3) 16)
         (= (bx w3) 16)
         (= (by w3) 16)
         (= (ax w4) 0)
         (= (ay w4) 0)
         (= (bx w4) 0)
         (= (by w4) 16)
         (= (ax w5) 4)
         (= (ay w5) 0)
         (= (bx w5) 4)
         (= (by w5) 12)
         (= (ax w6) 4)
         (= (ay w6) 12)
         (= (bx w6) 12)
         (= (by w6) 12)
         (= (ax w7) 12)
         (= (ay w7) 5)
         (= (bx w7) 12)
         (= (by w7) 12)
  )
  (:goal (and (>= (x) 10)
         (<= (x) 11)
         (= (y) 7)
         (= (vx) 0)
         (= (vy) 0)
)))