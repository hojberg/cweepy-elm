module App (Model, Action, view, update) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (Address)
import String

import Header
import AddCweepForm
import Cweeps

-- MODEL

type alias Model =
  { cweeps : Cweeps.Model
  , showAddCweepForm : Header.Model
  , messageInput : AddCweepForm.Model
  }

-- UPDATE

type Action
  = ToggleAddCweepForm Header.Action
  | UpdateMessageInput AddCweepForm.Action
  | PostCweep

update : Action -> Model -> Model
update action model =
  case action of
    ToggleAddCweepForm act ->
      { model | showAddCweepForm = Header.update act model.showAddCweepForm }

    UpdateMessageInput act ->
      { model | messageInput = AddCweepForm.update act model.messageInput }

    PostCweep ->
      let
        cweepToAdd =
          { message = model.messageInput
          , avatar  = "https://pbs.twimg.com/profile_images/508688074377662464/UqUjsCNu_bigger.jpeg" }
      in
        if not (String.isEmpty model.messageInput) then
          { model |
              cweeps = List.append model.cweeps [cweepToAdd],
              showAddCweepForm = False,
              messageInput = ""
          }
        else
          model

-- VIEW

view : Address Action -> Model -> Html
view address model =
  if model.showAddCweepForm then
    let
      context =
        AddCweepForm.Context
        (Signal.forwardTo address UpdateMessageInput)
        (Signal.forwardTo address (always PostCweep))
    in
      div [ id "app" ]
        [ Header.view (Signal.forwardTo address ToggleAddCweepForm) model.showAddCweepForm
        , AddCweepForm.view context model.messageInput
        , Cweeps.view model.cweeps
        ]
  else
    div [ id "app" ]
      [ Header.view (Signal.forwardTo address ToggleAddCweepForm) model.showAddCweepForm
      , Cweeps.view model.cweeps
      ]

