-- @operation: export
-- @entity: batch
-- @name: Add custom format FR - VF Mono
-- @exportedAt: 2026-08-16T22:05:18.000Z
-- @opIds: 101

-- --- BEGIN op 101 ( Add custom format FR - VF Mono )
INSERT INTO "regular_expressions" ("name", "pattern") VALUES ('REG_fr-vf-mono', '(?i)\b(FRENCH|VF|VFF|TRUEFRENCH|VF2|VOF|VOFR)\b(?!.*\b(MULTI|DUAL)\b)');
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('FR - VF Mono', 'French track only (without MULTi).', 0);
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('FR - VF Mono', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('FR - VF Mono', 'Release Title', 'REG_fr-vf-mono');
-- --- END op 101
