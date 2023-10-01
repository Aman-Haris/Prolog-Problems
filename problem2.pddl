;
; Problem 1: install attachments
;
; Author: Aman Haris
;
(define (problem problem1)
  (:domain uninhabited_planet)

  (:objects
      g1
      g2
      g3
      g4
      g5
      g6
      g7
      g8
      g9
      hilly
      flat
      mountainous
      eb1
      eb2
      eb3
      e1
      e2
      e3
      e4
      m1
      m2
      p1
      p2
      manipulation
      drilling
      surveying
  )

  (:init
        (grid_number g1)
        (grids 9)
        (engineering_bay eb1 gn1 flat)
        (engineer e1 gn3)
        (mech m1 ?p1 ?p2 ?a gn1 ?k)
        (attachment manipulation eb1)
        (location hilly gn1)
        (location flat gn2)
        (location flat gn3)
        (location hilly gn4)
        (location flat gn5)
        (location flat gn6)
        (location mountainous gn7)
        (location mountainous gn8)
        (location mountainous gn9)
  )

  (:goal
      (and
          (mech m1 ?p1 ?p2 manipulation gn1 ?k)
      )
  )
)