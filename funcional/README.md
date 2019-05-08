# Executar o jogo
> Passos para conseguir executar o jogo normalmente.

## Instalar o cabal:
~~~
$ sudo apt install cabal-install
~~~

## Instalar a biblioteca Random:
~~~
$ cabal update
$ cabal install random
~~~

## E agora é só executar:

~~~
$ runhaskell main.hs
~~~
#### OU
~~~
$ ghc main.hs
$ ./main
~~~
