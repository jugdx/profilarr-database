-- @operation: export
-- @entity: batch
-- @name: Add custom format Tag - 4K Light / Light
-- @exportedAt: 2026-08-16T22:05:18.000Z
-- @opIds: 104

-- --- BEGIN op 104 ( Add custom format Tag - 4K Light / Light )
INSERT INTO "regular_expressions" ("name", "pattern") VALUES ('REG_tag-4k-light', '(?i)\b(4K[\.\-_ ]?Light|UHD[\.\-_ ]?Light|Light)\b');
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('Tag - 4K Light / Light', 'Explicit Light tag.', 0);
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('Tag - 4K Light / Light', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('Tag - 4K Light / Light', 'Release Title', 'REG_tag-4k-light');
-- --- END op 104
