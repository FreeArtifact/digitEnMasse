# Blithedale Regex Steps

1. Wrap everything in p
- Find: `(.*)`
- Replace: `<p>\0</p>`
2. Wrap chapters and titles (use of \n just to keep things tidy)
- Enable: Case-sensitive
- Find: `\n\n\n^<p>([A-Z]+\..+)</p>`
- Replace: `</chapter>\n\n\n<chapter>\n<title>\1</title>`
- Clean-up: Close very last chapter and delete vestigial close tag @ above first chapter
3. Wrap quotations
- Enable: Dot matches all
- Find: `"(.+?)"`
- Replace: `<quote>\1</quote>`
4. Realize I messed up the p
- Find: `\n{2}`
- Replace: `\n</p>\n\n<p>`
- Manual: add closer
5. Fix p on chapter
- Find: `<p>(\n<chapter>.+?)</p>`
- Replace: `\1`
6. Wrap xml:
- Find: `.*`
- Replace: `<book>\0</book>`
