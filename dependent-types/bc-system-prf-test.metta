!(register-module! ../../chaining)
!(import! &self chaining:dtl:backward:curried)

!(register-module! ../../hyperon-miner)
!(import! &self hyperon-miner:utils:MinerUtils)
!(import! &self hyperon-miner:dependent-types:bc-system-prf)

; Test
!(syn &self Z (: CPU (⍃ 2 3)))
!(syn &self Z (: CPU (⍃ 4 3)))
!(syn &self Z (: CPUDiff (isDiff (hello world) (this world))))
!(syn &self Z (: CPUDiff (isDiff (test pattern) (test pattern))))
!(syn &self Z (: PRUNEPRF (valid-conj (likes (VarIdx Z) (VarIdx (S Z))) (likes (VarIdx Z) Han))))
!(syn &self Z (: PRUNEPRF (valid-conj (likes (VarIdx Z) Cat) (likes (VarIdx Z) Dog))))

!(prune? (, (likes (VarIdx Z) (VarIdx (S Z))) (likes (VarIdx Z) Han)))
