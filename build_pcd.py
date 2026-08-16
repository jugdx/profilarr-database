import os
import json
import shutil
from datetime import datetime, timezone

# --- 1. CUSTOM FORMATS & REGEX CONFIGURATION ---
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

# --- 2. SCORING MATRIX ---
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

# --- 3. PROFILES CONFIGURATION ---
profiles = [
    {"name": "1080p Efficient - MULTi VFF", "min_score": 10000, "scoring": scoring_multi},
    {"name": "1080p Efficient - VO / VOSTFR", "min_score": 2000, "scoring": scoring_vo},
    {"name": "1080p Quality HDR - MULTi VFF", "min_score": 10000, "scoring": scoring_multi},
    {"name": "1080p Quality HDR - VO / VOSTFR", "min_score": 2000, "scoring": scoring_vo},
    {"name": "2160p Efficient - MULTi VFF", "min_score": 10000, "scoring": scoring_multi},
    {"name": "2160p Efficient - VO / VOSTFR", "min_score": 2000, "scoring": scoring_vo}
]

def escape_sql(text):
    return text.replace("'", "''")

def build_sql():
    if os.path.exists("ops"):
        shutil.rmtree("ops")
    os.makedirs("ops", exist_ok=True)
    
    # 1. Génération du Manifeste
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

    # 2. Génération du fichier SQL
    sql_lines = []
    op_id = 1000
    
    def add_op(entity_type, entity_name, queries):
        nonlocal op_id
        sql_lines.append(f"-- --- BEGIN op {op_id} ( insert {entity_type} \"{entity_name}\" )")
        for query in queries:
            sql_lines.append(query)
        sql_lines.append(f"-- --- END op {op_id}\n")
        op_id += 1

    # Création des Custom Formats et Conditions
    for cf_id, data in custom_formats.items():
        name = escape_sql(data["name"])
        desc = escape_sql(data["description"])
        regex = escape_sql(data["regex"])
        regex_name = f"REGEX_{name}"
        
        # Insert Regular Expression
        add_op("regular_expression", regex_name, [
            f"INSERT INTO \"regular_expressions\" (\"name\", \"pattern\") VALUES ('{regex_name}', '{regex}');"
        ])
        
        # Insert Custom Format
        add_op("custom_format", name, [
            f"INSERT INTO \"custom_formats\" (\"name\", \"description\", \"include_in_rename\") VALUES ('{name}', '{desc}', 0);"
        ])
        
        # Link Condition
        add_op("custom_format_condition", name, [
            f"INSERT INTO \"custom_format_conditions\" (\"custom_format_name\", \"name\", \"type\", \"arr_type\", \"negate\", \"required\") VALUES ('{name}', 'Release Title', 'release_title', 'all', 0, 1);",
            f"INSERT INTO \"condition_patterns\" (\"custom_format_name\", \"condition_name\", \"regular_expression_name\") VALUES ('{name}', 'Release Title', '{regex_name}');"
        ])

    # Création des Profils et Scores
    for p in profiles:
        prof_name = escape_sql(p["name"])
        
        # Insert Profile
        add_op("quality_profile", prof_name, [
            f"INSERT INTO \"quality_profiles\" (\"name\", \"upgrades_allowed\", \"min_format_score\") VALUES ('{prof_name}', 0, {p['min_score']});"
        ])
        
        # Insert Scores pour Radarr & Sonarr
        score_queries = []
        for score_data in p["scoring"]:
            cf_name = escape_sql(score_data["cf_name"])
            score_val = score_data["score"]
            score_queries.append(
                f"INSERT INTO \"quality_profile_custom_formats\" (\"quality_profile_name\", \"custom_format_name\", \"arr_type\", \"score\") VALUES ('{prof_name}', '{cf_name}', 'radarr', {score_val});"
            )
            score_queries.append(
                f"INSERT INTO \"quality_profile_custom_formats\" (\"quality_profile_name\", \"custom_format_name\", \"arr_type\", \"score\") VALUES ('{prof_name}', '{cf_name}', 'sonarr', {score_val});"
            )
        
        add_op("quality_profile_custom_formats", prof_name, score_queries)

    # Header du fichier SQL (Standard Profilarr Export)
    exported_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S.000Z")
    op_ids_list = ", ".join(str(i) for i in range(1000, op_id))
    
    header = f"""-- @operation: export
-- @entity: batch
-- @name: Init JuGdx Light Database
-- @exportedAt: {exported_at}
-- @opIds: {op_ids_list}

"""
    
    with open("ops/1.init-jugdx-database.sql", "w", encoding="utf-8") as f:
        f.write(header)
        f.write("\n".join(sql_lines))

if __name__ == "__main__":
    build_sql()
    print("✅ PCD v2 SQL Migration file generated successfully!")