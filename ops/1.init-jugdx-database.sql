-- @operation: export
-- @entity: batch
-- @name: Init JuGdx Light Database
-- @exportedAt: 2026-08-16T21:29:35.000Z
-- @opIds: 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035

-- --- BEGIN op 1000 ( insert regular_expression "REGEX_FR - MULTi & VFF" )
INSERT INTO "regular_expressions" ("name", "regular_expression") VALUES ('REGEX_FR - MULTi & VFF', '(?i)(?=.*\b(MULTI|DUAL)\b)(?=.*\b(VFF|TRUEFRENCH|VF2|VOF|VOFR)\b)');
-- --- END op 1000

-- --- BEGIN op 1001 ( insert custom_format "FR - MULTi & VFF" )
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('FR - MULTi & VFF', 'Must contain original audio and a VFF track.', 0);
-- --- END op 1001

-- --- BEGIN op 1002 ( insert custom_format_condition "FR - MULTi & VFF" )
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('FR - MULTi & VFF', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('FR - MULTi & VFF', 'Release Title', 'REGEX_FR - MULTi & VFF');
-- --- END op 1002

-- --- BEGIN op 1003 ( insert regular_expression "REGEX_FR - VF Mono" )
INSERT INTO "regular_expressions" ("name", "regular_expression") VALUES ('REGEX_FR - VF Mono', '(?i)\b(FRENCH|VF|VFF|TRUEFRENCH|VF2|VOF|VOFR)\b(?!.*\b(MULTI|DUAL)\b)');
-- --- END op 1003

-- --- BEGIN op 1004 ( insert custom_format "FR - VF Mono" )
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('FR - VF Mono', 'French track only (without MULTi).', 0);
-- --- END op 1004

-- --- BEGIN op 1005 ( insert custom_format_condition "FR - VF Mono" )
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('FR - VF Mono', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('FR - VF Mono', 'Release Title', 'REGEX_FR - VF Mono');
-- --- END op 1005

-- --- BEGIN op 1006 ( insert regular_expression "REGEX_FR - VOSTFR" )
INSERT INTO "regular_expressions" ("name", "regular_expression") VALUES ('REGEX_FR - VOSTFR', '(?i)\b(VOST(\.|\-)?FR|SUB\.?FRENCH|STFR)\b');
-- --- END op 1006

-- --- BEGIN op 1007 ( insert custom_format "FR - VOSTFR" )
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('FR - VOSTFR', 'Embedded or included French subtitles.', 0);
-- --- END op 1007

-- --- BEGIN op 1008 ( insert custom_format_condition "FR - VOSTFR" )
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('FR - VOSTFR', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('FR - VOSTFR', 'Release Title', 'REGEX_FR - VOSTFR');
-- --- END op 1008

-- --- BEGIN op 1009 ( insert regular_expression "REGEX_FR - VFQ" )
INSERT INTO "regular_expressions" ("name", "regular_expression") VALUES ('REGEX_FR - VFQ', '\b(VFQ|VFI)\b');
-- --- END op 1009

-- --- BEGIN op 1010 ( insert custom_format "FR - VFQ" )
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('FR - VFQ', 'Quebec dubbing (to be rejected).', 0);
-- --- END op 1010

-- --- BEGIN op 1011 ( insert custom_format_condition "FR - VFQ" )
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('FR - VFQ', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('FR - VFQ', 'Release Title', 'REGEX_FR - VFQ');
-- --- END op 1011

-- --- BEGIN op 1012 ( insert regular_expression "REGEX_Tag - 4K Light / Light" )
INSERT INTO "regular_expressions" ("name", "regular_expression") VALUES ('REGEX_Tag - 4K Light / Light', '(?i)\b(4K[\.\-_ ]?Light|UHD[\.\-_ ]?Light|Light)\b');
-- --- END op 1012

-- --- BEGIN op 1013 ( insert custom_format "Tag - 4K Light / Light" )
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('Tag - 4K Light / Light', 'Explicit Light tag.', 0);
-- --- END op 1013

-- --- BEGIN op 1014 ( insert custom_format_condition "Tag - 4K Light / Light" )
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('Tag - 4K Light / Light', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('Tag - 4K Light / Light', 'Release Title', 'REGEX_Tag - 4K Light / Light');
-- --- END op 1014

-- --- BEGIN op 1015 ( insert regular_expression "REGEX_Codec - x265 / HEVC" )
INSERT INTO "regular_expressions" ("name", "regular_expression") VALUES ('REGEX_Codec - x265 / HEVC', '(?i)\b(x265|HEVC|H\.?265)\b');
-- --- END op 1015

-- --- BEGIN op 1016 ( insert custom_format "Codec - x265 / HEVC" )
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('Codec - x265 / HEVC', 'Target compression standard.', 0);
-- --- END op 1016

-- --- BEGIN op 1017 ( insert custom_format_condition "Codec - x265 / HEVC" )
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('Codec - x265 / HEVC', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('Codec - x265 / HEVC', 'Release Title', 'REGEX_Codec - x265 / HEVC');
-- --- END op 1017

-- --- BEGIN op 1018 ( insert regular_expression "REGEX_Quality - 10bit HDR" )
INSERT INTO "regular_expressions" ("name", "regular_expression") VALUES ('REGEX_Quality - 10bit HDR', '(?i)\b(10[\.\-_]?bit|HDR|HDR10|DV|Dolby[\.\-_]?Vision)\b');
-- --- END op 1018

-- --- BEGIN op 1019 ( insert custom_format "Quality - 10bit HDR" )
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('Quality - 10bit HDR', '10-bit / HDR / DV mastering.', 0);
-- --- END op 1019

-- --- BEGIN op 1020 ( insert custom_format_condition "Quality - 10bit HDR" )
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('Quality - 10bit HDR', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('Quality - 10bit HDR', 'Release Title', 'REGEX_Quality - 10bit HDR');
-- --- END op 1020

-- --- BEGIN op 1021 ( insert regular_expression "REGEX_Teams - Light HQ" )
INSERT INTO "regular_expressions" ("name", "regular_expression") VALUES ('REGEX_Teams - Light HQ', '(?i)\b(QxR|Tigole|Silence|PSA|QTZ|d3g|UTR|Edge2020|Vyndros)\b');
-- --- END op 1021

-- --- BEGIN op 1022 ( insert custom_format "Teams - Light HQ" )
INSERT INTO "custom_formats" ("name", "description", "include_in_rename") VALUES ('Teams - Light HQ', 'Reference release groups.', 0);
-- --- END op 1022

-- --- BEGIN op 1023 ( insert custom_format_condition "Teams - Light HQ" )
INSERT INTO "custom_format_conditions" ("custom_format_name", "name", "type", "arr_type", "negate", "required") VALUES ('Teams - Light HQ', 'Release Title', 'release_title', 'all', 0, 1);
INSERT INTO "condition_patterns" ("custom_format_name", "condition_name", "regular_expression_name") VALUES ('Teams - Light HQ', 'Release Title', 'REGEX_Teams - Light HQ');
-- --- END op 1023

-- --- BEGIN op 1024 ( insert quality_profile "1080p Efficient - MULTi VFF" )
INSERT INTO "quality_profiles" ("name", "upgrades_allowed", "min_format_score") VALUES ('1080p Efficient - MULTi VFF', 0, 10000);
-- --- END op 1024

-- --- BEGIN op 1025 ( insert quality_profile_custom_formats "1080p Efficient - MULTi VFF" )
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'FR - MULTi & VFF', 'radarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'FR - MULTi & VFF', 'sonarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'FR - VF Mono', 'radarr', 10000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'FR - VF Mono', 'sonarr', 10000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'FR - VOSTFR', 'radarr', 0);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'FR - VOSTFR', 'sonarr', 0);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'FR - VFQ', 'radarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'FR - VFQ', 'sonarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'Tag - 4K Light / Light', 'radarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'Tag - 4K Light / Light', 'sonarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'Teams - Light HQ', 'radarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'Teams - Light HQ', 'sonarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'Codec - x265 / HEVC', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'Codec - x265 / HEVC', 'sonarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'Quality - 10bit HDR', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - MULTi VFF', 'Quality - 10bit HDR', 'sonarr', 2000);
-- --- END op 1025

-- --- BEGIN op 1026 ( insert quality_profile "1080p Efficient - VO / VOSTFR" )
INSERT INTO "quality_profiles" ("name", "upgrades_allowed", "min_format_score") VALUES ('1080p Efficient - VO / VOSTFR', 0, 2000);
-- --- END op 1026

-- --- BEGIN op 1027 ( insert quality_profile_custom_formats "1080p Efficient - VO / VOSTFR" )
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'FR - MULTi & VFF', 'radarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'FR - MULTi & VFF', 'sonarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'FR - VOSTFR', 'radarr', 5000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'FR - VOSTFR', 'sonarr', 5000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'FR - VF Mono', 'radarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'FR - VF Mono', 'sonarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'FR - VFQ', 'radarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'FR - VFQ', 'sonarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'Tag - 4K Light / Light', 'radarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'Tag - 4K Light / Light', 'sonarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'Teams - Light HQ', 'radarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'Teams - Light HQ', 'sonarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'Codec - x265 / HEVC', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'Codec - x265 / HEVC', 'sonarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'Quality - 10bit HDR', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Efficient - VO / VOSTFR', 'Quality - 10bit HDR', 'sonarr', 2000);
-- --- END op 1027

-- --- BEGIN op 1028 ( insert quality_profile "1080p Quality HDR - MULTi VFF" )
INSERT INTO "quality_profiles" ("name", "upgrades_allowed", "min_format_score") VALUES ('1080p Quality HDR - MULTi VFF', 0, 10000);
-- --- END op 1028

-- --- BEGIN op 1029 ( insert quality_profile_custom_formats "1080p Quality HDR - MULTi VFF" )
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'FR - MULTi & VFF', 'radarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'FR - MULTi & VFF', 'sonarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'FR - VF Mono', 'radarr', 10000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'FR - VF Mono', 'sonarr', 10000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'FR - VOSTFR', 'radarr', 0);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'FR - VOSTFR', 'sonarr', 0);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'FR - VFQ', 'radarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'FR - VFQ', 'sonarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'Tag - 4K Light / Light', 'radarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'Tag - 4K Light / Light', 'sonarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'Teams - Light HQ', 'radarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'Teams - Light HQ', 'sonarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'Codec - x265 / HEVC', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'Codec - x265 / HEVC', 'sonarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'Quality - 10bit HDR', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - MULTi VFF', 'Quality - 10bit HDR', 'sonarr', 2000);
-- --- END op 1029

-- --- BEGIN op 1030 ( insert quality_profile "1080p Quality HDR - VO / VOSTFR" )
INSERT INTO "quality_profiles" ("name", "upgrades_allowed", "min_format_score") VALUES ('1080p Quality HDR - VO / VOSTFR', 0, 2000);
-- --- END op 1030

-- --- BEGIN op 1031 ( insert quality_profile_custom_formats "1080p Quality HDR - VO / VOSTFR" )
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'FR - MULTi & VFF', 'radarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'FR - MULTi & VFF', 'sonarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'FR - VOSTFR', 'radarr', 5000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'FR - VOSTFR', 'sonarr', 5000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'FR - VF Mono', 'radarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'FR - VF Mono', 'sonarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'FR - VFQ', 'radarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'FR - VFQ', 'sonarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'Tag - 4K Light / Light', 'radarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'Tag - 4K Light / Light', 'sonarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'Teams - Light HQ', 'radarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'Teams - Light HQ', 'sonarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'Codec - x265 / HEVC', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'Codec - x265 / HEVC', 'sonarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'Quality - 10bit HDR', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('1080p Quality HDR - VO / VOSTFR', 'Quality - 10bit HDR', 'sonarr', 2000);
-- --- END op 1031

-- --- BEGIN op 1032 ( insert quality_profile "2160p Efficient - MULTi VFF" )
INSERT INTO "quality_profiles" ("name", "upgrades_allowed", "min_format_score") VALUES ('2160p Efficient - MULTi VFF', 0, 10000);
-- --- END op 1032

-- --- BEGIN op 1033 ( insert quality_profile_custom_formats "2160p Efficient - MULTi VFF" )
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'FR - MULTi & VFF', 'radarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'FR - MULTi & VFF', 'sonarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'FR - VF Mono', 'radarr', 10000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'FR - VF Mono', 'sonarr', 10000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'FR - VOSTFR', 'radarr', 0);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'FR - VOSTFR', 'sonarr', 0);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'FR - VFQ', 'radarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'FR - VFQ', 'sonarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'Tag - 4K Light / Light', 'radarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'Tag - 4K Light / Light', 'sonarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'Teams - Light HQ', 'radarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'Teams - Light HQ', 'sonarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'Codec - x265 / HEVC', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'Codec - x265 / HEVC', 'sonarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'Quality - 10bit HDR', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - MULTi VFF', 'Quality - 10bit HDR', 'sonarr', 2000);
-- --- END op 1033

-- --- BEGIN op 1034 ( insert quality_profile "2160p Efficient - VO / VOSTFR" )
INSERT INTO "quality_profiles" ("name", "upgrades_allowed", "min_format_score") VALUES ('2160p Efficient - VO / VOSTFR', 0, 2000);
-- --- END op 1034

-- --- BEGIN op 1035 ( insert quality_profile_custom_formats "2160p Efficient - VO / VOSTFR" )
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'FR - MULTi & VFF', 'radarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'FR - MULTi & VFF', 'sonarr', 15000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'FR - VOSTFR', 'radarr', 5000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'FR - VOSTFR', 'sonarr', 5000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'FR - VF Mono', 'radarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'FR - VF Mono', 'sonarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'FR - VFQ', 'radarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'FR - VFQ', 'sonarr', -50000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'Tag - 4K Light / Light', 'radarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'Tag - 4K Light / Light', 'sonarr', 3000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'Teams - Light HQ', 'radarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'Teams - Light HQ', 'sonarr', 2500);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'Codec - x265 / HEVC', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'Codec - x265 / HEVC', 'sonarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'Quality - 10bit HDR', 'radarr', 2000);
INSERT INTO "quality_profile_custom_formats" ("quality_profile_name", "custom_format_name", "arr_type", "score") VALUES ('2160p Efficient - VO / VOSTFR', 'Quality - 10bit HDR', 'sonarr', 2000);
-- --- END op 1035
