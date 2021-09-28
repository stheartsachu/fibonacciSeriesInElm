module Main exposing (..)

import Browser
import Debug exposing (toString)
import Html exposing (Html, br, button, div, h2, h3, li, p, text, ul)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


init =
    20


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
        li [ style "listStyle" "none" ] [ text (toString str) ]

    else
        div [] []


view model =
    div []
        [ h2 [] [ text ("Current Input : " ++ toString model) ]
        , p [] [ text "The even numbers in the fibonacci series less than the input" ]
        , fibs model |> List.map createli |> ul []
        , h3 [] [ text "fibonacci series the input : " ]
        , text (toString (fibs model))
        , p [] [ text "Change Model for other Input" ]
        ]
