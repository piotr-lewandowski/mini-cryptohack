module Latex exposing (..)

import Katex as K exposing ( Latex )
import Html exposing (..)

latexView : List Latex -> Html a
latexView ltx =
    let
        htmlGenerator isDisplayMode stringLatex =
            case isDisplayMode of
                Just True ->
                    div [] [ text stringLatex ]

                _ ->
                    span [] [ text stringLatex ]
    in
        ltx
            |> List.map (K.generate htmlGenerator)
            |> div []