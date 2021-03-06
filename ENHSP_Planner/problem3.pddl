(define (problem swerve)
  (:domain racetrack)
  (:objects w1 w2 w3 w4 - wall)
  (:init (= (x) 15)
         (= (y) 12)
         (= (vx) 0)
         (= (vy) 0)
         (= (ax w1) 0)
         (= (ay w1) 0)
         (= (bx w1) 20)
         (= (by w1) 0)
         (= (ax w2) 20)
         (= (ay w2) 0)
         (= (bx w2) 20)
         (= (by w2) 20)
         (= (ax w3) 0)
         (= (ay w3) 20)
         (= (bx w3) 20)
         (= (by w3) 20)
         (= (ax w4) 0)
         (= (ay w4) 0)
         (= (bx w4) 0)
         (= (by w4) 20)
  )
  (:goal (and (= (x) 5)
         (>= (y) 5)
         (<= (y) 15)
         (= (vx) 0)
         (= (vy) 0)
)))
