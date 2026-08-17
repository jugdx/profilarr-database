-- @operation: export
-- @entity: batch
-- @name: Add custom format Teams - Light HQ
-- @exportedAt: 2026-08-17T09:07:50.000Z
-- @opIds: 107

-- --- BEGIN op 107 ( Add custom format Teams - Light HQ )
INSERT INTO "regular_expressions" ("name", "pattern", "description") VALUES ('REG_teams-light-hq', '(?i)\b(QxR|Tigole|Silence|PSA|QTZ|d3g|UTR|Edge2020|Vyndros)\b', '');
INSERT INTO "custom_formats" ("name", "description") VALUES ('Teams - Light HQ', 'Reference release groups.');
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('Teams - Light HQ', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('Teams - Light HQ', 'Release Title', 'REG_teams-light-hq');
-- --- END op 107
