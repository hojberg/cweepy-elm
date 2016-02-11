module AddCweepForm (Model, Action, Context, view, update) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (Address)

-- MODEL

type alias Model = String

-- UPDATE

type Action
  = UpdateMessageInput String

update : Action -> Model -> Model
update action model =
  case action of
    UpdateMessageInput contents -> contents

-- VIEW

type alias Context =
  { actions : Address Action
  , postCweep : Signal.Address ()
  }

onInput : Address a -> (String -> a) -> Attribute
onInput address f =
  on "input" targetValue (\v -> Signal.message address (f v))

view : Context -> Model -> Html
view context model =
  div [ class "add-cweep-form" ]
    [ input
        [ class "message"
        , value model
        , onInput context.actions UpdateMessageInput
        ]
        [ ]
    , button [ onClick context.postCweep () ] [ text "Post" ]
    ]
