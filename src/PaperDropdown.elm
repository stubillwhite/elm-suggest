module PaperDropdown exposing (DropdownConfig, paperDropdown, paperItem)

import Html exposing (..)
import Html.Attributes exposing (attribute, property)
import Json.Encode as Encode
import List


type alias DropdownConfig =
    { id : String
    , label : String
    , values : List String
    }


paperDropdown : DropdownConfig -> List (Attribute msg) -> List (Html msg) -> Html msg
paperDropdown dropdownConfig attributes children =
    node "paper-autocomplete"
        (List.concat
            [ attributes
            , [ attribute "id" dropdownConfig.id
              , attribute "label" dropdownConfig.label
              , attribute "min-length" "0"
              ]
            ]
        )
        children


paperItem : List (Attribute msg) -> List (Html msg) -> Html msg
paperItem =
    node "paper-item"
