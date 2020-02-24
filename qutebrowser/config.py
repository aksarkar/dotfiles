c.completion.shrink = True
c.completion.web_history.max_items = 10
c.content.autoplay = False
c.downloads.location.directory = "/home/aksarkar/incoming"
c.editor.command = ["emacsclient", "{}"]
c.hints.scatter = False
c.hints.uppercase = True
c.tabs.new_position.related = "last"
c.tabs.show = "never"
c.url.default_page = "about:blank"
c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'maps': 'https://maps.google.com/?q={}',
    'youtube': 'https://www.youtube.com/results?search_query={}',
    'enwp': 'https://en.wikipedia.org/w/index.php?title=Special:Search&search={}',
    'arch': 'https://wiki.archlinux.org/index.php?search={}',
    'scholar': 'https://scholar.google.com/scholar?q={}'
}
c.url.start_pages = ['about:blank']
c.zoom.default = "250%"

config.bind(',d', 'download-open evince')
config.bind(',j', 'config-cycle -p content.javascript.enabled')
config.bind(',p', 'config-cycle -p content.proxy socks://localhost:8080 system')
config.bind(';x', 'hint links spawn -d mpv {hint-url}')
config.bind(';X', 'hint links fill :spawn {hint-url}')

config.bind('<Ctrl-F>', 'fake-key <Right>', mode='insert')
config.bind('<Ctrl-B>', 'fake-key <Left>', mode='insert')
config.bind('<Ctrl-N>', 'fake-key <Down>', mode='insert')
config.bind('<Ctrl-P>', 'fake-key <Up>', mode='insert')
config.bind('<Ctrl-W>', 'fake-key <Ctrl-Backspace', mode='insert')
config.bind('<Alt-D>', 'fake-key <Ctrl-Delete>', mode='insert')
config.bind('<Alt-F>', 'fake-key <Ctrl-Right>', mode='insert')
config.bind('<Alt-B>', 'fake-key <Ctrl-Left>', mode='insert')
config.bind('<Ctrl-A>', 'fake-key <Ctrl-Home>', mode='insert')
config.bind('<Ctrl-E>', 'fake-key <Ctrl-End>', mode='insert')
config.bind('<Ctrl-Shift-I>', 'open-editor', mode='insert')
config.bind('<Ctrl-K>', 'fake-key <Shift-End> ;; fake-key <Delete>', mode='insert')

# solarized colors

base03 = "#002b36"
base02 = "#073642"
base01 = "#586e75"
base00 = "#657b83"
base0 = "#839496"
base1 = "#93a1a1"
base2 = "#eee8d5"
base3 = "#fdf6e3"
yellow = "#b58900"
orange = "#cb4b16"
red = "#dc322f"
magenta = "#d33682"
violet = "#6c71c4"
blue = "#268bd2"
cyan = "#2aa198"
green = "#859900"

c.colors.completion.category.bg = base3
c.colors.completion.category.border.bottom = base3
c.colors.completion.category.border.top = base3
c.colors.completion.category.fg = base00
c.colors.completion.even.bg = base3
c.colors.completion.fg = base00
c.colors.completion.item.selected.bg = base2
c.colors.completion.item.selected.border.bottom = base2
c.colors.completion.item.selected.border.top = base2
c.colors.completion.item.selected.fg = base00
c.colors.completion.match.fg = red
c.colors.completion.odd.bg = base3
c.colors.completion.scrollbar.bg = base3
c.colors.completion.scrollbar.fg = base00
c.colors.downloads.bar.bg = base3
c.colors.downloads.error.bg = base3
c.colors.downloads.error.fg = red
c.colors.downloads.start.bg = base3
c.colors.downloads.start.fg = base1
c.colors.downloads.stop.bg = base3
c.colors.downloads.stop.fg = base00
c.colors.hints.bg = base3
c.colors.hints.fg = base00
c.colors.hints.match.fg = red
c.colors.keyhint.bg = base3
c.colors.keyhint.fg = base00
c.colors.keyhint.suffix.fg = cyan
c.colors.messages.error.bg = base3
c.colors.messages.error.border = base3
c.colors.messages.error.fg = red
c.colors.messages.info.bg = base3
c.colors.messages.info.border = base3
c.colors.messages.info.fg = base1
c.colors.messages.warning.bg = base3
c.colors.messages.warning.border = base3
c.colors.messages.warning.fg = orange
c.colors.statusbar.caret.bg = base3
c.colors.statusbar.caret.fg = violet
c.colors.statusbar.caret.selection.bg = base3
c.colors.statusbar.caret.selection.fg = violet
c.colors.statusbar.command.bg = base3
c.colors.statusbar.command.fg = base00
c.colors.statusbar.command.private.bg = base03
c.colors.statusbar.command.private.fg = base0
c.colors.statusbar.insert.bg = base3
c.colors.statusbar.insert.fg = cyan
c.colors.statusbar.normal.bg = base3
c.colors.statusbar.normal.fg = base00
c.colors.statusbar.passthrough.bg = base3
c.colors.statusbar.passthrough.fg = blue
c.colors.statusbar.private.bg = base03
c.colors.statusbar.private.fg = base0
c.colors.statusbar.progress.bg = base3
c.colors.statusbar.url.error.fg = red
c.colors.statusbar.url.fg = base00
c.colors.statusbar.url.success.http.fg = red
c.colors.statusbar.url.success.https.fg = base00
c.colors.statusbar.url.warn.fg = orange

monospace = "9pt Consolas"

c.fonts.completion.category = "bold " + monospace
c.fonts.completion.entry = monospace
c.fonts.downloads = monospace
c.fonts.hints = "bold " + monospace
c.fonts.keyhint = monospace
c.fonts.messages.error = monospace
c.fonts.messages.info = monospace
c.fonts.messages.warning = monospace
c.fonts.prompts = "10pt Segoe UI"
c.fonts.statusbar = monospace
c.fonts.web.family.fixed = "Consolas"
c.fonts.web.family.sans_serif = "Fontin Sans"
c.fonts.web.family.serif = "Fontin"
c.fonts.web.family.standard = "Fontin"

# -*- python-indent-offset: 2 -*-
