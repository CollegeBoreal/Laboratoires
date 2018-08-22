module View exposing (..)

import Html exposing (Html, div, text)
import Msgs exposing (Msg)
import Models exposing (Model, Player, List)
import Players.List
import RemoteData exposing (WebData)


view : WebData (List Player) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]

maybeList : WebData (List Player) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success players ->
            list players

        RemoteData.Failure error ->
            text (toString error)


page : Model -> Html Msg
page model =
    Players.List.view model.players
