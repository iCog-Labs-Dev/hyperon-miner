!(import! &self (library lib_import))
!(git-import! "https://github.com/eyobderese/hyperon-miner.git")
!(import! &self (library hyperon-miner lib_pattern_miner))

;; Spaces are named atoms in PeTTa; no allocation or global binding is needed.
!(add-atom &my-db (Likes alice tea))
!(add-atom &my-db (Likes bob tea))
!(add-atom &my-db (Likes cara coffee))
!(PatternMiner.Mine &results &my-db 2 0)
!(get-atoms &results)
