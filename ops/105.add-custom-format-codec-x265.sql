-- @operation: export
-- @entity: batch
-- @name: Add custom format Codec - x265 / HEVC
-- @exportedAt: 2026-08-17T09:07:50.000Z
-- @opIds: 105

-- --- BEGIN op 105 ( Add custom format Codec - x265 / HEVC )
INSERT INTO "regular_expressions" ("name", "pattern", "description") VALUES ('REG_codec-x265', '(?i)\b(x265|HEVC|H\.?265)\b', '');
INSERT INTO "custom_formats" ("name", "description") VALUES ('Codec - x265 / HEVC', 'Target compression standard.');
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('Codec - x265 / HEVC', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('Codec - x265 / HEVC', 'Release Title', 'REG_codec-x265');
-- --- END op 105
