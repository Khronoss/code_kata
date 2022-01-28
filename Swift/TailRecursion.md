
# A word on tail recursion applyed to Swift

*tl;dr:* Don't.

Tail recursion is a well known implementaion "process" in the functional paradigm.

The "standart" recursion is just the idea to have a procedure calling itself during its execution.
The problem with that, is that it creates new function calls on the stack, and with enough recursions (or worse, an infinit loop) the program will interrupt due to the stack being full.

Functional languages' compilers come with an optimization around this where, in a particular senario, it is able to actually replace the `call` in assembly, by a simple jump (`jmp`) to the start of the procedure.

To achieve this optimization, the recursion _has to_ happens as the exact last execution statement of the procedure (hence the _tail_ recursion name).

# But... there is a but

Even though Swift can integrate functional programming paradigm, it is actually verry difficult to make its compiler optimizing the tail recursion

In fact, as soon as you deal with objects (not values), it is simply not possible to do tail recursion because of ARC. The compiler wil always add release instructions at the very end of your procedure, after your seemingly last statement in code.


What about non Object-Oriented functions ? It seems to be the same. There is a tail recursion optimization in the Swift's compiler, but developpers agree with the fact that it is realy hard to make it happens and it asks deep knowledge of LLVM and so.

_So simply act as if LLVM weren't optimizing tail recursion for Swift_

# A word on my code in Katas

Even though there isn't optimization, I think it can be a good tool to add in my toolbox

That's why I'm trying to apply it in Swift with the Katas. If something bad happens, that's not a problem I'll try to find another way and I'll learn new limitation to consider on this wonderful language <3

At the end, Katas are nothing more than playgrounds.