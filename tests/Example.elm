module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import N3ds exposing (..)
import Test exposing (..)


suite : Test
suite =
    todo "Implement our first test. See http://package.elm-lang.org/packages/elm-community/elm-test/latest for how to do this!"


encoderTest : Test
encoderTest =
    test "foo"
        (\_ ->
            encodeData "foo"
                |> Expect.equal (Ok """foo""")
        )



-- decoderTest : Test
-- decoderTest =
--     test "title defaults to (untitled)"
--         (\_ ->
--             "{\"url\": \"fruits.com\", \"size\": 5}"
--                 |> decodeString photoDecoder
--                 |> Expect.equal
--                     (Ok { url = "fruits.com", size = 5, title = "" })
--         )
