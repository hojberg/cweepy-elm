module Header (Model, Action, view, update) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (Address)

-- MODEL

type alias Model = Bool

-- UPDATE

type Action
  = ToggleAddCweepForm

update : Action -> Model -> Model
update action model =
  not model

-- VIEW

view : Address Action -> Model -> Html
view address model =
  header [ class "header" ]
    [ h1 [ ] [ text "Cweepy" ]
    , button
      [ class "add-cweep"
      , onClick address ToggleAddCweepForm
      ]
      [ text "+" ]
    ]
