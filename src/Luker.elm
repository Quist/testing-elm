module Luker exposing (getLukeView, getLuker)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Types exposing (..)


getLuker : List Luke
getLuker =
    List.append
        [ { dag = 1
          }
        ]
        (List.range 2 24 |> List.map (\dag -> { dag = dag }))


getLukeView : Luke -> Html Msg
getLukeView luke =
    div []
        [ h3 [] [ text (String.fromInt luke.dag), text ". desember" ]
        , div [ css [ textAlign left ] ] [ getOppgaveBeskrivelse luke ]
        ]


getOppgaveBeskrivelse : Luke -> Html Msg
getOppgaveBeskrivelse luke =
    if luke.dag == 1 then
        luke1 luke

    else if luke.dag == 2 then
        luke2 luke

    else if luke.dag == 3 then
        luke3 luke

    else if luke.dag == 4 then
        luke4 luke

    else if luke.dag == 5 then
        luke5 luke

    else if luke.dag == 6 then
        luke6 luke

    else if luke.dag == 7 then
        luke7 luke

    else if luke.dag == 8 then
        luke8 luke

    else if luke.dag == 9 then
        luke9 luke

    else if luke.dag == 10 then
        luke10 luke

    else if luke.dag == 11 then
        luke11 luke

    else if luke.dag == 12 then
        luke12 luke

    else if luke.dag == 13 then
        luke13 luke

    else if luke.dag == 14 then
        luke14 luke

    else if luke.dag == 15 then
        luke15 luke

    else
        defaultLuke luke


defaultLuke luke =
    div []
        [ h3 [] [ text (String.fromInt luke.dag) ]
        , p [] [ text "Ikke implementert" ]
        ]


jCode tekst =
    code [] [ text tekst ]


eulerHeader : Int -> String -> Html msg
eulerHeader number title =
    h3 [] [ text ("Problem " ++ String.fromInt number ++ " - " ++ title) ]


luke1 luke =
    div []
        [ p [] [ text "Velkommen til denne lille julekalenderen om Elm og testing! Klar for første oppgave? Den er ganske enkel. Se om du får kjørt testene. Du kan bruke ", jCode "elm-test", text " eller ", jCode "elm-app test", text ". " ]
        , p [] [ text "Når du har kjørt de feilende testene er du klar for neste oppgave." ]
        ]


luke2 luke =
    div []
        [ p [] [ text "Alright. La oss prøve oss på å skrive noen tester. ", jCode "Julelib.elm", text " i ", jCode "src/julelib", text " inneholder endel nyttige julefunksjoner." ]
        , p [] [ text "Funksjonen ", jCode "antallGaver", text " returnerer hvor mange gaver Olav må kjøpe inn til juleavsluttningen. Etter budsjettjusteringer har antall gaver per ansatte blitt satt til 2." ]
        , p [] [ text "Skriv en test som tester ", jCode "antallGaver", text " funksjonen i ", jCode "Julelib.elm", text " filen." ]
        , p [] [ text "Det kan være nyttig å bruke en funksjon fra ", a [ href "https://package.elm-lang.org/packages/elm-community/elm-test/4.2.0/Expect#equal" ] [ text "Expect biblioteket." ] ]
        ]


luke3 luke =
    div []
        [ p [] [ text "Økonomidirektøren ønsker at antall gaver ikke skal overstige 1000 gaver, mens de ansatte ønsker ihvertfall en gave." ]
        , p [] [ text "Skriv tester for disse kravene." ]
        ]


luke4 luke =
    div []
        [ p [] [ text "Administrasjonen har sett seg litt lei på at sen timeføring. Timekeeper har derfor blitt skrevet om til Elm. Regnskap regner med at dette vil føre til en raskere og bedre arbeidshverdag. Funksjonen ", jCode "summerTimer", text " skal summere opp alle timene en konsulent sender inn." ]
        , p [] [ text "Implementer funksjonen ", jCode "summerTimer", text " i Julelib.elm som tar imot en liste av ints og returnerer den totale summen av timer. Du kan selv velge om du vil støtte flyttall eller ikke. Skriv testen(e) først." ]
        ]


luke5 luke =
    div []
        [ p [] [ text "Funksjonen ", jCode "validerTimer", text " i ", jCode "Julelib.elm", text " validerer timene til konsulentene. De skal jobbe presis 35 timer i uka, ellers skal enn passende feilmelding gis. Signaturen er som følger: " ]
        , Html.Styled.pre [] [ jCode "type TimeValidering\n            = OK\n            | ForLiteJobbing Int\n            | ForMyeJobbing Int\n\n\nvaliderTimer : List Int -> TimeValidering" ]
        , p [] [ text "Skriv tester for og implementer funksjonen." ]
        ]


luke6 luke =
    div [] [ text "Okei. Det går også an å teste lister med string. Noen har nemlig tuklet med julegavelistene som har blitt sendt inn til nissen. Implementer tester og kode for funksjonen julerevers i ", jCode "Julelib.elm", text ". Funksjonen skal reversere elementene i en liste av Strings i tillegg til å reversere hvert enkelt element. ", p [] [ text "Eksempelvis: ", jCode "julerevers [\"caM yN\",\"rekkoS\"] => [\"Sokker\", \"Ny Mac\"]" ] ]


luke7 luke =
    div [] [ text "Vi kan gruppere testene våre med ", jCode "describe", text ".", p [] [ text "Prøv å lag en ny describe og legg til noen tester. Du kan f.eks teste ", jCode "List.length", text " funksjonen i elm. Returnerer den lengden på listen du sender inn?" ] ]


luke8 luke =
    div []
        [ h3 [] [ text "Fuzz-testing" ]
        , p []
            [ text "En fuzz-test er en test der testen blir gjort flere ganger(vanligvis 100) med tilfeldig generert input. I asserten sjekker vi om en eller annen property, eller invariant, er sann. Vanligvis når vi tester mocker vi opp noe data og asserter at resultatet er det vi forventer. Ved fuzz-testing så får vi disse fordelene: "
            , ul []
                [ li [] [ text "De fleste funzz-funksjonene genererer rundt 100 forskjellige test-samples. Dette kan være med på å gjøre det lettere å finne edge-caser." ]
                , li [] [ text "Vi slipper å lage mock-data." ]
                ]
            ]
        , h3 [] [ text "Eksempel" ]
        , p [] [ text "Her tester vi at elm sin abs funksjon for å få et absolutt tall fungerer som forventet." ]
        , Html.Styled.pre []
            [ jCode "fuzz Fuzz.int \"Elm abs\" <|\n\n            \\n ->\n                abs n \n                    |> Expect.equal\n                        (if n >= 0 then\n                            n\n\n                         else\n                            n * -1\n                        )"
            ]
        , h3 [] [ text "Oppgave" ]
        , p [] [ text "Funksjonen ", jCode "gaverPerBarn", text " returner hvor mange gaver hvert barn i Norge får til jul. Uansett hvordan input denne funksjonen får, skal den returnere 0 eller flere gaver. Noe annet ville jo vært trist." ]
        , p [] [ text "Skriv en fuzzer test som tester denne funksjonen. Hvis ikke funksjonen er robust nok, så kan du se om du klarer å forbedre den." ]
        ]


luke9 luke =
    div [] [ p [] [ text "Det finnes fuzzere for forskjellige typer. Ta en titt på de ", a [ href "https://package.elm-lang.org/packages/elm-community/elm-test/latest/Fuzz" ] [ text "her." ] ] ]


luke10 luke =
    div []
        [ p [ css [ marginBottom (px 35) ] ]
            [ text "Project Euler er en nettside med en samling av interessante logiske (jule)nøtter. I de kommende lukene bruker vi de som utgangspunkt. Du kan opprette funksjonene i  "
            , jCode "src/julelib/Euler.elm"
            , text " og testene i "
            , jCode "EulerTests.elm"
            , text ". Skriv gjerne testene først, før du gjør implementasjonen."
            ]
        , eulerHeader 1 "Multiples of 3 and 5"
        , p [] [ text "If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23." ]
        , p [] [ text "Find the sum of all the multiples of 3 or 5 below 1000." ]
        ]


luke11 luke =
    div []
        [ eulerHeader 2 "Even Fibonacci numbers"
        , p [] [ text "Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:" ]
        , p [] [ jCode "1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ..." ]
        , p [] [ text "By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms." ]
        ]


luke12 luke =
    div []
        [ h3 [] [ eulerHeader 3 "Largest prime factor" ]
        , p [] [ text "The prime factors of 13195 are 5, 7, 13 and 29." ]
        , p [] [ text "What is the largest prime factor of the number 600851475143 ?" ]
        ]


luke13 luke =
    div []
        [ eulerHeader 4 "Largest palindrome product"
        , p [] [ text "A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99." ]
        , p [] [ text "Find the largest palindrome made from the product of two 3-digit numbers." ]
        ]


luke14 luke =
    div []
        [ eulerHeader 5 "Smallest multiple"
        , p [] [ text "2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder." ]
        , p [] [ text "What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?" ]
        ]


luke15 luke =
    div []
        [ eulerHeader 6 "Sum square difference"
        , p [] [ text "The sum of the squares of the first ten natural numbers is," ]
        , p [] [ jCode "12 + 22 + ... + 102 = 385" ]
        , p [] [ text "The square of the sum of the first ten natural numbers is," ]
        , p [] [ jCode "(1 + 2 + ... + 10)2 = 552 = 3025" ]
        , p [] [ text "Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640." ]
        , p [] [ text "Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum." ]
        ]


luke16 luke =
    div []
        [ eulerHeader 7 "10001st prime"
        , p [] [ text "By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13." ]
        , p [] [ text "What is the 10 001st prime number?" ]
        ]
