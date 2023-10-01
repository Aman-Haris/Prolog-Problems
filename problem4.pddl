;
; Problem 4: install habitat
;
; Author: Aman Haris
;
(define (problem problem4)
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
      p1
      p2
      e1
      e2
      m1
      m2
      habitat
  )

  (:init
        (grid_number g1)
        (grids 9)
        (pilot p1 gn3)
        (pilot p2 gn3)
        (engineer e1 gn3)
        (engineer e2 gn3)
        (attachment manipulation gn3)
        (mech m1 p1 e1 manipulation gn3 habitat_development_kit)
        (mech m2 p2 e2 manipulation gn3 habitat_development_kit)
        (surveyedland flat gn3)
        (kit gn3 habitat_development_kit)
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
         (location habitat gn3)
      )
  )
)