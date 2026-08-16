-- @operation: export
-- @entity: batch
-- @name: Add quality profile 1080p Quality HDR - VO / VOSTFR
-- @exportedAt: 2026-08-16T22:05:18.000Z
-- @opIds: 111

-- --- BEGIN op 111 ( Add quality profile 1080p Quality HDR - VO / VOSTFR )
INSERT INTO "quality_profiles" ("name", "upgradeAllowed", "minFormatScore") VALUES ('1080p Quality HDR - VO / VOSTFR', 0, 2000);
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
-- --- END op 111
