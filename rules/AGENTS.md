# AFFiNE Workspace Dual-MCP Protocol

This plugin uses a complementary dual-MCP architecture to manage AFFiNE documents, databases, and canvases. The two MCP servers are designed to operate together as a single unified system:

## 1. Unified Operational Roles

Treat the two MCP servers as two halves of a single AFFiNE toolchain:

- **The Read & Search Half (`affine-search`)**:
  - Exclusively handles knowledge retrieval, document reading, and workspace queries.
  - Primary tools: `doc_search` (fast semantic and keyword search via the native vector engine) and `read_document`.
  - Always use this half first to locate existing notes, verify context, or check document IDs before performing edits.

- **The Authoring & Modification Half (`affine-actions`)**:
  - Exclusively handles creation, writing, document editing, and structural changes.
  - Primary tools:
    - **Documents**: `create_doc`, `create_doc_from_markdown`, `append_markdown`, `replace_doc_with_markdown`, `append_semantic_section`, `update_doc_title`.
    - **Databases**: `compose_database_from_intent`, `add_database_row`, `update_database_row`, `add_database_column`, `update_table_cell`.
    - **Canvas & Whiteboards**: `add_surface_element`, `update_surface_element`, `update_edgeless_block`, `update_frame_children`.
    - **Organization**: `add_tag_to_doc`, `remove_tag_from_doc`, `create_collection`, `add_doc_to_collection`, `move_doc`.

## 2. Standard Workflow for Any AFFiNE Task

Whenever answering questions, taking notes, or editing content in AFFiNE:

1. **Discover & Locate**: Use `affine-search` (`doc_search` / `read_document`) to find the target document and its existing layout.
2. **Modify & Create**: Use `affine-actions` to append, rewrite, or construct tables/blocks.
3. **Verify**: Use `affine-search` (`read_document`) to ensure the changes synced cleanly and match expectations.

Do not attempt to search using external web scrapers or local filesystem tools for AFFiNE data—always use the `affine-search` + `affine-actions` MCP pair.
