module Main exposing (Model, init, main)

import Browser
import Html exposing (Html, div, form, h1, h2, input, label, li, option, select, text, ul)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (onClick, onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { accounts : List Account
    }


init : Model
init =
    Model [ { id = 1, name = "三井住友目白店" }, { id = 2, name = "三井住友渋谷駅前店" }, { id = 3, name = "Sony Bank" } ]


type alias Account =
    { id : Int
    , name : String
    }



-- UPDATE


type Msg
    = None



--= InputAccount String
--| AddAccount


update : Msg -> Model -> Model
update msg model =
    case msg of
        None ->
            model



--InputAccount name ->
--    { model | accountInput = { id = List.length model.accounts, name = name } }
--AddAccount ->
--    { model | accounts = List.append model.accounts [ model.accountInput ] }
-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "HAM" ]
        , h2 [] [ text "Spent money" ]
        , form []
            [ div []
                [ label [] [ text "Date" ]
                , input [ type_ "text" ] []
                , label [] [ text "Account" ]
                , input [ type_ "text" ] []
                , label [] [ text "Price" ]
                , input [ type_ "text" ] []
                , label [] [ text "What" ]
                , input [ type_ "text" ] []
                , label [] [ text "Amount (optional)" ]
                , input [ type_ "text" ] []
                , label [] [ text "Where" ]
                , input [ type_ "text" ] []
                , label [] [ text "Notes" ]
                , input [ type_ "text" ] []
                ]
            ]
        , h2 [] [ text "Add Account" ]
        , form []
            [ div []
                [ label [] [ text "Account" ]
                , input [ type_ "text" ] []
                ]
            , div [] [ input [ type_ "submit" ] [ text "Add" ] ]
            ]
        , div []
            [ ul [] (accountsToList model.accounts) ]
        ]


accountsToList : List Account -> List (Html msg)
accountsToList accounts =
    List.map (\acc -> li [] [ text (String.fromInt acc.id ++ ": " ++ acc.name) ]) accounts
