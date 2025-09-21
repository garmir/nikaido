#!/usr/bin/env bash
# Test script for npx Claude Code with SuperClaude

echo "Testing npx Claude Code with SuperClaude..."

# Check if SuperClaude files exist
if [ -f "$HOME/.claude/CLAUDE.md" ]; then
    echo "✓ SuperClaude files found in ~/.claude/"
else
    echo "✗ SuperClaude files not found"
    exit 1
fi

# Run Claude Code with npx
echo "Running: npx @anthropic-ai/claude-code --version"
npx @anthropic-ai/claude-code --version

echo ""
echo "To use Claude Code with SuperClaude via npx:"
echo "  npx @anthropic-ai/claude-code"
echo ""
echo "SuperClaude framework will be automatically loaded from ~/.claude/"
