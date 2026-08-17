-- @operation: export
-- @entity: batch
-- @name: Add custom format FR - VFQ
-- @exportedAt: 2026-08-17T09:27:10.000Z
-- @opIds: 103

-- --- BEGIN op 103 ( Add custom format FR - VFQ )
INSERT INTO "regular_expressions" ("name", "pattern", "description") VALUES ('REG_fr-vfq', '\b(VFQ|VFI)\b', '');
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('FR - VFQ', 'Quebec dubbing (to be rejected).', 0);
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('FR - VFQ', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('FR - VFQ', 'Release Title', 'REG_fr-vfq');
-- --- END op 103
