;Author: Aman Haris H00409752

(define (domain  uninhabited planet)
    (:requirements
        :strips
    )

    (:predicates
        (grid_number ?gn)
        (grids ?g)
        (command_centre ?cc ?gn ?r)
        (engineering_bay ?eb ?gn ?r)
        (commander ?c ?l)
        (engineer ?e ?l)
        (pilot ?p ?l)
        (science_officer ?so ?l)
        (attachment ?a ?p)
        (mech ?m ?p1 ?p2 ?a ?l ?k)
        (region ?r)
        (location ?r ?gn)
        (core_sample ?c ?l)
        (surveyedland ?r ?gn)
        (kit ?l ?k)
    )
    
;this function initializes the initial location of all the elements
(:action init_location
    :parameters
        (?cc ?gn1 ?eg ?gn2 ?r)
    :precondition
        (and
           (grid_number ?gn1)
           (grid_number ?gn2)
           (command_centre ?cc ?gn1 ?r)
           (engineering_bay ?eb ?gn2 ?r)
        )
    :effect
        (and
          (commander ?c ?gn1)
          (engineer ?e ?gn1)
          (pilot ?p ?gn1)
          (science_officer ?so ?gn1)
          (attachment ?a ?eb)
          (mech ?m ?p1 ?p2 ?a ?eb)
          (kit ?eb ?k)
        )
)

;this function is for personals movement
(:action person_move
    :parameters
        (?r= hilly/flat ?lgn)
    :precondition
        (and
            (location ?r ?lgn) 
            (commander ?c ?l)
            (engineer ?e ?l)
            (pilot ?p ?l)
            (science_officer ?so ?l)
        )
    :effect
        (and
            (commander ?c ?lgn)
            (engineer ?e ?lgn)
            (pilot ?p ?lgn)
            (science_officer ?so ?lgn)
        )
)

;this function is for the movement of mech
(:action mech_move
    :parameters
        (?p1=pilot ?r=flat/hilly ?lgn ?m)
    :precondition
        (and
            (location ?r ?lgn)
            (mech ?m ?p1 ?p2 ?a ?l)
        )
    :effect
        (and
            (mech ?m ?p1 ?p2 ?a ?lgn)
        )
)

;this function is to install attachment on a mech
(:action install
    :parameters
        (?eb ?m ?a ?e)
    :precondition
        (and
            (engineering_bay ?eb ?gn ?r)
            (mech ?m ?p1 ?p2 ?a ?l)
            (attachment ?a ?p)
            (engineer ?e ?l)
        )
    :effect
        (and
            (mech ?m ?p1 ?p2 ?a ?l)
        )
)

;this function is to uninstall an attachment from the mech
(:action uninstall
    :parameters
        (?eb ?m ?e)
    :precondition
        (and
            (engineering_bay ?eb ?gn ?r)
            (mech ?m ?p1 ?p2 ?a ?l)
            (attachment ?a ?p)
            (engineer ?e ?l)
        )
    :effect
        (and
            (mech ?m ?p ?a=no_attachment ?l)
        )
)

;this function is for drilling the core and collecting the core_sample
(:action core_drilling
    :parameters
        (?r=hilly ?p1/?p2= science_officer ?a= drilling)
    :precondition
        (and
            (mech ?m ?p1 ?p2 ?a ?l)
        )
    :effect
        (and
            (mech ?m ?p1 ?p2 ?a ?l=command_centre)
            (core_sample ?c ?l=command_centre)
        )
)

;this function is to survey the land
(:action land_surveying
    :parameters
        (?r=hilly/flat ?a= surveying)
    :precondition
        (and
            (mech ?m ?p1 ?p2 ?a ?l)
        )
    :effect
        (and
            (mech ?m ?p1 ?p2 ?a ?l)
            (surveyedland ?r ?l)
        )
)

;this function is to load a kit onto the mech
(:action load_kit
    :parameters
        (?eb ?m ?k ?e)
    :precondition
        (and
            (engineering_bay ?eb ?gn ?r)
            (mech ?m ?p1 ?p2 ?a ?l ?k)
            (kit ?l ?k)
            (engineer ?e ?l)
        )
    :effect
        (and
            (mech ?m ?p1 ?p2 ?a ?l ?kit)
        )
)

;this function is to install a solar array
(:action installing_solar_array
    :parameters
        (?a= manipulation ?p1/?p2 = engineer ?k = solar_deployment_kit ?r = flat)
    :precondition
        (and
            (kit ?k)
            (surveyedland ?r ?l) 
            (mech ?m ?p1 ?p2 ?a ?l ?k)
        )
    :effect
        (and
            (location ?k ?gn)
        )
)

;this function is to install a habitat
(:action installing_habitat
    :parameters
        (?a= manipulation ?p1/?p2 = engineer ?k = habitat_deployment_kit)
    :precondition
        (and
            (kit ?k)
            (surveyedland ?r ?l) 
            (mech ?m1 ?p1 ?p2 ?a ?l ?k)
            (mech ?m2 ?p1 ?p2 ?a ?l ?k)
        )
    :effect
        (and
            (location ?k ?gn)
        )
)

;this function is to scan the core sample
(:action scan_core_sample
    :parameters
        (?gn)
    :precondition
        (and
            (command_centre ?cc ?gn ?r)
            (science_officer ?so ?gn)
            (core_sample ?c ?gn)
            
        )
    :effect
        (and
            (core_sample ?c ?gn)
            
        )
)
)