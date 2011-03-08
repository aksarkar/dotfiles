import Monad
import Data.Monoid (All (All))

import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders (smartBorders)
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig

-- Helper functions to fullscreen the window
fullFloat :: Window -> X ()
fullFloat w = windows $ W.float w r
    where r = W.RationalRect 0 0 1 1

tileWin :: Window -> X ()
tileWin w = windows $ W.sink w

handleEventHook' :: Event -> X All
handleEventHook' (ClientMessageEvent _ _ _ dpy win typ dat) = do
  state <- getAtom "_NET_WM_STATE"
  fullsc <- getAtom "_NET_WM_STATE_FULLSCREEN"
  isFull <- runQuery isFullscreen win

  -- Constants for the _NET_WM_STATE protocol
  let remove = 0
      add = 1
      toggle = 2

      -- The ATOM property type for changeProperty
      ptype = 4 

      action = head dat

  when (typ == state && (fromIntegral fullsc) `elem` tail dat) $ do
    when (action == add || (action == toggle && not isFull)) $ do
         io $ changeProperty32 dpy win state ptype propModeReplace 
                [fromIntegral fullsc]
         fullFloat win
    when (head dat == remove || (action == toggle && isFull)) $ do
         io $ changeProperty32 dpy win state ptype propModeReplace []
         tileWin win

  -- It shouldn't be necessary for xmonad to do anything more with this event
  return $ All False

handleEventHook' _ = return $ All True

modMask' = mod4Mask

manageHook' = composeAll
              [ isFullscreen --> doFullFloat
              , className =? "Pidgin" --> doFloat
              ]

dmenu' = "exec `dmenu_path | dmenu -fn Consolas-9:bold -nb \\#222 -nf \\#dcdccc -sb \\#dcdccc -sf \\#222`"

main = xmonad $ ewmh $ defaultConfig
       { handleEventHook = handleEventHook'
       , layoutHook = smartBorders $ avoidStruts $ layoutHook defaultConfig
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
