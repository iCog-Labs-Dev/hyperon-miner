;; import order matters here
!(import! &self "../../utils/surp-utils/boost_petta.py")
!(import! &self ../../utils/common-utils)
!(import! &self ../../utils/index_to_var)
!(import! &self  ../../utils/constants)
!(import! &self  ../../utils/TruthValue)
!(import! &self ../../utils/surp-utils/partition-metta)


;;import surp components 
!(import! &self  ../../utils/surp-utils/binomialMetta)
!(import! &self ../../utils/surp-utils/beta-dist)
!(import! &self  ../../utils/surp-utils/surp-utils)


!(import! &self ../../utils/sort)
!(import! &self ../../utils/variable-combinations)
!(import! &self ../../utils/surp-utils/blk-abstractness)
!(import! &self ../../utils/remove_useless_clauses)
!(import! &self ../../utils/surp-utils/eq-prob-petta)
!(import! &self ../../utils/surp-utils/bs-utils)
!(import! &self ../../utils/surp-utils/jsd-helper)

!(import! &self ../../truth-values/est-tv)
!(import! &self ../../truth-values/emp-tv)
!(import! &self ../../surprisingness/emp-prob)
!(import! &self ../../surprisingness/isurp)
!(import! &self ../../surprisingness/isurp-old)
!(import! &self ../../surprisingness/jsd)

!(import! &self ../../frequent-pattern-miner/build-specialization)
!(import! &self ../../frequent-pattern-miner/candidate-patterns)
!(import! &self ../../frequent-pattern-miner/conjunction-expansion)
!(import! &self ../../frequent-pattern-miner/frequent-pattern-miner)
!(import! &self ../pattern-miner)


;; import kb
!(import! &db ../../data/bio)


!(pattern-miner &res &db 100 0 none none none True) 

!(get-atoms &res)