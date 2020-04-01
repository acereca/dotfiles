# Qutebrowser Config
# Patrick Nisble
# github.com/acereca
#
# Last modified: 2018|05|16
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = '#24313f'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#DBCEC0'

# Font color for the matched part of hints.
# Type: QssColor
c.colors.hints.match.fg = 'red'

# Background color of the keyhint widget.
# Type: QssColor
c.colors.keyhint.bg = 'gray'

c.colors.tabs.selected.odd.bg = '#24313f'
c.colors.tabs.selected.even.bg = '#24313f'
# Default encoding to use for websites. The encoding must be a string
# describing an encoding such as _utf-8_, _iso-8859-1_, etc.
# Type: String
c.content.default_encoding = 'utf-8'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'bold 8pt monospace'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '12pt Droid Sans Mono for Powerline'

# Font used for the hints.
# Type: Font
c.fonts.hints = 'bold 12pt monospace'

# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = '"Droid Sans Mono for Powerline",Terminal'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '12pt monospace'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '12pt monospace'

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'about:blank'

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "gh": "https://github.com/search?q={}",
    "arch": "https://wiki.archlinux.org/index.php?search={}"
}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = '/home/patrick/gitlab/start/index.html'

config.bind('<Ctrl-f>', 'hint links spawn /home/patrick/github/scripts/mmq.zsh {hint-url}')
config.bind('<Ctrl-d>', 'hint links spawn mpv {hint-url}')
config.unbind('f')
config.bind('f', 'hint links userscript /home/patrick/github/scripts/select.url.py')

config.bind('<Ctrl-space>', 'spawn sshfs+keepmenu')

