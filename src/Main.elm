module Main exposing (Model, init, main)

import Browser
import Html exposing (Html, div, form, h1, input, label, li, option, select, text, ul)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (onClick, onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { accounts : List Account
    , accountInput : Account
    }


init : Model
init =
    Model [] Account


type alias Account =
    { id : Int
    , name : String
    }



-- UPDATE


type Msg
    = InputAccount String
    | AddAccount


update : Msg -> Model -> Model
update msg model =
    case msg of
        InputAccount name ->
            { model | accountInput = { id = List.length model.accounts, name = name } }

        AddAccount ->
            { model | accounts = List.append model.accounts [ model.accountInput ] }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Add Account" ]
        , form []
            [ div []
                [ label [] [ text "Account" ]
                , input [ type_ "text", onInput InputAccount ] []
                ]
            , div [] [ input [ type_ "submit", onClick AddAccount ] [ text "Add" ] ]
            ]
        , div []
            [ ul [] (accountsToList model.accounts) ]
        ]


accountsToList : List Account -> List (Html msg)
accountsToList accounts =
    List.map (\account -> li [] [ text account.name ]) accounts
