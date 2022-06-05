module Main exposing (..)

import Browser
import Html exposing (Html, text, div, h1, img, node, button, a, ul, li, input, span, h3)
import Html.Attributes exposing (class, id, src, href, type_, attribute)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


---- VIEW ----

view : Model -> Html Msg
view model =
    div []
        [ navbar
        , hero
        , getStarted
        , services
        , details
        , footer
        ]

navbar : Html msg
navbar = 
    div [class "Navbar"]
        [ logo
        , logoAlt
        , navLinks
        , navHamburger
        ]

logo : Html msg
logo =
    img [ src "/logo.svg", id "logo", class "Icon"] []

logoAlt : Html msg
logoAlt = 
    img [ src "/logo-alt.svg", id "logo-alt", class "Icon"] []

navOptions : List { title : String, ref : String }
navOptions =
    [ { title = "HOME", ref = "#home" }
    , { title = "PRICING", ref = "#pricing" }
    , { title = "ABOUT", ref = "#about" }
    ]

navLinks : Html msg
navLinks =
    navOptions 
        |> List.map (\link -> a [ class "NavLink", href link.ref ] [ text link.title ])
        |> div [ class "NavLinks" ]

navHamburger : Html msg
navHamburger = 
    div [ id "hamburger-toggle" ]
        [ input [ type_ "checkbox" ] []
        , span [] []
        , span [] []
        , span [] []
        , navOptions
            |> List.map (\link -> li [ class "HamburgerItem", href link.ref ] [ text link.title ])
            |> ul [ id "hamburger-list" ]
        ]
    
heroIcon : Html msg
heroIcon = 
    img [ src "/icons/tv-icon.svg", id "hero-icon", class "Icon" ] []

hero : Html msg
hero =
    div [ id "hero", class "Hero" ]
        [ div [ class "HeroText" ] 
            [ h1 [ id "hero-text-top" ] [ text "Your streaming services." ]
            , h1 [ id "hero-text-bottom" ] [ text "Your way." ]
            ]
        , heroIcon
        ]

arrow : Html msg
arrow = 
    node "lottie-player"
        [ attribute "id" "arrow"
        , attribute "src" "https://assets2.lottiefiles.com/packages/lf20_muyl0kpg.json"
        , attribute "background" "transparent"
        , attribute "speed" "0.4"
        , attribute "autoplay" ""
        ]
        []

getStarted : Html msg
getStarted = 
    div [class "GetStarted"] 
        [ arrow
        , button [ id "get-started-button", class "LargeButton" ] [ text "GET STARTED" ]
        ]

services : Html msg
services = 
    div [ class "ServicesBar" ] 
        [ img [ id "service-logos" 
            , src "/icons/services.png" ] []
        ]

para : Html msg
para = 
    div [ class "LongText" ] 
        [ span [] 
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt tellus pretium laoreet nisi, ut risus est id nulla. Erat nunc faucibus commodo at mattis ornare."
            ]
        , span [] 
            [ text "Duis sit elit tellus a, risus netus malesuada et. At pellentesque nunc vestibulum, ultrices at sollicitudin urna. Montes, ut dictum purus risus fames tortor sit sociis. Eget sed felis rhoncus diam. Non in semper justo, porta gravida in pellentesque."
            ]
        , span [] 
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt tellus pretium laoreet nisi, ut risus est id nulla. Erat nunc faucibus commodo at mattis ornare. Duis sit elit tellus a, risus netus malesuada et. At pellentesque nunc vestibulum, ultrices at sollicitudin urna."
            ]
        , span [] 
            [ text "Montes, ut dictum purus risus fames tortor sit sociis. Eget sed felis rhoncus diam. Non in semper justo, porta gravida in pellentesque."
            ]
        ]

featureItems : List { summary : String, description : String, image : String }
featureItems = 
    [ { summary = "Everything in one place", description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Risus mattis auctor massa, proin dolor in cursus amet. Egestas aliquet.", image = "/icons/boxes.svg" }
    , { summary = "Complete customisation + control", description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Risus mattis auctor massa, proin dolor in cursus amet. Egestas aliquet.", image = "/icons/boxes-edited.svg" }
    ]

features : Html msg
features = 
    featureItems
        |> List.map (\feature -> div [ class "Feature" ]
                                 [ h3 [] [ text feature.summary ]
                                 , div [ class "FeatureBody" ] 
                                    [ text feature.description
                                    , img [ src feature.image ] []
                                    ]
                                 ])
        |> div [ class "Features" ]

details : Html msg
details =
    div [ class "Details" ] 
        [ para 
        , features
        ]

footer : Html msg
footer = 
    div [ id "footer" ]
        [ img [ id "footer-logo", src "/logo.svg" ] []
        , div [] [ text "Copyright © 2022 Streamease Inc." ]
        , div [] [ text "Created by Aaron Seabrook." ]
        ]


---- PROGRAM ----

main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
