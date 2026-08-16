-- @operation: export
-- @entity: batch
-- @name: Add quality profile 2160p Efficient - VO / VOSTFR
-- @exportedAt: 2026-08-16T22:05:18.000Z
-- @opIds: 113

-- --- BEGIN op 113 ( Add quality profile 2160p Efficient - VO / VOSTFR )
INSERT INTO "quality_profiles" ("name", "upgradeAllowed", "minFormatScore") VALUES ('2160p Efficient - VO / VOSTFR', 0, 2000);
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
-- --- END op 113
