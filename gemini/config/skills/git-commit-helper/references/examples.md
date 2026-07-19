# Git Commit Examples

## Good Example

```text
✨ Add VoiceController for shared processing logic

* Implement core state machine for handling voice input states.
* Decouple audio processing from UI layers to improve testability.
* Add support for noise cancellation in commonMain.
```

## Another Good Example (Fix)

```text
✨ Fix race condition in CommandProcessor init

* Ensure singleton instance is thread-safe using atomic references.
* Resolve intermittent crash when multiple services start simultaneously.
```

## Bad Example (Too Long Summary)

```text
✨ Refactor the entire shared module to support the new voice recognition engine which is much faster than the old one
```
*Issue: Summary is 112 characters (max 50).*

## Bad Example (No Sparkle)

```text
Update gradle dependencies

* Bump Kotlin to 2.0.0
```
*Issue: Summary must start with "✨ ".*

## Bad Example (No Blank Line)

```text
✨ Update gradle dependencies
* Bump Kotlin to 2.0.0
```
*Issue: Missing blank line between summary and body.*
