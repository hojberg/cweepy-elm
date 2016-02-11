import App exposing (Model, update, view)
import StartApp.Simple exposing (start)

model : Model
model =
  { cweeps =
    [ { avatar = "https://pbs.twimg.com/profile_images/1335705419/awful_head_shot.jpg" , message = "I love ActionScript" }
    , { avatar = "https://pbs.twimg.com/profile_images/1342039410/FB_400x400.jpg", message = "Endermen used to be people" }
    , { avatar = "https://avatars0.githubusercontent.com/u/787998?v=3&s=400", message = "dat cweep" }
    , { avatar = "https://avatars2.githubusercontent.com/u/2667446?v=3&s=460", message = "We don't go to Ravenholm" }
    ]
  , showAddCweepForm = False
  , messageInput = ""
  }

main =
  start { model = model
        , update = update
        , view = view }
