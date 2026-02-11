# Mulan Steps File

1. Wrap every chunk in speech element
- Find: `\n\n`
- Replace: `\n</sp>\n<sp>\n`
- Edit: Add tag to start and end (for now)

2. Wrap everything in root element
- Find: `.*`
- Replace: `<screenplay>\0</screenplay>`
