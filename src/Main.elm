module Main exposing (..)

import Browser exposing (Document)
import List exposing (length)
import Json.Decode as Json
import Tasks exposing (..)
import Latex exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import List exposing (repeat)
import Checker exposing (..)


type alias Score = Int

type State = RemainingTasks (List Task) Score


-- MAIN


main : Program () Model Msg
main =
  Browser.document { init = init, update = update, view = view, subscriptions = subscriptions }


-- MODEL


type alias Model = State


startingModel : Model
startingModel = RemainingTasks [hammingTask, task2, task1] 0

init : flags -> ( Model , Cmd Msg )
init _ = (startingModel, Cmd.none)


-- UPDATE


update : Msg -> Model -> ( Model , Cmd Msg )
update msg model = case msg of
    Typed t -> case model of 
        RemainingTasks (task :: rest) n ->  ( RemainingTasks ({ task | input = t } :: rest) n , Cmd.none )
        RemainingTasks [] _ ->  ( model , Cmd.none )
    Check -> case model of
        RemainingTasks (task :: rest) n -> if checkAnswer task
            then ( RemainingTasks rest (n + 1) , Cmd.none )
            else ( model , Cmd.none )
        RemainingTasks [] _ ->  ( model , Cmd.none )


-- VIEW


taskView : Task -> Html Msg
taskView task =
    div [ ]
        [
            div [ class "row" ]
                [
                    div [ class "col-md-2" ]
                    [

                    ],
                    div [ class "col-md-8" ]
                    [
                        h3 [] [ text task.name ]
                    ],
                    div [ class "col-md-2" ]
                    [

                    ]
                ],
            div [ class "row" ]
                [
                    div [ class "col-md-2" ]
                    [

                    ],
                    div [ class "col-md-8" ]
                    [
                        p [ class "text-justify" ] [ task.description ]
                    ],
                    div [ class "col-md-2" ]
                    [

                    ]
                ],
            div [ class "row form-group" ]
                [
                    div [ class "col-md-2" ]
                    [

                    ],
                    div [ class "col-md-4" ]
                    [
                        input [ class "form-control", value task.input, onInput Typed, onEnter Check, size 30, style "margin-top" "1em" ] []
                    ],
                    div [ class "col-md-4" ]
                    [
                        button [ onClick Check, class "btn btn-success", style "margin-top" "1em" ] [ text "Sprawdź" ]
                    ],
                    div [ class "col-md-2" ]
                    [

                    ]
                ]
        ]

onEnter : Msg -> Attribute Msg
onEnter msg =
    let
        isEnter code =
            if code == 13 then
                Json.succeed msg
            else
                Json.fail "not ENTER"
    in
        on "keydown" (Json.andThen isEnter keyCode)

gold : Attribute msg
gold = style "color" "#feb32b"

gray : Attribute msg
gray = style "color" "#0c1221"

star : Attribute Msg -> Html Msg
star attr = i [ class "fas fa-star gold-text", attr ] []

scoreView : Int -> Int -> Html Msg
scoreView n m = div [] <| (text "Wynik: ") :: (repeat n (star gold)) ++ (repeat m (star gray)) 

view : Model -> Document Msg
view model =
    let 
        bdy = case model of
            RemainingTasks (task :: _) _ ->
                div [  ] [ text <| getHash task.solution, taskView task ]
            RemainingTasks [] _ ->
                div [  ] [ h1 [ class "text-center" ] [ text "Gratulacje" ] ]
        hdr = case model of
            RemainingTasks ts n -> div [ style "padding" "2em" ] [ header [] [ h2 [] [ text "MiNI CryptoHack" ], scoreView n (length ts) ] ]
    in 
        { title = "MiNI CryptoHack"
        , body = [ div [] [ hdr, bdy ] ]
        }

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
