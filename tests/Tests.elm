module Tests exposing (..)

import Expect
import Fuzz exposing (..)
import StorageKey exposing (StorageKey(..))
import Test exposing (..)


all : Test
all =
    describe "StorageKey"
        [ describe "#isExisting"
            [ fuzz string "return True if `StorageKey` is `Existing`" <|
                \value ->
                    Existing value
                        |> StorageKey.isExisting
                        |> Expect.equal True
            , fuzz string "return False if `StorageKey` is `New`" <|
                \_ ->
                    New
                        |> StorageKey.isExisting
                        |> Expect.equal False
            ]
        , describe "#isNew"
            [ fuzz string "return True if `StorageKey` is `New`" <|
                \_ ->
                    New
                        |> StorageKey.isNew
                        |> Expect.equal True
            , fuzz string "return False if `StorageKey` is `Existing`" <|
                \value ->
                    Existing value
                        |> StorageKey.isNew
                        |> Expect.equal False
            ]
        ]
