# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*\.(context|mkiv) %{
    set-option buffer filetype context
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook global WinSetOption filetype=context %(
    require-module context
)

hook -group latex-highlight global WinSetOption filetype=context %{
    add-highlighter window/context ref context
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/context }
}

provide-module context %~

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter shared/context regions
add-highlighter shared/context/content default-region group
add-highlighter shared/context/comment region '(?<!\\)%' '\n' fill comment

# Scopes, starting with a backslash
add-highlighter shared/context/content/ regex '\\(?!_)\w+\b' 0:keyword
# Options passed to scopes, between brackets
add-highlighter shared/context/content/ regex '\\(?!_)\w+\b\[([^\]]+)\]' 1:value
# Options passed to commands in braces
add-highlighter shared/context/content/ regex '\\(?!_)\w+\b\{([^\}]+)\}' 1:value
# Content between dollar signs/pairs
add-highlighter shared/context/content/ regex '(\$(\\\$|[^$])+\$)|(\$\$(\\\$|[^$])+\$\$)' 0:meta
# Emphasized text
add-highlighter shared/context/content/ regex '\\(emph|textit)\{([^}]+)\}' 2:default+i
# Bold text
add-highlighter shared/context/content/ regex '\\textbf\{([^}]+)\}' 1:default+b
# Section headings
add-highlighter shared/context/content/ regex '\\(part|section)\*?\{([^}]+)\}' 2:title
add-highlighter shared/context/content/ regex '\\(chapter|(sub)+section|(sub)*paragraph)\*?\{([^}]+)\}' 4:header

~
