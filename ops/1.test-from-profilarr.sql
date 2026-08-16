-- @operation: export
-- @entity: batch
-- @name: Test from Profilarr
-- @exportedAt: 2026-08-16T21:15:25.536Z
-- @opIds: 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238

-- --- BEGIN op 227 ( update quality_profile "Fake test" )
update "quality_profiles" set "name" = 'Fake test' where "name" = 'Fake';
-- --- END op 227

-- --- BEGIN op 228 ( update custom_format "Fake test" )
update "custom_formats" set "name" = 'Fake test' where "name" = 'Fake';
-- --- END op 228

-- --- BEGIN op 229 ( update custom_format "Fake test" )
update "custom_formats" set "name" = 'Fake test' where "name" = 'Fake';
-- --- END op 229

-- --- BEGIN op 230 ( update custom_format "Fake tes" )
update "custom_formats" set "name" = 'Fake tes' where "name" = 'Fake';
-- --- END op 230

-- --- BEGIN op 231 ( update custom_format "FakeTest" )
update "custom_formats" set "name" = 'FakeTest' where "name" = 'Fake';
-- --- END op 231

-- --- BEGIN op 232 ( update regular_expression "fake test" )
update "regular_expressions" set "name" = 'fake test' where "name" = 'fake';
-- --- END op 232

-- --- BEGIN op 233 ( update regular_expression "fake test" )
update "regular_expressions" set "name" = 'fake test' where "name" = 'fake';
-- --- END op 233

-- --- BEGIN op 234 ( update custom_format "Fake2" )
update "custom_formats" set "name" = 'Fake2' where "name" = 'Fake';
-- --- END op 234

-- --- BEGIN op 235 ( update quality_profile "Fake" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = 'Fake'
  AND custom_format_name = 'Fake'
  AND arr_type = 'radarr'
  AND score = 50000;
-- --- END op 235

-- --- BEGIN op 236 ( update quality_profile "Fake" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = 'Fake'
  AND custom_format_name = 'Fake'
  AND arr_type = 'sonarr'
  AND score = 50000;
-- --- END op 236

-- --- BEGIN op 237 ( update quality_profile "Fake" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = 'Fake'
  AND custom_format_name = 'Fake'
  AND arr_type = 'radarr'
  AND score = 50000;
-- --- END op 237

-- --- BEGIN op 238 ( update quality_profile "Fake" )
DELETE FROM quality_profile_custom_formats
WHERE quality_profile_name = 'Fake'
  AND custom_format_name = 'Fake'
  AND arr_type = 'sonarr'
  AND score = 50000;
-- --- END op 238
