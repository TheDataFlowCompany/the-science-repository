# `.claude/` — LLM permissions

When you use Claude Code (CLI or VS Code extension) inside this repo, it reads [`settings.json`](settings.json) and respects the `permissions.deny` rules. This is the **second line of defense** for keeping real data out of the LLM's reach.

The first line is the VS Code workspace file (`the-science-repository.llm.code-workspace`), which simply hides `data/raw/` and `data/processed/` from the editor.

## What's denied

- `Read` / `Glob` / `Grep` on `data/raw/**` and `data/processed/**`.
- `Bash` calls that try to `cat`/`head`/`less` files under those paths.

If you genuinely need the assistant to see real data for a specific task, edit `settings.json` for that session only and revert. Or — better — generate richer mock data so you don't have to.

## For other assistants

- **Cursor / Continue / Copilot:** these honour `.cursorignore` / `.continueignore` / VS Code's `files.exclude`. The workspace file already excludes the sensitive folders, so any editor-integrated LLM that respects the workspace will not see them.
- **ChatGPT / web LLMs:** there is no enforcement. Don't paste raw data into a chat window.
