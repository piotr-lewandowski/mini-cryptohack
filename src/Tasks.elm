module Tasks exposing (..)

import Html exposing (..)
import Latex exposing (..)
import Katex
    exposing
        ( Latex
        , human
        , inline
        , display
        )

type Msg
  = Typed String
  | Check

type alias Task = 
    { name : String
    , description : Html Msg
    , input : String
    , solution : String
    }

hamming : Html msg
hamming = div [] [
    p [] [ text """O nie. Razem z kolegą Henrykiem chcecie wysłać sobie odpowiedź do zadania na kolokwium. W tym celu Henryk zaszyfrował odpowiedź kodem Hamminga H(7,3). Przy wstępnym odkodowaniu okazało się, że podczas przesyłu powstał błąd. Znajdź błąd i odkoduj odpowiedź wysłaną przez Henryka.""" ],
    p [] [ text "Wiadomość otrzymana od Henryka: 0100011, 0001101" ],
    p [] [ text """Odkoduj każde słowo kodowe oddzielnie. Następnie sklej otrzymane ciągi i zamień liczbę binarną na dziesiętną. To twoja flaga.""" ]
    ]

hammingTask : Task
hammingTask = 
    { name = ""
    , description = hamming
    , input = ""
    , solution = "96e8a79e469e4bd913c48194fb502d97d75d37e92fb6d1a25cc9822c07142566"
    }

task1 : Task
task1 = 
    { name = "Task 1"
    , description = text """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus. Faucibus a pellentesque sit amet porttitor eget dolor morbi. Amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus. Tempus quam pellentesque nec nam aliquam sem et. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Et tortor at risus viverra adipiscing at in tellus. Id venenatis a condimentum vitae sapien. Felis bibendum ut tristique et egestas quis ipsum suspendisse. Augue interdum velit euismod in pellentesque massa placerat. Urna molestie at elementum eu facilisis sed. Vulputate ut pharetra sit amet aliquam id diam maecenas.

Purus faucibus ornare suspendisse sed nisi lacus sed viverra. Feugiat in ante metus dictum at tempor commodo ullamcorper. Odio aenean sed adipiscing diam donec. Sed nisi lacus sed viverra. Tincidunt ornare massa eget egestas purus viverra. Eget mi proin sed libero enim sed faucibus turpis in. Vulputate mi sit amet mauris commodo quis imperdiet. Metus vulputate eu scelerisque felis. Eget felis eget nunc lobortis mattis aliquam faucibus purus in. Leo vel fringilla est ullamcorper eget. Nec sagittis aliquam malesuada bibendum arcu vitae elementum. Leo integer malesuada nunc vel risus commodo viverra maecenas accumsan. Arcu bibendum at varius vel pharetra vel turpis nunc. Vel eros donec ac odio tempor orci dapibus. Fermentum iaculis eu non diam phasellus vestibulum lorem sed. Congue mauris rhoncus aenean vel elit scelerisque mauris. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget.

Netus et malesuada fames ac turpis egestas maecenas. Ac feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper. Porttitor massa id neque aliquam vestibulum morbi. Venenatis cras sed felis eget velit. Non tellus orci ac auctor augue mauris augue. A scelerisque purus semper eget duis. Tellus rutrum tellus pellentesque eu tincidunt. Nibh tellus molestie nunc non. Nunc eget lorem dolor sed viverra. Iaculis nunc sed augue lacus viverra vitae congue eu consequat. A condimentum vitae sapien pellentesque habitant morbi. Pulvinar mattis nunc sed blandit. Dolor sed viverra ipsum nunc. Sollicitudin tempor id eu nisl nunc mi ipsum. Faucibus interdum posuere lorem ipsum dolor. Elementum integer enim neque volutpat ac tincidunt."""
    , input = ""
    , solution = "c3bbd96b84a66bb27d503dbc554a3f70b951c40e12ba0c8e5207b2c5b8ed0fb9"
    }


passage : List Latex
passage =
    [ human "We denote by "
    , inline "\\phi"
    , human " the formula for which "
    , display "\\Gamma \\vDash \\phi"
    ]

task2 : Task
task2 = 
    { name = "Task 2"
    , description = latexView passage
    , input = ""
    , solution = "c3bbd96b84a66bb27d503dbc554a3f70b951c40e12ba0c8e5207b2c5b8ed0fb9"
    }
