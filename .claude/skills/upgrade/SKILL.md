---
name: upgrade
description: Use when releasing, publishing, tagging, or bumping the version of this Flutter package (snowflake_flutter_theme) — "update the version", "new version", "release", "publish", "bump version", "tag release", "prepare next version", "upgrade".
---

# Upgrade the Package Version

## Overview

Release workflow for this package. The `version:` in `pubspec.yaml` is `NAME+BUILD`
(e.g. `1.5.3+30`). A release **finishes** the current version (commit + tag it), then
**prepares** the next development version. Every finish/prepare commit bumps the build
number by exactly 1.

## Steps

1. **Ask the user.** Read the last released tag (NOT the pubspec version — pubspec is
   usually already bumped to the *prepared* next version):

   ```
   git tag --sort=-v:refname | head -1
   ```

   (Sort by version, not `git describe` — the newest tag may not be an ancestor of HEAD.)

   Call that `<LAST>`, then say verbatim:

   ```
   Last version is <LAST>
   New version?
   ```

   Wait for their answer — this is the release version to finish (`<REL>`).

2. **Finish** — *only if necessary*, i.e. only if pubspec's current NAME differs from
   `<REL>`. If pubspec is already at `<REL>`, skip to step 3.
   - Set `version:` to `<REL>+<BUILD+1>` in `pubspec.yaml`.
   - Commit: `finish <REL>`

3. **Tag** the release with the NAME only (no `+BUILD` suffix), then push the tag:
   ```
   git tag <REL>
   git push --tags origin
   ```

4. **Prepare next.** Default `<NEXT>` = patch+1 of `<REL>` (e.g. `1.5.3` → `1.5.4`).
   Confirm with the user first if a minor/major bump is intended (e.g. `1.5.x` → `1.6.0`).
   - Set `version:` to `<NEXT>+<BUILD+1>` in `pubspec.yaml`.
   - Commit: `prepare <NEXT>`

## Quick Reference

| Thing | Rule |
|-------|------|
| Version format | `NAME+BUILD`, e.g. `1.5.3+30` |
| Build number | +1 on **every** version-change commit (finish and prepare) |
| Tag | NAME only — `git tag 1.5.3`, never `1.5.3+30` |
| Finish commit msg | `finish <REL>` |
| Prepare commit msg | `prepare <NEXT>` |
| Pushing | Push **tags** after tagging (`git push --tags origin`). Do **not** push commits unless the user explicitly asks. |

**Worked example** starting from `1.5.1+28`, user answers `1.5.2`:
1. `finish 1.5.2` → `version: 1.5.2+29`
2. `git tag 1.5.2` then `git push --tags origin`
3. `prepare 1.5.3` → `version: 1.5.3+30`

## Common Mistakes

- Reporting "Last version is …" from `pubspec.yaml` instead of the last git tag — pubspec is usually already at the prepared next version.
- Forgetting to increment the build number.
- Tagging with the `+BUILD` suffix — the tag is the NAME only.
- Running the finish commit when pubspec is already at `<REL>` (it's conditional — "if necessary").
- Pushing tags/commits when the user only asked to bump the version.
