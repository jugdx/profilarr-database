import os
import json

# --- 1. CONFIGURATION DES CUSTOM FORMATS ---
custom_formats = {
    "fr-multi-vff": {
        "name": "FR - MULTi & VFF",
        "description": "Contient obligatoirement la VO et une piste VFF.",
        "regex": "(?i)(?=.*\\b(MULTI|DUAL)\\b)(?=.*\\b(VFF|TRUEFRENCH|VF2|VOF|VOFR)\\b)"
    },
    "fr-vf-mono": {
        "name": "FR - VF Mono",
        "description": "Piste VF seule (sans MULTi).",
        "regex": "(?i)\\b(FRENCH|VF|VFF|TRUEFRENCH|VF2|VOF|VOFR)\\b(?!.*\\b(MULTI|DUAL)\\b)"
    },
    "fr-vostfr": {
        "name": "FR - VOSTFR",
        "description": "Sous-titres FR incrustés/inclus.",
        "regex": "(?i)\\b(VOST(\\.|\\-)?FR|SUB\\.?FRENCH|STFR)\\b"
    },
    "fr-vfq": {
        "name": "FR - VFQ",
        "description": "Doublage québécois (à rejeter).",
        "regex": "\\b(VFQ|VFI)\\b"
    },
    "tag-4k-light": {
        "name": "Tag - 4K Light / Light",
        "description": "Mention explicite de Light.",
        "regex": "(?i)\\b(4K[\\.\\-_ ]?Light|UHD[\\.\\-_ ]?Light|Light)\\b"
    },
    "codec-x265": {
        "name": "Codec - x265 / HEVC",
        "description": "Norme de compression cible.",
        "regex": "(?i)\\b(x265|HEVC|H\\.?265)\\b"
    },
    "quality-10bit-hdr": {
        "name": "Quality - 10bit HDR",
        "description": "Mastering 10-bit / HDR / DV.",
        "regex": "(?i)\\b(10[\\.\\-_]?bit|HDR|HDR10|DV|Dolby[\\.\\-_]?Vision)\\b"
    },
    "teams-light-hq": {
        "name": "Teams - Light HQ",
        "description": "Encodeurs de référence.",
        "regex": "(?i)\\b(QxR|Tigole|Silence|PSA|QTZ|d3g|UTR|Edge2020|Vyndros)\\b"
    }
}

# --- 2. MATRICE DE SCORING ---
scoring_multi = [
    {"trash_id": "fr-multi-vff", "score": 15000},
    {"trash_id": "fr-vf-mono", "score": 10000},
    {"trash_id": "fr-vostfr", "score": 0},
    {"trash_id": "fr-vfq", "score": -50000},
    {"trash_id": "tag-4k-light", "score": 3000},
    {"trash_id": "teams-light-hq", "score": 2500},
    {"trash_id": "codec-x265", "score": 2000},
    {"trash_id": "quality-10bit-hdr", "score": 2000}
]

scoring_vo = [
    {"trash_id": "fr-multi-vff", "score": 15000},
    {"trash_id": "fr-vostfr", "score": 5000},
    {"trash_id": "fr-vf-mono", "score": -50000},
    {"trash_id": "fr-vfq", "score": -50000},
    {"trash_id": "tag-4k-light", "score": 3000},
    {"trash_id": "teams-light-hq", "score": 2500},
    {"trash_id": "codec-x265", "score": 2000},
    {"trash_id": "quality-10bit-hdr", "score": 2000}
]

# --- 3. CONFIGURATION DES PROFILS ---
profiles = [
    {"id": "1080p-efficient-multi-vff", "name": "1080p Efficient - MULTi VFF", "min_score": 10000, "qualities": ["WEBDL-1080p", "Bluray-1080p"], "scoring": scoring_multi},
    {"id": "1080p-efficient-vo-vostfr", "name": "1080p Efficient - VO / VOSTFR", "min_score": 2000, "qualities": ["WEBDL-1080p", "Bluray-1080p"], "scoring": scoring_vo},
    {"id": "1080p-quality-hdr-multi-vff", "name": "1080p Quality HDR - MULTi VFF", "min_score": 10000, "qualities": ["WEBDL-1080p", "Bluray-1080p"], "scoring": scoring_multi},
    {"id": "1080p-quality-hdr-vo-vostfr", "name": "1080p Quality HDR - VO / VOSTFR", "min_score": 2000, "qualities": ["WEBDL-1080p", "Bluray-1080p"], "scoring": scoring_vo},
    {"id": "2160p-efficient-multi-vff", "name": "2160p Efficient - MULTi VFF", "min_score": 10000, "qualities": ["WEBDL-2160p", "Bluray-2160p"], "scoring": scoring_multi},
    {"id": "2160p-efficient-vo-vostfr", "name": "2160p Efficient - VO / VOSTFR", "min_score": 2000, "qualities": ["WEBDL-2160p", "Bluray-2160p"], "scoring": scoring_vo}
]

# --- 4. FONCTIONS DE GÉNÉRATION PCD ---
def build_directories():
    # Création des sous-dossiers dans ops/ pour garder ça propre
    for d in ["ops/custom-formats", "ops/profiles", "ops/quality-definitions", "tweaks", "deps"]:
        os.makedirs(d, exist_ok=True)

def generate_manifest():
    manifest = {
        "name": "Custom Light Stack",
        "description": "Base de données sur-mesure pour 1080p/2160p Light",
        "author": "JuGdx",
        "version": "1.0.0",
        "schema_version": 1
    }
    with open("pcd.json", "w", encoding="utf-8") as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False)

def generate_formats():
    for cf_id, data in custom_formats.items():
        payload = {
            "name": data["name"],
            "description": data["description"],
            "trash_id": cf_id,
            "specifications": [
                {
                    "name": "Regex",
                    "implementation": "ReleaseTitleSpecification",
                    "negate": False,
                    "required": True,
                    "fields": {"value": data["regex"]}
                }
            ]
        }
        with open(f"ops/custom-formats/{cf_id}.json", "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, ensure_ascii=False)

def generate_profiles():
    for p in profiles:
        payload = {
            "name": p["name"],
            "trash_id": p["id"],
            "upgrades_allowed": False,
            "minimum_custom_format_score": p["min_score"],
            "qualities": [{"name": q} for q in p["qualities"]],
            "custom_format_scorings": p["scoring"]
        }
        with open(f"ops/profiles/{p['id']}.json", "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, ensure_ascii=False)

def generate_quality_definitions():
    payload = {
        "type": "radarr",
        "qualities": [
            {"quality": "WEBDL-1080p", "min": 0, "max": 2000},
            {"quality": "Bluray-1080p", "min": 0, "max": 2000},
            {"quality": "WEBDL-2160p", "min": 0, "max": 2000},
            {"quality": "Bluray-2160p", "min": 0, "max": 2000}
        ]
    }
    for arr in ["radarr", "sonarr"]:
        payload["type"] = arr
        with open(f"ops/quality-definitions/{arr}.json", "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2, ensure_ascii=False)

# --- 5. EXÉCUTION ---
if __name__ == "__main__":
    build_directories()
    generate_manifest()
    generate_formats()
    generate_profiles()
    generate_quality_definitions()
    print("✅ PCD generated! Go check your ops folder!")