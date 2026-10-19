# Git Commit Examples

## Good Example (Gemini CLI with Gemini)

```text
✨ Add VoiceController for shared processing logic

* Implement core state machine for handling voice input states.
* Decouple audio processing from UI layers to improve testability.
* Add support for noise cancellation in commonMain.
```

## Another Good Example (Antigravity with Opus)

```text
✨✴️ Fix CommandProcessor initialization race

* Ensure singleton instance is thread-safe using atomic references.
* Resolve intermittent crash when multiple services start simultaneously.
```

## Good Example (Codex with an OpenAI Model)

```text
⌬ Add shared skill installation

* Make shared skills available to both Gemini and Codex.
```

## Prefix Examples

| Harness | Model | Prefix |
| --- | --- | --- |
| Gemini CLI | Gemini | ✨ |
| Antigravity | Opus | ✨✴️ |
| Claude Code | Sonnet | ✴️ |
| Codex | OpenAI GPT model | ⌬ |
| Codex | Claude | ⌬✴️ |
| Claude Code | Gemini | ✴️✨ |
| Codex | Unknown | ⌬🤖 |
| Unknown | Gemini | 🤖✨ |
| Unknown | Unknown | 🤖 |

## Bad Example (Too Long Summary)

```text
✨ Refactor the entire shared module to support the new voice recognition engine which is much faster than the old one
```
*Issue: Summary exceeds 50 characters, including the prefix.*

## Bad Example (No AI Prefix)

```text
Update gradle dependencies

* Bump Kotlin to 2.0.0
```
*Issue: Summary must start with the current harness/model prefix and a space.*

## Bad Example (Duplicate Family Symbols)

For Codex with an OpenAI model:

```text
⌬⌬ Update dependencies
```
*Issue: Matching symbols must collapse to a single `⌬`.*

## Bad Example (Reversed Harness/Model Order)

For Antigravity with Opus:

```text
✴️✨ Update dependencies
```
*Issue: Harness comes first, so the prefix must be `✨✴️`.*

## Bad Example (No Blank Line)

```text
✨ Update gradle dependencies
* Bump Kotlin to 2.0.0
```
*Issue: Missing blank line between summary and body.*
