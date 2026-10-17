;; Run from this checkout with: sh /path/to/PeTTa/run.sh run_miner.metta
!(import! &self lib_pattern_miner)
!(import! &my-db experiments/data/ugly_man_sodaDrinker)
!(PatternMiner.Mine &results &my-db 3 0)
!(get-atoms &results)
