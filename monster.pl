%fact basicType(t): to represent the idea that t is a basic type.
%There are 5 varities of type: fire,ghost,grass,water,normal.
basicType(fire).
basicType(ghost).
basicType(grass).
basicType(water).
basicType(normal).

%fact monster(mo,t): to represent the idea that mo is a monster of type t.
%There are 5 types of monsters which is of a type defined above.
monster(chewtle,water).
monster(pansage,grass).
monster(rapidash,fire).
monster(shuppet,ghost).
monster(wooloo,normal).

%fact move(mv,t): to represent the idea that mv is a move of type t.
%Each monster has 4 moves which is of a certain type.
%Some moves are found in 2 monsters, therefore they haven't been defined twice.
move(waterGun,water).
move(headbutt,normal).
move(hydroPump,water).
move(tackle,normal).
move(lick,ghost).
move(sunnyDay,fire).
move(seedBomb,grass).
move(tackle,normal).
move(flameCharge,fire).
move(quickAttack,normal).
move(overheat,fire).
move(hex,ghost).
move(shadowBall,ghost).
move(screech,normal).
move(grassySlide,grass).
move(stomp,normal).

%fact monsterMove(mo,mv): to represent the idea that monster mo has a move mv.
%It represents all the moves that can be done by a monster which is defined above.
monsterMove(chewtle,waterGun).
monsterMove(chewtle,headbutt).
monsterMove(chewtle,hydroPump).
monsterMove(chewtle,tackle).
monsterMove(pansage,lick).
monsterMove(pansage,sunnyDay).
monsterMove(pansage,seedBomb).
monsterMove(pansage,tackle).
monsterMove(rapidash,flameCharge).
monsterMove(rapidash,sunnyDay).
monsterMove(rapidash,quickAttack).
monsterMove(rapidash,overheat).
monsterMove(shuppet,hex).
monsterMove(shuppet,sunnyDay).
monsterMove(shuppet,shadowBall).
monsterMove(shuppet,screech).
monsterMove(wooloo,grassySlide).
monsterMove(wooloo,tackle).
monsterMove(wooloo,headbutt).
monsterMove(wooloo,stomp).

%fact  typeEffectiveness(t1,t2,e): to represent the idea that a move of type t1 used again monsters of type t2 has effectiveness e.
% It represents the effectiveness of a type compared to another type.
typeEffectiveness(fire,fire,weak).
typeEffectiveness(fire,ghost,ordinary).
typeEffectiveness(fire,grass,strong).
typeEffectiveness(fire,water,weak).
typeEffectiveness(fire,normal,ordinary).
typeEffectiveness(ghost,fire,ordinary).
typeEffectiveness(ghost,ghost,strong).
typeEffectiveness(ghost,grass,ordinary).
typeEffectiveness(ghost,water,ordinary).
typeEffectiveness(ghost,normal,superweak).
typeEffectiveness(grass,fire,weak).
typeEffectiveness(grass,ghost,ordinary).
typeEffectiveness(grass,grass,weak).
typeEffectiveness(grass,water,strong).
typeEffectiveness(grass,normal,ordinary).
typeEffectiveness(water,fire,strong).
typeEffectiveness(water,ghost,ordinary).
typeEffectiveness(water,grass,weak).
typeEffectiveness(water,water,weak).
typeEffectiveness(water,normal,ordinary).
typeEffectiveness(normal,fire,ordinary).
typeEffectiveness(normal,ghost,superweak).
typeEffectiveness(normal,grass,ordinary).
typeEffectiveness(normal,water,ordinary).
typeEffectiveness(normal,normal,ordinary).

%fact moreEffective(e1,e2): to represent the idea that effectiveness e1 is more effective than e2.
% It represents the strength of a effectiveness compared to another effectiveness.
moreEffective(strong,ordinary).
moreEffective(ordinary,weak).
moreEffective(weak,superweak).

%rule moreEffectiveThan(E1,E2): to find out that effectiveness E1 is more effective than E2, which is not defined in the facts.
%The first rule has been defined to find out the effectiveness if E2 is one step below E1 in the effectiveness heirarchy.
moreEffectiveThan(E1,E2):-
    moreEffective(E1,X), moreEffective(X,E2).
%The second rule has been defined to establish that Strong is more Effective than Superweak.
moreEffectiveThan(E1,E2):-
    E1=strong,E2=superweak.
%The third rule has been defined to represent the given heirarchy of effectiveness.
moreEffectiveThan(E1,E2):-
    moreEffective(E1,E2).

%rule monsterMoveTypeMatch(MV,MO): to find out that monster MO has a move MV and that MO and MV have the same type.
%This rule checks whether the monster can perform the given move, and then finds out the type of the monster and the move and then compares whether they are of the same type.
monsterMoveTypeMatch(MV,MO):-
    monsterMove(MO,MV), move(MV,T), monster(MO,T), T=T.

%rule  moreEffectiveTypeMove(T,MV1,MV2): to find out that move MV1 is more effective than move MV2 against monsters of type T.
%This rule finds out the type of both the moves and finds out the effectiveness compared to the given type and then this effectiveness is checked.
moreEffectiveTypeMove(T,MV1,MV2):-
    move(MV1,T1), move(MV2,T2),
    typeEffectiveness(T1,T,E1), typeEffectiveness(T2,T,E2),
    moreEffectiveThan(E1,E2).

%moreEffectiveMonsterMove(MO1,MO2,MV1,MV2): to find out that if monster MO1 performs move MV1 and monster MO2 performs move MV2 then MV1 is more effective against MO2 than MV2 is against MO1.
%This rule finds out the type of both the moves and the monsters and then finds out the effectiveness compared to each other and then this effectiveness is checked. 
moreEffectiveMonsterMove(MO1,MO2,MV1,MV2):-
    monster(MO1,T1), monster(MO2,T2),
    move(MV1,T3), move(MV2,T4),
    typeEffectiveness(T3,T2,E1), typeEffectiveness(T4,T1,E2),
    moreEffectiveThan(E1,E2).