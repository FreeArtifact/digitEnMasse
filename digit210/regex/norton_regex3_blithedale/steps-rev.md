# Blithedale Steps Revision

1. Wrap doc in book element
- Set: Dot-matches-all
- Find: `.*`
- Replace: `<book>\0</book>`
2. Wrap every chapter title in title (including table of contents)
- Set: Case-sensitive
- Find: `^\s+([IVXLC]+\..+?$)`
- Replace: `<title>\1</title>`
3. Wrap chapters
- Find: `(<title>.+)\n{2}`
- Replace: `</chapter>\n<chapter>\n\1\n`
- Cleanup: edit head and tail wrappers
4. Make room for <p> under title
- Find: `</title>`
- Replace: `\0]\n`
5. Create p tags
- Find: `\n\n`
- Replace: `</p>\n\n<p>`
- Manual: adjust p at end and start
6. More cleanup...for the p tags
- Find: `<p>(<title>.*</title>)</p>`
- Replace: `\1`
7. Quotes


mmmm
