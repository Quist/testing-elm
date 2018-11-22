module Julelib.Julelib exposing (TimeValidering(..), antallGaver, dagerIgjenTilJul, gaverPerBarn, julerevers, summerTimer, validerTimer)

-- Luke 2 og 3


antallGaver : Int -> Int
antallGaver antallAnsatte =
    let
        gaverPerAnsatte =
            2
    in
    antallAnsatte * gaverPerAnsatte



-- Luke 4


summerTimer : List Int -> Int
summerTimer timer =
    Debug.todo "Not implemented"



-- Luke 5


type TimeValidering
    = OK
    | ForLiteJobbing Int
    | ForMyeJobbing Int


validerTimer : List Int -> TimeValidering
validerTimer timer =
    Debug.todo "Not implemented"



-- Luke 6


julerevers : List String -> List String
julerevers julegaveønsker =
    Debug.todo "Not Implemented"



-- Luke 8


gaverPerBarn : Int -> Int
gaverPerBarn antallBarn =
    let
        totaltAntallGaver =
            5005
    in
    totaltAntallGaver // antallBarn
