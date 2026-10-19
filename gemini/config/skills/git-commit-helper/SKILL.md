---
name: git-commit-helper
description: Generates git commit messages with harness/model AI symbols and a 50/75 format. Use when asked to write, prepare, amend, or execute a git commit.
---

# Git Commit Helper

This skill ensures git commit messages are professional, concise, and follow a 50/75 format while highlighting the "why" behind changes.

## Workflow

When asked to prepare or write a git commit message:

1.  **Gather Information**: Run `git status` and `git diff HEAD` (or `git diff --staged` if changes are already staged) to understand the scope of changes. When rewriting an existing commit message, inspect that commit's diff with `git show`.
2.  **Analyze**: Identify the primary purpose of the change. Focus on architectural shifts, bug fixes, or new features. Avoid describing obvious code changes (e.g., "changed variable name").
3.  **Draft**: Determine the current harness and model symbols using the rules below, then generate the commit message following the constraints.
4.  **Review**: Ensure the message matches the 50/75 character limits and uses bullet points for major changes.

## AI Symbols

Map the current harness (the application running the agent) and the model independently to their AI families:

| AI family | Symbol | Harness examples | Model examples |
| --- | --- | --- | --- |
| Gemini / Google | ✨ | Gemini CLI, Antigravity | Gemini |
| Claude / Anthropic | ✴️ | Claude Code | Claude, Opus, Sonnet, Haiku |
| OpenAI / ChatGPT | ⌬ | Codex, ChatGPT | OpenAI GPT models, OpenAI o-series models |
| Miscellaneous or unknown AI | 🤖 | Other or unknown harness | Other or unknown model |

- Use the available session context to identify each family. Do not infer the harness or model from the skill's directory, repository name, or previous commit prefixes.
- If both map to the same symbol, use that symbol once.
- If they map to different symbols, concatenate them in **harness then model** order, with no space between them.
- Follow the resulting prefix with one space before the summary. For example, Antigravity with Opus uses `✨✴️ `; Codex with an OpenAI model uses `⌬ `.
- Use `🤖` for each unknown or miscellaneous component, applying the same collapsing rule. For example, Codex with an unknown model uses `⌬🤖 `; both unknown uses `🤖 `.

## Message Format Constraints

-   **Line 1 (Summary)**: Maximum 50 characters, including the AI prefix and following space. Start with the prefix determined above, followed by a capitalized verb in the imperative mood (e.g., "⌬ Add", "✨✴️ Fix"). No trailing period.
-   **Line 2**: Must be blank.
-   **Body**: 
    -   Use bullet points (`* `) to highlight major changes.
    -   Each line must not exceed 75 characters.
    -   Focus on **why** the change was made and any high-level "how" that isn't immediately obvious from the code.
    -   Keep it professional and concise.

## Examples

See [references/examples.md](references/examples.md) for concrete examples of good and bad commit messages.

## Guidelines

-   **Imperative Mood**: Use "Fix bug" instead of "Fixed bug" or "Fixes bug".
-   **Surgicality**: If the diff contains unrelated changes, suggest splitting the commit or mention why they are grouped.
-   **No Secrets**: Never include API keys, passwords, or PII in commit messages.
