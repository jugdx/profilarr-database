-- @operation: export
-- @entity: batch
-- @name: Add custom format Quality - 10bit HDR
-- @exportedAt: 2026-08-17T09:27:10.000Z
-- @opIds: 106

-- --- BEGIN op 106 ( Add custom format Quality - 10bit HDR )
INSERT INTO "regular_expressions" ("name", "pattern", "description") VALUES ('REG_quality-10bit-hdr', '(?i)\b(10[\.\-_]?bit|HDR|HDR10|DV|Dolby[\.\-_]?Vision)\b', '');
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('Quality - 10bit HDR', '10-bit / HDR / DV mastering.', 0);
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('Quality - 10bit HDR', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('Quality - 10bit HDR', 'Release Title', 'REG_quality-10bit-hdr');
-- --- END op 106
