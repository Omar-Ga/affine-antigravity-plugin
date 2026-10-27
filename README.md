# AFFiNE Antigravity Plugin

An all-in-one Antigravity plugin bundling the **AFFiNE Dual-MCP Architecture**: combining semantic vector search and real-time knowledge retrieval (`affine-search`) with rich authoring, database management, and canvas manipulation (`affine-actions`), pre-configured with rules and skills.

---

## 🤖 Ask Your AI Agent to Install It

If you are using Antigravity, OpenCode, Claude Code, or any coding agent, copy and paste this single prompt to your AI agent:

> "Clone https://github.com/Omar-Ga/affine-antigravity-plugin.git and install it as an Antigravity plugin for me by running `agy plugin install ./affine-antigravity-plugin` (or executing `./install.sh`), then verify with `agy plugin list`."

---

## ⚡ Quick Manual Installation

### Option 1: Using the Antigravity CLI (`agy`) (Recommended)

```bash
git clone https://github.com/Omar-Ga/affine-antigravity-plugin.git
cd affine-antigravity-plugin
agy plugin install .
```

### Option 2: Using the Included Installer Script

```bash
git clone https://github.com/Omar-Ga/affine-antigravity-plugin.git
cd affine-antigravity-plugin
chmod +x install.sh
./install.sh
```

To install only for a specific workspace project instead of globally:
```bash
./install.sh --workspace /path/to/your/workspace
```

### Option 3: Manual Folder Copy

- **Global**: Copy this repository folder to `~/.gemini/config/plugins/affine`
- **Workspace-scoped**: Copy this repository folder to `<your-project>/.agents/plugins/affine`

> **Note**: After installing, restart Antigravity (or your language server) so the plugin directory is loaded.

---

## 🔍 Verification

Verify that the plugin is detected and valid:

```bash
# Validate plugin structure and configuration
agy plugin validate .

# Check installed plugins
agy plugin list
```

Expected output for validate:
```
✔ Validation passed
```

---

## 🧠 What's Included

| Component | Path | Description |
| :--- | :--- | :--- |
| **Manifest** | [`plugin.json`](plugin.json) | Plugin metadata, name, display name, and suggested prompts |
| **MCP Servers** | [`mcp_config.json`](mcp_config.json) | Pre-configured Dual-MCP servers (`affine-search` and `affine-actions`) |
| **Protocol Rules** | [`rules/AGENTS.md`](rules/AGENTS.md) | Enforces the 3-step operational protocol: Discover & Locate ➔ Modify & Create ➔ Verify |
| **Skills** | [`skills/affine/SKILL.md`](skills/affine/SKILL.md) | Progressive skill for AI agents on AFFiNE tool execution and data modeling |

---

## 🛠️ Dual-MCP Architecture

This plugin binds two complementary MCP servers into a single workflow:

1. **`affine-search` (Read & Search Half)**
   - Type: Streamable HTTP endpoint connected directly to the AFFiNE workspace.
   - Tools: `doc_search` (vector search), `read_document`.
   - Used first on any question or context check.

2. **`affine-actions` (Authoring & Modification Half)**
   - Type: Stdio MCP Server running `affine-mcp-server` via `npx`.
   - Tools: `create_doc`, `create_doc_from_markdown`, `append_markdown`, `replace_doc_with_markdown`, `compose_database_from_intent`, `add_database_row`, `update_database_row`, `add_surface_element`, etc.

---

## 🔧 Connecting to a Different AFFiNE Workspace

The plugin ships pre-configured with the workspace credentials. To point it to another AFFiNE workspace:

1. Open [`mcp_config.json`](mcp_config.json)
2. Update `affine-search`:
   - Change workspace ID in `url` and `serverUrl`
   - Set your API token in `headers.Authorization: Bearer <TOKEN>`
3. Update `affine-actions`:
   - Change `AFFINE_WORKSPACE_ID`
   - Update `AFFINE_COOKIE` with your user ID and session cookies
