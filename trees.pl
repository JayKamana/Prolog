insert(V,empty,node(empty,V,empty)). /* insert a value into a binary search tree */
insert(V, node(L,V2,R), node(L2,V2,R)):- V=<V2, insert(V,L,L2).
insert(V, node(L,V2,R), node(L,V2,R2)):- V>V2, insert(V,R,R2).

insert_list([],empty). /* insert a list of numbers into an empty binary search tree */
insert_list([H|T],Tree):- insert_list(T, Temp), insert(H,Temp,Tree).

size(empty, 0). /* size of the tree - how many nodes it has */
size(node(L,_,R),S):- size(L,X), size(R,Y), S is X+Y+1.

in_order(empty,[]). /* inorder traversal */
in_order(node(L,V,R),Res):- in_order(L,LT), in_order(R,RT), app(LT,[V],X), app(X,RT,Res).

app([],L,L).  /* append two lists */
app([H|T],L,[H|TL]):- app(T,L,TL).

min(node(empty,V,empty),V). /* find the minimum value in a binary search tree */
min(node(L,_,R),V):- min(L,V).



find(V,empty):- false.
find(V,node(L,V1,R)):- V==V1.
find(V,node(L,V1,R)):- V<V1,find(V,L).
find(V,node(L,V1,R)):- V>V1,find(V,R).

post_order(empty,[]).
post_order(node(L,V,R),ResultList):- post_order(L,LTr), post_order(R,RTr), app(LTr,RTr,Y), app(Y,[V],ResultList).

inner_nodes(empty,[]).
inner_nodes(node(L,V,R),ResultList):- size(node(L,V,R),SIZE), SIZE<4, ResultList=[V].
inner_nodes(node(L,V,R),ResultList):- size(node(L,V,R),SIZE), SIZE>=4, inner_nodes(L,Y1), inner_nodes(R,Y2), app(Y1,Y2,Y), app([V],Y,ResultList).

max(node(empty,V,empty),V).
max(node(LTr,_,RTr),V):- max(RTr,V).