module Types exposing (Luke, Msg(..))

import Html


type Msg
    = NoOp
    | OnClickLuke Luke


type alias Luke =
    { dag : Int }
