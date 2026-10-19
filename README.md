# amu-configs-llm
my configs for llms

Run the installer from any working directory, regardless of the checkout's name
or location:

```sh
bash /path/to/checkout/install.sh
```

By default it installs the shared skills for both Gemini and Codex. To install
for just one tool, pass `gemini` or `codex`:

```sh
bash /path/to/checkout/install.sh codex
```

Skills are symlinked from `skills` into
`~/.gemini/config/skills` for Gemini and `~/.agents/skills` for Codex, following
[Codex's user skill discovery convention](https://learn.chatgpt.com/docs/build-skills#where-codex-loads-local-skills).
Keep the checkout in place; rerun the installer after moving it to update the
links. Repeated runs are safe, unrelated skills are preserved, and existing
files or directories with the same skill name are left untouched with an error.
