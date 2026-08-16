-- @operation: export
-- @entity: batch
-- @name: Add custom format FR - VOSTFR
-- @exportedAt: 2026-08-16T22:05:18.000Z
-- @opIds: 102

-- --- BEGIN op 102 ( Add custom format FR - VOSTFR )
INSERT INTO "regular_expressions" ("name", "pattern") VALUES ('REG_fr-vostfr', '(?i)\b(VOST(\.|\-)?FR|SUB\.?FRENCH|STFR)\b');
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('FR - VOSTFR', 'Embedded or included French subtitles.', 0);
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('FR - VOSTFR', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('FR - VOSTFR', 'Release Title', 'REG_fr-vostfr');
-- --- END op 102
