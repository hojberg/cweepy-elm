module CweepItem (Model, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (Address)

-- MODEL

type alias Model =
  { avatar : String
  , message : String
  }

-- VIEW

view : Model -> Html
view model =
  li [ class "cweep-item" ]
    [ div [ class "avatar", style [("background-image", "url(" ++ model.avatar ++ ")")] ] [ ]
    , div [ class "message" ] [ text model.message ]
    ]
