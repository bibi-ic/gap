#@local bf,i,j,vals,x,y,z
gap> START_TEST("bitfields.tst");

# Test correct behaviour for a variety of numbers of fields
# and all getters and setters. 
gap> for i in [1..2+GAPInfo.BytesPerVariable] do
> bf := CallFuncList(MakeBitfields,[1..i]);
> vals := List([1..i], j -> Random(0,2^j-1));
> Add(vals, [1..i], 1);
> x := CallFuncList(BuildBitfields,vals);
> for j in [1..i] do
> if bf.getters[j](x) <> vals[j+1] then
> Print("Bad return from getter",i," ",j," ",x,"\n");
> fi; od;
> if bf.booleanGetters[1](x) <> (vals[2] = 1) then
> Print("Bad return from boolean getter");
> fi;
> vals := List([1..i], j -> Random(0,2^j-1));
> for j in [1..i] do
> y := bf.setters[j](x, vals[j]);
> if bf.getters[j](y) <> vals[j] then
> Print("Bad return from getter and setter\n");
> fi; od;
> y := bf.booleanSetters[1](x,true);
> z := bf.booleanSetters[1](x,false);
> if (not bf.booleanGetters[1](y))  or bf.booleanGetters[1](z) then
> Print("Bad results from boolean setter\n");
> fi; od;

#
# Now test various error and extreme conditions
#
gap> bf := MakeBitfields(1);
rec( booleanGetters := [ function( data ) ... end ], 
  booleanSetters := [ function( data, val ) ... end ], 
  getters := [ function( data ) ... end ], 
  setters := [ function( data, val ) ... end ], widths := [ 1 ] )

#
gap> Display(bf.getters[1]);
function ( data )
    <<kernel or compiled code>>
end
gap> Display(bf.setters[1]);
function ( data, val )
    <<kernel or compiled code>>
end
gap> Display(bf.booleanGetters[1]);
function ( data )
    <<kernel or compiled code>>
end
gap> Display(bf.booleanSetters[1]);
function ( data, val )
    <<kernel or compiled code>>
end

#
gap> bf.getters[1](Z(5));
Error, Field getter: <data> must be a small integer (not an ffe)
gap> bf.setters[1](1, (1,2));
Error, Field Setter: <val> must be a small integer (not a permutation (small))
gap> bf.setters[1]([],1);
Error, Field Setter: <data> must be a small integer (not an empty plain list)
gap> BuildBitfields([1],Z(5));
Error, Fields builder: values must be non-negative small integers
gap> MakeBitfields(100);
Error, MAKE_BITFIELDS: total widths too large

#
gap> NameFunction(bf.getters[1]);
"<field getter>"
gap> NameFunction(bf.setters[1]);
"<field setter>"
gap> NameFunction(bf.booleanGetters[1]);
"<boolean field getter>"
gap> NameFunction(bf.booleanSetters[1]);
"<boolean field setter>"

#
gap> STOP_TEST("bitfields.tst");
