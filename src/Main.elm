module Main exposing (Model, init, main, update, view)

import Browser
import Css exposing (..)
import Css.Transitions exposing (easeInOut, transition)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Luker exposing (..)
import Types exposing (..)



---- MODEL ----


type ValgtLuke
    = LukeValgt Luke
    | Ingen


type alias Model =
    { valgtLuke : ValgtLuke }


init : ( Model, Cmd Msg )
init =
    ( { valgtLuke = Ingen }, Cmd.none )



---- UPDATE ----


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
            , cursor pointer
            , transition
                [ Css.Transitions.backgroundColor 1500
                ]
            , hover [ backgroundColor (rgb 0 255 255) ]
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
            getLukeView luke



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view >> toUnstyled
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
