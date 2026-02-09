# Sandbox Testing Guide

## Prerequisites

- Windows 10/11 Pro or Enterprise
- Windows Sandbox feature enabled (`optionalfeatures.exe` > Windows Sandbox)

## Launch Sandbox

Double-click `launch-sandbox.cmd` (or run from terminal).

This generates a `.wsb` config and opens Windows Sandbox with the repo mapped to `C:\deepclean-cmd`.

| Sandbox Path | Host Path |
|---|---|
| `C:\deepclean-cmd` | Repo root (read/write) |
| `C:\results` | `tests/sandbox/results/` (read/write) |

## Test Steps

Once the sandbox desktop appears, open **Command Prompt as Administrator** and run:

```batch
cd C:\deepclean-cmd\src

:: Step 1 - Dry run (logs actions without executing)
deepclean.cmd /DRYRUN

:: Step 2 - Full run (sandbox is disposable, safe to run)
deepclean.cmd

:: Step 3 - Copy logs back to host
copy C:\deepclean-cmd\src\*.log C:\results\
```

## What to Verify

- [ ] Script starts without parsing errors (no `unexpected` or `not recognized` messages)
- [ ] Phase labels (STEP0 ~ STEP9) print in order
- [ ] `_backup_` folder is created with `registry/`, `folders/`, `files/` subdirectories
- [ ] Pressing N at first prompt exits cleanly
- [ ] Pressing N at Phase 7 prompt skips to Phase 8 (does not abort)
- [ ] Script reaches `Clean ASUS is done!` message

## Notes

- Sandbox has no ASUS software installed, so most removal commands will report "not found" -- this is expected
- The test validates **script structure and flow**, not actual cleanup results
- Sandbox is destroyed on close; no cleanup needed
- Networking is disabled in the sandbox config
