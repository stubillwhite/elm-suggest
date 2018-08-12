port module Main exposing (..)

import Debug exposing (..)
import Html exposing (Html, button, div, label, program, text)
import Html.Attributes exposing (attribute, style)
import Html.Events exposing (onClick)
import Json.Decode as Json
import Json.Encode as Encode exposing (Value, bool, encode, float, int, list, object, string)
import PaperDropdown exposing (..)


-- Types


type alias Model =
    { value : Int
    }


type Msg
    = Selected String



-- Update


initialModel : ( Model, Cmd Msg )
initialModel =
    { value = 0 }
        ! [ Cmd.batch
                [ setData (encodeDropdownConfig pizzaBaseDropdown)
                , setData (encodeDropdownConfig pizzaToppingDropdown)
                ]
          ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Selected s ->
            let
                _ =
                    Debug.log "Selected" s
            in
            model ! []


pizzaBaseDropdown : DropdownConfig
pizzaBaseDropdown =
    { id = "pizza-base"
    , label = "Pizza base"
    , values = [ "Thin", "Sicilian", "Chicago", "New York" ]
    }


pizzaToppingDropdown : DropdownConfig
pizzaToppingDropdown =
    { id = "pizza-topping"
    , label = "Pizza topping"
    , values =
        [ "Americana"
        , "Bismarck"
        , "Boscaiola"
        , "Braccio di Ferro"
        , "Bufalina"
        , "Calzone"
        , "Campagnola"
        , "Caprese"
        , "Capricciosa"
        , "Carbonara"
        , "Contadina"
        , "Crudo"
        , "Diavola"
        , "Emiliana"
        , "Fattoria"
        , "Fiori di zucca"
        , "Fontana"
        , "Francescana"
        , "Frutti di Mare"
        , "Funghi"
        , "Gorgonzola"
        , "Mare e Monti"
        , "Margherita"
        , "Marinara"
        , "Mediterranea"
        , "Mimosa"
        , "Montanara"
        , "Napoletana or Napoli"
        , "Ortolana"
        , "Padana"
        , "Parmigiana"
        , "Pizza al Pesto"
        , "Pizza tartufata"
        , "Prosciutto e Funghi"
        , "Prosciutto or Cardinale"
        , "Pugliese"
        , "Quattro Formaggi"
        , "Quattro Stagioni"
        , "Ricotta e Spinaci"
        , "Romana"
        , "Rustica"
        , "Sarda"
        , "Schiacciata"
        , "Tedesca"
        , "Tirolese"
        , "Tonno"
        , "Tricolore"
        , "Valdostana"
        , "Valtellina"
        , "Vegetariana"
        ]
    }



-- View


mode : String -> Html.Attribute attr
mode value =
    Html.Attributes.attribute "mode" value


view : Model -> Html Msg
view model =
    div []
        [ paperDropdown pizzaBaseDropdown [] []
        , paperDropdown pizzaToppingDropdown [] []
        ]


port setData : Json.Value -> Cmd msg


port receiveData : (String -> a) -> Sub a


subscriptions : Model -> Sub Msg
subscriptions _ =
    receiveData (\text -> Selected text)


main : Program Never Model Msg
main =
    program
        { init = initialModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


encodeDropdownConfig : DropdownConfig -> Value
encodeDropdownConfig dropdownConfig =
    Encode.object
        [ ( "id", Encode.string dropdownConfig.id )
        , ( "values", Encode.list (List.map Encode.string dropdownConfig.values) )
        ]
