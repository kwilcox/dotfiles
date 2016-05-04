import XMonad
-- Mouse follows active window
import XMonad.Actions.UpdatePointer
import XMonad.Util.EZConfig

-- Actions
--import XMonad.Actions.GridSelect

-- Hooks
import XMonad.Hooks.ManageDocks

-- Layouts
import XMonad.Layout.IM
--import XMonad.Layout.Grid
import XMonad.Layout.Named
import XMonad.Layout.Tabbed
import XMonad.Layout.Reflect
import XMonad.Layout.NoBorders
import XMonad.Layout.HintedGrid
import XMonad.Layout.PerWorkspace
import XMonad.Layout.DecorationMadness
import XMonad.Layout.IndependentScreens

-- Haskell
import Data.Ratio ((%))
import qualified Data.Map as M
import qualified XMonad.StackSet as W

-- DZen bars
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook

-- Java Crap
import XMonad.Hooks.SetWMName

-- SuperKey
modMask'            = mod4Mask  --windows key

-- Borders
borderWidth'        = 2
normalBorderColor'  = "#000000" -- black
focusedBorderColor' = "#ffcc33" -- yellowish


-- Workspaces
myWorkspaces'       = [ "1.social", "2.main", "3.web", "4.terminals", "5.extra", "6.junk" ]

-- Keys
myKeys' conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modMask, k), windows $ f i)
       | (i, k) <- zip myWorkspaces' [xK_1 .. xK_9]
       , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    --
    -- mod-{F1,F2,F3,F4}, Switch to physical screen 1, 2, 3, or 4
    -- mod-shift-{F1,F2,F3,F4}, Move client to screen 1, 2, 3, or 4
    --T
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
       | (key, sc) <- zip [xK_F1, xK_F2, xK_F3, xK_F4] [0..]
       , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++
    --o
    -- Rofi
    [((modMask, xK_p), spawn "rofi -show run" )]
    ++
    [((modMask, xK_s), spawn "rofi -show ssh" )]
    --


-- Hooks
myManageHook'       = composeAll [
                        (resource  =? "synapse")        --> doIgnore
                       ,(resource  =? "stalonetray")    --> doIgnore
                       ,(resource  =? "rdesktop")       --> doIgnore
                       ,(className =? "Gnome-panel"     <&&> title =? "Run Application") --> doFloat
                       ,(className =? "Skype")          --> moveToSocial
                       ,(className =? "Pidgin")         --> moveToSocial
                       ,(className =? "Google-chrome"   <&&> role =? "pop-up") --> moveToSocial
                       ,(className =? "google-chrome"   <&&> role =? "pop-up") --> moveToSocial
                       ,(className =? "xchat")          --> moveToSocial
                       ,(className =? "vlc")            --> moveToMain
                       ,(className =? "Git-gui")        --> doFloat
                       ,(className =? "push_setup")     --> doFloat
                       ,(className =? "ucar-nc2-ui-ToolsUI")     --> doFloat
                       ,(role      =? "gimp-toolbox")   --> doFloat
                       ,(role      =? "gimp-image-window") --> doFloat
                       ,(role      =? "GtkFileChooserDialog") --> doFloat
                      ]
                      where
                        role           = stringProperty "WM_WINDOW_ROLE"
                        moveToSocial   = doF $ W.shift "1.social"
                        moveToMain     = doF $ W.shift "2.main"

-- Layouts
-- Default tiling
basic :: Tall a
basic = Tall nmaster delta ratio
  where
    -- The default number of windows in the master pane
    nmaster = 1
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2

defaultLayouts      = tall ||| wide ||| full ||| tabbed ||| grid
    where
        tall   = named "tall"   $ basic
        wide   = named "wide"   $ Mirror basic
        tabbed = named "tabbed" $ simpleTabbed
        grid   = named "grid"   $ Grid False
        full   = named "full"   $ noBorders Full
        adef   = named "adef"   $ accordionSimpleDefaultResizable
        adwm   = named "adwm"   $ accordionSimpleDwmStyle
        atab   = named "atab"   $ accordionSimpleTabbed
        cdef   = named "cdef"   $ circleSimpleDefaultResizable
        cdeco  = named "cdeco"  $ circleSimpleDecoResizable
        cdwm   = named "cdwm"   $ circleSimpleDwmStyle
        ctab   = named "ctab"   $ circleSimpleTabbed

imLayouts          = tall ||| wide ||| tabbed ||| grid
    where
        tall   = named "tall"   $ basic
        wide   = named "wide"   $ Mirror basic
        tabbed = named "tabbed" $ simpleTabbed
        grid   = named "grid"   $ Grid False
        full   = named "full"   $ noBorders Full
        adef   = named "adef"   $ accordionSimpleDefaultResizable
        adwm   = named "adwm"   $ accordionSimpleDwmStyle
        atab   = named "atab"   $ accordionSimpleTabbed
        cdef   = named "cdef"   $ circleSimpleDefaultResizable
        cdeco  = named "cdeco"  $ circleSimpleDecoResizable
        cdwm   = named "cdwm"   $ circleSimpleDwmStyle
        ctab   = named "ctab"   $ circleSimpleTabbed

-- IM layout (http://pbrisbin.com/posts/xmonads_im_layout)
-- Lays out the Pidgin and Skype rosters on the left side, and
-- applys layout to the remaining realestate.
imLayout            =
    named "im" $ avoidStruts $ withIM (1%10) skypeRoster
                             $ reflectHoriz
                             $ withIM (1/1.75) googleChrome
                             $ withIM (1/1.75) firefox
                             $ imLayouts

    where
        tall   = named "tall"   $ basic
        wide   = named "wide"   $ Mirror basic
        tabbed = named "tabbed" $ simpleTabbed
        grid   = named "grid"   $ Grid False
        full   = named "full"   $ noBorders Full
        adef   = named "adef"   $ accordionSimpleDefaultResizable
        adwm   = named "adwm"   $ accordionSimpleDwmStyle
        atab   = named "atab"   $ accordionSimpleTabbed
        cdef   = named "cdef"   $ circleSimpleDefaultResizable
        cdeco  = named "cdeco"  $ circleSimpleDecoResizable
        cdwm   = named "cdwm"   $ circleSimpleDwmStyle
        ctab   = named "ctab"   $ circleSimpleTabbed

pidginRoster  = ClassName "Pidgin" `And` Role "buddy_list"
pidginConvo   = ClassName "Pidgin" `And` Role "conversation"
skypeRoster   = ClassName "Skype" `And` Title "wilcoxkyle - Skype™"
hangoutConvo  = ClassName "google-chrome" `And` Role "pop-up"
hangoutRoster = ClassName "google-chrome" `And` Title "Hangouts"
googleChrome  = (ClassName "google-chrome" `And` Role "browser") `Or` (ClassName "Google-chrome-beta" `And` Role "browser") `Or` (ClassName "Google-chrome-unstable" `And` Role "browser") `Or` (ClassName "google-chrome-unstable" `And` Role "browser")
firefox       = ClassName "Firefox" `And` Role "browser"

myLayouts'          = onWorkspace "1.social" imLayout $ defaultLayouts

-- LogHook
myLogHook' h = dynamicLogWithPP $ defaultPP

    -- display current workspace as darkgrey on light grey (opposite of
    -- default colors)
    { ppCurrent         = dzenColor "#303030" "#909090" . pad

    -- display other workspaces which contain windows as a brighter grey
    , ppHidden          = dzenColor "#909090" "" . pad

    -- display other workspaces with no windows as a normal grey
    , ppHiddenNoWindows = dzenColor "#606060" "" . pad

    -- display the current layout as a brighter grey
    , ppLayout          = dzenColor "#909090" "" . pad

    -- if a window on a hidden workspace needs my attention, color it so
    , ppUrgent          = dzenColor "#ff0000" "" . pad . dzenStrip

    -- shorten if it goes over 100 characters
    , ppTitle           = shorten 100

    -- no separator between workspaces
    , ppWsSep           = " | "

    -- put a few spaces between each object
    , ppSep             = "  "

    -- output to the handle we were given as an argument
    , ppOutput          = hPutStrLn h
    }

--import XMonad.Config.Gnome
--terminal'           = "gnome-terminal"
--main = xmonad gnomeConfig
--           {  modMask               = modMask'
--             ,borderWidth           = borderWidth'
--             ,terminal              = terminal'
--             ,normalBorderColor     = normalBorderColor'
--             ,focusedBorderColor    = focusedBorderColor'
--             ,manageHook            = myManageHook' <+> manageHook gnomeConfig
--             ,workspaces            = myWorkspaces'
--             ,layoutHook            = myLayouts'
--             ,keys                  = myKeys' <+> keys gnomeConfig
--           }

--import XMonad.Config.Xfce
--terminal'           = "xfce4-terminal"
--main = xmonad xfceConfig
--           {  modMask               = modMask'
--             ,borderWidth           = borderWidth'
--             ,terminal              = terminal'
--             ,normalBorderColor     = normalBorderColor'
--             ,focusedBorderColor    = focusedBorderColor'
--             ,manageHook            = myManageHook' <+> manageHook xfceConfig
--             ,workspaces            = myWorkspaces'
--             ,layoutHook            = myLayouts'
--             ,keys                  = myKeys' <+> keys xfceConfig
--           }

terminal' = "gnome-terminal"
main = do
  -- If terminus font is available
  d <- spawnPipe "dzen2 -p -xs 2 -ta l -fg orange -bg grey20 -fn '-*-terminus-medium-r-normal--14------iso8859-1' -e 'onstart=lower'"
  spawn $ "conky -c ~/.xmonad/conky-dzen | " ++
                "dzen2 -p -xs 1 -ta c -fg orange -bg grey20 -fn '-*-terminus-medium-r-normal--12------iso8859-1' -e 'onstart=lower'"
  -- If not terminus font
  --d <- spawnPipe "dzen2 -p -xs 2 -ta l -fg orange -bg grey20 -fn '-misc-fixed-medium-r-normal--14-*-*-*-*-*-iso8859-1' -e 'onstart=lower'"
  --spawn $ "conky -c ~/.xmonad/conky-dzen | " ++
  --              "dzen2 -p -xs 1 -ta c -fg orange -bg grey20 -fn '-misc-fixed-medium-r-normal--10-*-*-*-*-*-iso8859-1' -e 'onstart=lower'"

  spawn $ "skype"

  xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
           {  modMask               = modMask'
             ,borderWidth           = borderWidth'
             ,terminal              = terminal'
             ,normalBorderColor     = normalBorderColor'
             ,focusedBorderColor    = focusedBorderColor'
             ,manageHook            = manageDocks <+> myManageHook' <+> manageHook defaultConfig
             ,workspaces            = myWorkspaces'
             ,layoutHook            = avoidStruts $ myLayouts'
             ,keys                  = myKeys' <+> keys defaultConfig
             ,logHook               = myLogHook' d
                                    >> updatePointer Nearest
             ,startupHook           = setWMName "LG3D"
           }
