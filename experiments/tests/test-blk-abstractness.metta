
! (register-module! ../../../hyperon-miner)
! (import! &self hyperon-miner:experiments:utils:common-utils)
! (import! &self hyperon-miner:experiments:rules:freq-pat)
! (import! &self hyperon-miner:experiments:utils:index_to_var)
! (import! &self hyperon-miner:experiments:utils:blk-abstractness)
! (import! &self hyperon-miner:experiments:utils:gen_partition)



!(is-blk-syntax-more-abstract ((Human $x $y)) ((Human $x Abebe)) $x)
!(is-blk-syntax-more-abstract ((Human $x Abebe)) ((Human $x $y)) $x)


