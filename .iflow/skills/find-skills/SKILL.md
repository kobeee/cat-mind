---
name: find-skills
description: Helps users discover and install agent skills from the open skills ecosystem (skills.sh)
---

# find-skills

This skill helps you discover and install skills from the open agent skills ecosystem.

## When to use

Use this skill when the user:
- Asks "how do I do X" where X might be a common task with an existing skill
- Says "find a skill for X" or "is there a skill for X"
- Asks "can you do X" where X is a specialized capability
- Expresses interest in extending agent capabilities
- Wants to search for tools, templates, or workflows

## Key commands

- `npx skills find [query]` - Search for skills interactively or by keyword
- `npx skills add <package>` - Install a skill from GitHub or other sources
- `npx skills check` - Check for skill updates
- `npx skills update` - Update all installed skills

## Browse skills

Visit https://skills.sh/ to browse available skills.

## Installation

To install a found skill globally:
```
npx skills add <owner/repo@skill> -g -y
```

The `-g` flag installs globally (user-level) and `-y` skips confirmation prompts.

## Common categories

| Category | Example Queries |
|----------|----------------|
| Web Development | react, nextjs, typescript, css, tailwind |
| Testing | testing, jest, playwright, e2e |
| DevOps | deploy, docker, kubernetes, ci-cd |
| Documentation | docs, readme, changelog, api-docs |
| Code Quality | review, lint, refactor, best-practices |
| Design | ui, ux, design-system, accessibility |
| Productivity | workflow, automation, git |

## Tips

- **Use specific keywords**: "react testing" is better than just "testing"
- **Try alternative terms**: If "deploy" doesn't work, try "deployment" or "ci-cd"
- **Check popular sources**: Many skills come from `vercel-labs/agent-skills` or `ComposioHQ/awesome-claude-skills`
