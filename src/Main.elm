module Main exposing (..)

import Browser
import Debug exposing (toString)
import Html exposing (Html, br, button, div, h2, li, p, text, ul)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


init =
    30


update model =
    model


fib x =
    case x of
        0 ->
            1

        1 ->
            1

        _ ->
            fib (x - 1) + fib (x - 2)


ml x =
    List.range 1 x


fibs x =
    List.map fib (ml x)


createli : Int -> Html msg
createli str =
    if str < init && modBy 2 str == 0 then
        li [] [ text (toString str) ]

    else
        div [] []


view model =
    div []
        [ fibs model |> List.map createli |> ul []
        ]
