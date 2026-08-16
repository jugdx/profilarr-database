import os
import json
import shutil
from datetime import datetime, timezone

def escape_sql(text):
    return text.replace("'", "''")

# --- 1. CONFIGURATION ---
custom_formats = {
    "fr-multi-vff": {
        "name": "FR - MULTi & VFF",
        "description": "Must contain original audio and a VFF track.",
        "regex": "(?i)(?=.*\\b(MULTI|DUAL)\\b)(?=.*\\b(VFF|TRUEFRENCH|VF2|VOF|VOFR)\\b)"
    },
    "fr-vf-mono": {
        "name": "FR - VF Mono",
        "description": "French track only (without MULTi).",
        "regex": "(?i)\\b(FRENCH|VF|VFF|TRUEFRENCH|VF2|VOF|VOFR)\\b(?!.*\\b(MULTI|DUAL)\\b)"
    },
    "fr-vostfr": {
        "name": "FR - VOSTFR",
        "description": "Embedded or included French subtitles.",
        "regex": "(?i)\\b(VOST(\\.|\\-)?FR|SUB\\.?FRENCH|STFR)\\b"
    },
    "fr-vfq": {
        "name": "FR - VFQ",
        "description": "Quebec dubbing (to be rejected).",
        "regex": "\\b(VFQ|VFI)\\b"
    },
    "tag-4k-light": {
        "name": "Tag - 4K Light / Light",
        "description": "Explicit Light tag.",
        "regex": "(?i)\\b(4K[\\.\\-_ ]?Light|UHD[\\.\\-_ ]?Light|Light)\\b"
    },
    "codec-x265": {
        "name": "Codec - x265 / HEVC",
        "description": "Target compression standard.",
        "regex": "(?i)\\b(x265|HEVC|H\\.?265)\\b"
    },
    "quality-10bit-hdr": {
        "name": "Quality - 10bit HDR",
        "description": "10-bit / HDR / DV mastering.",
        "regex": "(?i)\\b(10[\\.\\-_]?bit|HDR|HDR10|DV|Dolby[\\.\\-_]?Vision)\\b"
    },
    "teams-light-hq": {
        "name": "Teams - Light HQ",
        "description": "Reference release groups.",
        "regex": "(?i)\\b(QxR|Tigole|Silence|PSA|QTZ|d3g|UTR|Edge2020|Vyndros)\\b"
    }
}

scoring_multi = [
    {"cf_name": custom_formats["fr-multi-vff"]["name"], "score": 15000},
    {"cf_name": custom_formats["fr-vf-mono"]["name"], "score": 10000},
    {"cf_name": custom_formats["fr-vostfr"]["name"], "score": 0},
    {"cf_name": custom_formats["fr-vfq"]["name"], "score": -50000},
    {"cf_name": custom_formats["tag-4k-light"]["name"], "score": 3000},
    {"cf_name": custom_formats["teams-light-hq"]["name"], "score": 2500},
    {"cf_name": custom_formats["codec-x265"]["name"], "score": 2000},
    {"cf_name": custom_formats["quality-10bit-hdr"]["name"], "score": 2000}
]

scoring_vo = [
    {"cf_name": custom_formats["fr-multi-vff"]["name"], "score": 15000},
    {"cf_name": custom_formats["fr-vostfr"]["name"], "score": 5000},
    {"cf_name": custom_formats["fr-vf-mono"]["name"], "score": -50000},
    {"cf_name": custom_formats["fr-vfq"]["name"], "score": -50000},
    {"cf_name": custom_formats["tag-4k-light"]["name"], "score": 3000},
    {"cf_name": custom_formats["teams-light-hq"]["name"], "score": 2500},
    {"cf_name": custom_formats["codec-x265"]["name"], "score": 2000},
    {"cf_name": custom_formats["quality-10bit-hdr"]["name"], "score": 2000}
]

profiles = [
    {"name": "1080p Efficient - MULTi VFF", "min_score": 10000, "scoring": scoring_multi},
    {"name": "1080p Efficient - VO / VOSTFR", "min_score": 2000, "scoring": scoring_vo},
    {"name": "1080p Quality HDR - MULTi VFF", "min_score": 10000, "scoring": scoring_multi},
    {"name": "1080p Quality HDR - VO / VOSTFR", "min_score": 2000, "scoring": scoring_vo},
    {"name": "2160p Efficient - MULTi VFF", "min_score": 10000, "scoring": scoring_multi},
    {"name": "2160p Efficient - VO / VOSTFR", "min_score": 2000, "scoring": scoring_vo}
]

def write_sql_file(filename, op_id, name_desc, queries):
    exported_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.000Z")
    content = f"""-- @operation: export
-- @entity: batch
-- @name: {name_desc}
-- @exportedAt: {exported_at}
-- @opIds: {op_id}

-- --- BEGIN op {op_id} ( {name_desc} )
"""
    for q in queries:
        content += f"{q}\n"
    content += f"-- --- END op {op_id}\n"
    
    with open(filename, "w", encoding="utf-8") as f:
        f.write(content)

def build_migration_repo():
    if os.path.exists("ops"):
        shutil.rmtree("ops")
    os.makedirs("ops", exist_ok=True)
    
    # Manifeste PCD v2
    manifest = {
        "name": "Custom Light Stack",
        "description": "Custom database for 1080p/2160p Light releases",
        "author": "JuGdx",
        "version": "1.0.0",
        "schema_version": "1.1.0",
        "dependencies": {
            "https://github.com/Dictionarry-Hub/schema": "1.1.0"
        },
        "arr_types": ["radarr", "sonarr"],
        "profilarr": {
            "minimum_version": "2.0.0"
        }
    }
    with open("pcd.json", "w", encoding="utf-8") as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False)

    op_id = 100
    
    # 1. Création des Regex et Custom Formats
    for cf_id, data in custom_formats.items():
        name = escape_sql(data["name"])
        desc = escape_sql(data["description"])
        regex = escape_sql(data["regex"])
        pattern_name = f"REG_{cf_id}"
        
        queries = [
            f"INSERT INTO \"regular_expressions\" (\"name\", \"pattern\") VALUES ('{pattern_name}', '{regex}');",
            f"INSERT INTO \"custom_formats\" (\"name\", \"description\", \"include_in_rename\") VALUES ('{name}', '{desc}', 0);",
            f"INSERT INTO \"custom_format_conditions\" (\"custom_format_name\", \"name\", \"type\", \"arr_type\", \"negate\", \"required\") VALUES ('{name}', 'Release Title', 'release_title', 'all', 0, 1);",
            f"INSERT INTO \"condition_patterns\" (\"custom_format_name\", \"condition_name\", \"regular_expression_name\") VALUES ('{name}', 'Release Title', '{pattern_name}');"
        ]
        
        filename = f"ops/{op_id}.add-custom-format-{cf_id}.sql"
        write_sql_file(filename, op_id, f"Add custom format {data['name']}", queries)
        op_id += 1

    # 2. Création des Profils et association des scores
    for i, p in enumerate(profiles):
        prof_name = escape_sql(p["name"])
        
        queries = [
            f"INSERT INTO \"quality_profiles\" (\"name\", \"upgradeAllowed\", \"minFormatScore\") VALUES ('{prof_name}', 0, {p['min_score']});"
        ]
        
        for score_data in p["scoring"]:
            cf_name = escape_sql(score_data["cf_name"])
            val = score_data["score"]
            queries.append(f"INSERT INTO \"quality_profile_custom_formats\" (\"quality_profile_name\", \"custom_format_name\", \"arr_type\", \"score\") VALUES ('{prof_name}', '{cf_name}', 'radarr', {val});")
            queries.append(f"INSERT INTO \"quality_profile_custom_formats\" (\"quality_profile_name\", \"custom_format_name\", \"arr_type\", \"score\") VALUES ('{prof_name}', '{cf_name}', 'sonarr', {val});")

        filename = f"ops/{op_id}.add-quality-profile-{i+1}.sql"
        write_sql_file(filename, op_id, f"Add quality profile {p['name']}", queries)
        op_id += 1

if __name__ == "__main__":
    build_migration_repo()
    print("✅ Modular SQL migration files generated successfully in ops/ !")