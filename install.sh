#!/usr/bin/env bash
set -euo pipefail

script_dir="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
skills_dir="$script_dir/gemini/config/skills"

usage() {
    printf 'Usage: %s [all|gemini|codex]\n' "$0"
}

install_skills() {
    local destination="$1"
    local skill target

    # Repair a dangling directory link left by an earlier installation.
    if [[ -L "$destination" && ! -e "$destination" ]]; then
        ln -sfn "$skills_dir" "$destination"
    fi
    mkdir -p "$destination"

    for skill in "$skills_dir"/*; do
        [[ -f "$skill/SKILL.md" ]] || continue
        target="$destination/$(basename -- "$skill")"

        if [[ "$skill" -ef "$target" ]]; then
            printf 'Already installed: %s\n' "$target"
        elif [[ -L "$target" ]]; then
            ln -sfn "$skill" "$target"
            printf 'Updated: %s\n' "$target"
        elif [[ -e "$target" ]]; then
            printf 'Cannot replace existing path: %s\n' "$target" >&2
            return 1
        else
            ln -s "$skill" "$target"
            printf 'Installed: %s\n' "$target"
        fi
    done
}

if [[ $# -gt 1 ]]; then
    usage >&2
    exit 1
fi

case "${1:-all}" in
    all)
        install_skills "$HOME/.gemini/config/skills"
        install_skills "$HOME/.agents/skills"
        ;;
    gemini) install_skills "$HOME/.gemini/config/skills" ;;
    codex) install_skills "$HOME/.agents/skills" ;;
    -h|--help) usage ;;
    *) usage >&2; exit 1 ;;
esac
