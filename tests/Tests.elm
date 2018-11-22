module Tests exposing (all)

import Expect
import Fuzz exposing (..)
import Julelib.Julelib exposing (..)
import Test exposing (..)



-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test
all =
    describe "Julelib"
        [ test "This test should fail" <|
            \_ ->
                Expect.fail "failed as expected!"
        , test "Timeføring" <|
            \_ ->
                Expect.equal (ForLiteJobbing 1) (validerTimer [ 1 ])
        ]
