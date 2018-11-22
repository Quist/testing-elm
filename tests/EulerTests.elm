module EulerTests exposing (all)

import Expect
import Fuzz exposing (..)
import Julelib.Euler exposing (..)
import Test exposing (..)



-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test
all =
    describe "Euler"
        [ describe "Problem 1"
            [ skip <| test "10 som input" (\_ -> Expect.equal 0 (multiplesOfThreesAndFives 0))
            ]
        ]
