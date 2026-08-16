-- @operation: export
-- @entity: batch
-- @name: Add quality profile 2160p Efficient - MULTi VFF
-- @exportedAt: 2026-08-16T22:05:18.000Z
-- @opIds: 112

-- --- BEGIN op 112 ( Add quality profile 2160p Efficient - MULTi VFF )
INSERT INTO "quality_profiles" ("name", "upgradeAllowed", "minFormatScore") VALUES ('2160p Efficient - MULTi VFF', 0, 10000);
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
-- --- END op 112
