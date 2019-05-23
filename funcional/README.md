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

## Instalar a biblioteca Aeson:
~~~
$ cabal update
$ cabal install aeson
~~~

## Instalar a biblioteca Ansi:
~~~
$ cabal update
$ cabal install ansi-terminal
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
