---
name: affine
description: Interact with AFFiNE workspaces using the dual-MCP architecture for semantic search, document reading, structured editing, databases, and whiteboards.
---

# AFFiNE Integration Skill

This skill guides the agent in managing AFFiNE workspaces using the complementary Dual-MCP toolchain.

## Architecture

The setup consists of two coordinated MCP servers:
1. **`affine-search`** (Read/Search): Fast semantic vector search and document retrieval directly from the AFFiNE workspace endpoint.
2. **`affine-actions`** (Authoring/Modification): Full document, table/database, and whiteboard creation/editing via `affine-mcp-server`.

## Strict 3-Step Execution Protocol

Whenever handling an AFFiNE request:

### 1. Discover & Locate (`affine-search`)
- Before modifying or answering questions about existing notes, search for relevant documents using `doc_search` or read a specific note using `read_document`.
- Identify the exact document ID (`docId`) or table structure needed.

### 2. Modify & Create (`affine-actions`)
- **Create Docs**: Use `create_doc` or `create_doc_from_markdown`.
- **Append / Edit Docs**: Use `append_markdown`, `append_semantic_section`, or `replace_doc_with_markdown`.
- **Databases**: Use `compose_database_from_intent` to define new databases, or `add_database_row` / `update_database_row` / `update_table_cell` for records.
- **Canvas / Whiteboards**: Use `add_surface_element`, `update_surface_element`, or `update_edgeless_block`.
- **Organization**: Use `add_tag_to_doc`, `create_collection`, or `move_doc`.

### 3. Verify (`affine-search`)
- Immediately call `read_document` on the target doc ID to confirm the update persisted cleanly and rendered as intended.
