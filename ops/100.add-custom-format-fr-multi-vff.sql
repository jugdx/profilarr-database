-- @operation: export
-- @entity: batch
-- @name: Add custom format FR - MULTi & VFF
-- @exportedAt: 2026-08-17T09:27:10.000Z
-- @opIds: 100

-- --- BEGIN op 100 ( Add custom format FR - MULTi & VFF )
INSERT INTO "regular_expressions" ("name", "pattern", "description") VALUES ('REG_fr-multi-vff', '(?i)(?=.*\b(MULTI|DUAL)\b)(?=.*\b(VFF|TRUEFRENCH|VF2|VOF|VOFR)\b)', '');
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('FR - MULTi & VFF', 'Must contain original audio and a VFF track.', 0);
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('FR - MULTi & VFF', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('FR - MULTi & VFF', 'Release Title', 'REG_fr-multi-vff');
-- --- END op 100
