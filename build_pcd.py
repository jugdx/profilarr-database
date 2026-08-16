import os
import json
import hashlib
import shutil

def get_hash(text):
    """Generates a 32-character MD5 hash (TRaSH/Profilarr Standard)"""
    return hashlib.md5(text.encode('utf-8')).hexdigest()

# --- 1. CUSTOM FORMATS CONFIGURATION ---
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
    {"trash_id": get_hash("fr-multi-vff"), "score": 15000},
    {"trash_id": get_hash("fr-vf-mono"), "score": 10000},
    {"trash_id": get_hash("fr-vostfr"), "score": 0},
    {"trash_id": get_hash("fr-vfq"), "score": -50000},
    {"trash_id": get_hash("tag-4k-light"), "score": 3000},
    {"trash_id": get_hash("teams-light-hq"), "score": 2500},
    {"trash_id": get_hash("codec-x265"), "score": 2000},
    {"trash_id": get_hash("quality-10bit-hdr"), "score": 2000}
]

scoring_vo = [
    {"trash_id": get_hash("fr-multi-vff"), "score": 15000},
    {"trash_id": get_hash("fr-vostfr"), "score": 5000},
    {"trash_id": get_hash("fr-vf-mono"), "score": -50000},
    {"trash_id": get_hash("fr-vfq"), "score": -50000},
    {"trash_id": get_hash("tag-4k-light"), "score": 3000},
    {"trash_id": get_hash("teams-light-hq"), "score": 2500},
    {"trash_id": get_hash("codec-x265"), "score": 2000},
    {"trash_id": get_hash("quality-10bit-hdr"), "score": 2000}
]

# --- 3. PROFILES CONFIGURATION ---
profiles = [
    {"id": "1080p-efficient-multi-vff", "name": "1080p Efficient - MULTi VFF", "min_score": 10000, "qualities": ["WEBDL-1080p", "Bluray-1080p"], "scoring": scoring_multi},
    {"id": "1080p-efficient-vo-vostfr", "name": "1080p Efficient - VO / VOSTFR", "min_score": 2000, "qualities": ["WEBDL-1080p", "Bluray-1080p"], "scoring": scoring_vo},
    {"id": "1080p-quality-hdr-multi-vff", "name": "1080p Quality HDR - MULTi VFF", "min_score": 10000, "qualities": ["WEBDL-1080p", "Bluray-1080p"], "scoring": scoring_multi},
    {"id": "1080p-quality-hdr-vo-vostfr", "name": "1080p Quality HDR - VO / VOSTFR", "min_score": 2000, "qualities": ["WEBDL-1080p", "Bluray-1080p"], "scoring": scoring_vo},
    {"id": "2160p-efficient-multi-vff", "name": "2160p Efficient - MULTi VFF", "min_score": 10000, "qualities": ["WEBDL-2160p", "Bluray-2160p"], "scoring": scoring_multi},
    {"id": "2160p-efficient-vo-vostfr", "name": "2160p Efficient - VO / VOSTFR", "min_score": 2000, "qualities": ["WEBDL-2160p", "Bluray-2160p"], "scoring": scoring_vo}
]

# --- 4. PCD GENERATION FUNCTIONS ---
def build_directories():
    # Purge pour supprimer les anciens dossiers avec les tirets du milieu
    if os.path.exists("ops"):
        shutil.rmtree("ops")
        
    # NOUVEAUX NOMS DE DOSSIERS (Underscores exigés par le schéma Profilarr)
    for d in ["ops/custom_formats", "ops/quality_profiles", "ops/quality_definitions", "tweaks", "deps"]:
        os.makedirs(d, exist_ok=True)

def generate_manifest():
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

def generate_formats():
    for cf_id, data in custom_formats.items():
        payload = {
            "name": data["name"],
            "description": data["description"],
            "trash_id": get_hash(cf_id),
            "arr_types": ["radarr", "sonarr"],
            "includeCustomFormatWhenRenaming": False,
            "specifications": [
                {
                    "name": "Regex",
                    "implementation": "ReleaseTitleSpecification",
                    "negate": False,
                    "required": True,
                    "fields": [
                        {
                            "name": "value",
                            "value": data["regex"]
                        }
                    ]
                }
            ]
        }
        with open(f"ops/custom_formats/{cf_id}.json", "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, ensure_ascii=False)

def generate_profiles():
    for p in profiles:
        payload = {
            "name": p["name"],
            "trash_id": get_hash(p["id"]),
            "arr_types": ["radarr", "sonarr"],
            "upgrades_allowed": False,
            "minimum_custom_format_score": p["min_score"],
            "qualities": [{"name": q} for q in p["qualities"]],
            "custom_format_scorings": p["scoring"]
        }
        with open(f"ops/quality_profiles/{p['id']}.json", "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, ensure_ascii=False)

def generate_quality_definitions():
    for arr in ["radarr", "sonarr"]:
        payload = {
            "trash_id": get_hash(f"quality-definition-{arr}"),
            "arr_types": [arr],
            "qualities": [
                {"quality": "WEBDL-1080p", "min": 0, "max": 2000},
                {"quality": "Bluray-1080p", "min": 0, "max": 2000},
                {"quality": "WEBDL-2160p", "min": 0, "max": 2000},
                {"quality": "Bluray-2160p", "min": 0, "max": 2000}
            ]
        }
        with open(f"ops/quality_definitions/{arr}.json", "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, ensure_ascii=False)

# --- 5. EXECUTION ---
if __name__ == "__main__":
    build_directories()
    generate_manifest()
    generate_formats()
    generate_profiles()
    generate_quality_definitions()
    print("✅ PCD v2 structure generated successfully with UNDERSCORE folder names!")