module Cweeps (Model, view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import CweepItem

-- MODEL

type alias Model =
  List CweepItem.Model

-- VIEW

view : Model -> Html
view model =
  ul [ class "cweeps" ]
    (List.map CweepItem.view model)
