%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Static info examples %%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- consult('semantics.pl').

e:p0:i ==> e:p3:i.
_ ==> _ :- false.

event(r1:i, timing(300)).
event(r1:i, data_received(e:p3)).

implementation(r1:i, return(void)).

minimum_start_interval(r1:i, 10).

can_be_invoked_concurrently(r2:i).

server_call_point(r1:i, sync(o:p2)).

%%%%%%%%%%%%%%%%

example(L,R) :-
%  Cont1 = fn(X,rte_exit(x, Cont2)),
%  Cont2 = fn(X,rte_exit(x, fn(Y,return(void)))),
  Proc1 = rinst(r1:i,nil,[],rte_enter(x,_Cont1)),
  Proc2 = rinst(r2:i,nil,[],rte_enter(x,_Cont2)),
  Block = [excl(x:i,free) | [Proc1 | [Proc2 | []]]],
  [excl(z:i,free) | Block] --- L ---> R.
