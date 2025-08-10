# 🎯 Agent Selection Guide

## Quick Decision Tree

```
Need AI assistance?
    │
    ├─→ Production/Critical System?
    │   └─→ Use: gemini-gpt-hybrid-soft ✅
    │
    ├─→ Experimental/Prototype?
    │   └─→ Use: gemini-gpt-hybrid-hard ⚡
    │
    ├─→ Just need Gemini?
    │   └─→ Use: gemini-codebase-explorer 🔷
    │
    └─→ Just need GPT?
        └─→ Use: chatgpt5-code-explorer 🟦
```

## Detailed Selection Criteria

### Use `gemini-gpt-hybrid-soft` when:
✅ Working on production code  
✅ Need maximum safety  
✅ Want AI insights but human implementation  
✅ Dealing with critical systems  
✅ Need consistent code style  
✅ Want full control over changes  
✅ Working in team environment  
✅ Need audit trail of changes  

**Example Use Cases:**
- "Analyze security vulnerabilities and I'll fix them"
- "Find performance bottlenecks for me to optimize"
- "Review architecture and suggest improvements"

### Use `gemini-gpt-hybrid-hard` when:
⚡ Rapid prototyping needed  
⚡ Working on experimental branch  
⚡ Have solid backups/version control  
⚡ Need massive automated refactoring  
⚡ Creating throwaway code  
⚡ Time is more important than perfection  
⚡ Comfortable with AI autonomy  
⚡ Ready to review/revert if needed  

**Example Use Cases:**
- "Refactor entire codebase to TypeScript NOW"
- "Generate complete CRUD API automatically"
- "Fix all linting errors across the project"

### Use `gemini-codebase-explorer` when:
🔷 Need massive context window  
🔷 Analyzing entire repositories  
🔷 Want Gemini specifically  
🔷 Cross-file pattern detection  
🔷 Comprehensive documentation generation  

### Use `chatgpt5-code-explorer` when:
🟦 Need rapid iterations  
🟦 Want GPT specifically  
🟦 Focused on specific files  
🟦 Interactive debugging  
🟦 Quick fixes  

## Risk Matrix

| Agent | Risk Level | Recovery Method | Recommended For |
|-------|------------|-----------------|-----------------|
| **Soft** | None ✅ | N/A | All users, Production |
| **Hard** | High ⚠️ | Git reset | Advanced users only |
| **Gemini** | Low 🟡 | Manual revert | Analysis tasks |
| **GPT** | Low 🟡 | Manual revert | Focused tasks |

## Pre-flight Checklist

### Before using SOFT mode:
- [ ] Understand the problem
- [ ] Have test cases ready
- [ ] Know acceptance criteria

### Before using HARD mode:
- [ ] Git commit all changes
- [ ] Create experimental branch
- [ ] Have rollback plan
- [ ] Understand the risks
- [ ] Ready to review all changes
- [ ] Have test suite ready

## Command Examples

### SOFT Mode (Safe)
```bash
# Analysis only, Claude implements
@gemini-gpt-hybrid-soft analyze and find all security issues

# Result: Analysis report → Claude fixes issues safely
```

### HARD Mode (Aggressive)
```bash
# First, backup everything
git add -A && git commit -m "Before AI rampage"
git checkout -b ai-experimental

# Then let AI modify directly
@gemini-gpt-hybrid-hard refactor everything to use async/await

# Review what happened
git diff main
```

## Emergency Recovery

If HARD mode causes issues:

```bash
# View damage
git status
git diff

# Full recovery
git reset --hard HEAD
git checkout main
git branch -D ai-experimental

# Partial recovery
git checkout HEAD -- specific-file.js
git restore --staged .
```

## Final Recommendations

1. **Start with SOFT**: Always try soft mode first
2. **Graduate to HARD**: Only when comfortable and safe
3. **Use specialized agents**: When you need specific AI
4. **Keep backups**: Always, but especially for hard mode
5. **Review changes**: Even in soft mode, review Claude's work
6. **Test everything**: Automated tests are your friend

---

**Remember**: With great power comes great responsibility. The HARD mode is powerful but dangerous. The SOFT mode is safe but requires more interaction. Choose wisely based on your needs and risk tolerance.