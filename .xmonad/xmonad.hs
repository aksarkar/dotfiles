import XMonad

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders (smartBorders)

import XMonad.Util.EZConfig

modMask' = mod4Mask

manageHook' = composeAll
              [ isFullscreen --> doFullFloat
              , className =? "Pidgin" --> doFloat
              ]

dmenu' = "exec `dmenu_path | dmenu -fn Consolas-9:bold -nb \\#222 -nf \\#dcdccc -sb \\#dcdccc -sf \\#222`"

main = xmonad $ ewmh $ defaultConfig
       { layoutHook = smartBorders $ avoidStruts $ layoutHook defaultConfig
       , modMask = modMask'
       , manageHook = manageHook' <+> manageHook defaultConfig <+> manageDocks
       , terminal = "urxvtc"
       }
       `additionalKeysP`
       [ ("<XF86AudioPlay>", spawn "quodlibet --play-pause")
       , ("<XF86AudioStop>", spawn "quodlibet --pause")
       , ("<XF86AudioNext>", spawn "quodlibet --next")
       , ("<XF86AudioPrev>", spawn "quodlibet --previous")
       , ("<XF86AudioLowerVolume>", spawn "amixer set Master 2dB- unmute")
       , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 2dB+ unmute")
       , ("<XF86AudioMute>", spawn "amixer set Master toggle")
       , ("M-p", spawn dmenu')
       , ("M-d", spawn "quodlibet --play-pause")
       , ("M-f", spawn "quodlibet --next")
       ]
