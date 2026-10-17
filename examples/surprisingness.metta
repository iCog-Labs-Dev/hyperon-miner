!(import! &self (library lib_import))
!(git-import! "https://github.com/eyobderese/hyperon-miner.git")
!(import! &self (library hyperon-miner lib_pattern_miner))
!(add-atom &observations (Likes alice tea))
!(add-atom &observations (Likes bob tea))
!(add-atom &observations (Likes alice coffee))
!(add-atom &observations (Likes bob coffee))
!(add-atom &observations (Likes cara tea))

;; Normalized isurp scoring, sampling ratio 0.2, conjunctions enabled.
!(PatternMiner.MineWith &scores &observations $initial 2 0 isurp True 0.2 True)
!(get-atoms &scores)
