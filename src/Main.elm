module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)



---- MODEL ----


type alias KalenderTekst =
    { header : String, tekst : String }


type alias Luke =
    { tekst : KalenderTekst, dag : Int }


type ValgtLuke
    = LukeValgt Luke
    | Ingen


type alias Model =
    { valgtLuke : ValgtLuke }


getLuker : List Luke
getLuker =
    List.append
        [ { dag = 1
          , tekst =
                { header = "Hello test", tekst = "Nå får du oppgaven!" }
          }
        ]
        (List.range 2 24 |> List.map (\dag -> getDefaultLuke dag))


getDefaultLuke : Int -> Luke
getDefaultLuke dag =
    { dag = dag
    , tekst = { header = "Not implemented", tekst = "Og jul med din glede" }
    }


init : ( Model, Cmd Msg )
init =
    ( { valgtLuke = Ingen }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | OnClickLuke Luke


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnClickLuke luke ->
            ( { valgtLuke = LukeValgt luke }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ css [ maxWidth (px 700), margin auto ] ]
        [ h1 [] [ text "Julekalender" ]
        , julekalender
        , oppgaveSeksjon model.valgtLuke
        ]


julekalender : Html Msg
julekalender =
    div
        [ css
            [ displayFlex
            , justifyContent spaceAround
            , flexFlow2 row wrap
            ]
        ]
        (List.map
            (\l -> lukeBoks l)
            getLuker
        )


lukeBoks : Luke -> Html Msg
lukeBoks luke =
    div
        [ css
            [ border3 (px 5) solid (rgb 11 14 17)
            , padding (px 15)
            , flexBasis (px 30)
            , margin (px 5)
            ]
        , onClick (OnClickLuke luke)
        ]
        [ text (String.fromInt luke.dag) ]


oppgaveSeksjon : ValgtLuke -> Html Msg
oppgaveSeksjon valgtLuke =
    case valgtLuke of
        Ingen ->
            h3 [] [ text "Velg en luke!" ]

        LukeValgt luke ->
            div []
                [ h3 [] [ text luke.tekst.header ]
                , h5 [] [ text (String.fromInt luke.dag) ]
                , p [] [ text luke.tekst.tekst ]
                ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view >> toUnstyled
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
