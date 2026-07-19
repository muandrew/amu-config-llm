---
name: git-commit-helper
description: Generates git commit messages following the Vim standard (50/72 rule). Use when asked to write, prepare, or execute a git commit to ensure consistent, high-quality documentation of changes.
---

# Git Commit Helper

This skill ensures git commit messages are professional, concise, and follow the industry-standard "Vim" format while highlighting the "why" behind changes.

## Workflow

When asked to prepare or write a git commit message:

1.  **Gather Information**: Run `git status` and `git diff HEAD` (or `git diff --staged` if changes are already staged) to understand the scope of changes.
2.  **Analyze**: Identify the primary purpose of the change. Focus on architectural shifts, bug fixes, or new features. Avoid describing obvious code changes (e.g., "changed variable name").
3.  **Draft**: Generate the commit message following the constraints below.
4.  **Review**: Ensure the message matches the 50/75 character limits and uses bullet points for major changes.

## Message Format Constraints

-   **Line 1 (Summary)**: Maximum 50 characters. Start with a sparkle emoji and a space (✨ ), followed by a capitalized verb in the imperative mood (e.g., "✨ Add", "✨ Fix"). No trailing period.
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
