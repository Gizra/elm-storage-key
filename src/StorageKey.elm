module StorageKey
    exposing
        ( StorageKey(..)
        , isExisting
        , isNew
        )

{-| A `StorageKey` represents a value that is either `New` or `Existing`.

`StorageKey` is a type that would be used normally as a key in an
[EveryDict](http://package.elm-lang.org/packages/eeue56/elm-all-dict/latest)
or [EveryDictList](http://package.elm-lang.org/packages/Gizra/elm-dictlist/latest)
to indicate if a value is already `Existing` - that is, stored in the backend, or `New`.

If used as a key for an `EveryDict` we are guarnteed to have only a single `New`.

@docs StorageKey, isExisting, isNew

-}


{-| A `StorageKey` value is either `New` or `Existing`.

    view : StorageKey -> Html msg
    view storageKey =
        case storageKey of
            Existing recordId ->
                text <| "Record ID is " ++ toString recordId

            ReadOnly saved ->
                text "Record was not saved yet"

-}
type StorageKey recordId
    = New
    | Existing recordId


{-| Determines if a `StorageKey` is of type `New`.

    StorageKey.New
        |> StorageKey.isNew  --> True

    StorageKey.Existing "uuid-1234"
        |> StorageKey.isNew  --> False

-}
isNew : StorageKey recordId -> Bool
isNew storageKey =
    case storageKey of
        New ->
            True

        _ ->
            False


{-| Determines if a `StorageKey` is of type `New`.

    StorageKey.New
        |> StorageKey.isExisting  --> False

    StorageKey.Existing "uuid-1234"
        |> StorageKey.isNew  --> True

-}
isExisting : StorageKey recordId -> Bool
isExisting storageKey =
    case storageKey of
        Existing _ ->
            True

        _ ->
            False
