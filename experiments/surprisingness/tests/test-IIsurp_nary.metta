

!(import! &db ../../data/II_surp_kb/state_count)
!(import! &self ../../utils/common-utils)
!(import! &self ../../utils/surp-utils/partition-metta)
!(import! &self ../../utils/surp-utils/IIsurp_utils)
!(import! &self ../IIsurp_nary)






!(assertEqual (IIsurp-old-nary (, (Inheritance $x California)
   (Inheritance $x coffeeDrinker)  (Inheritance $x techWorker)
) &db False ) 1.7036712990880136e-06)



!(assertEqual (IIsurp-old-nary (, (Inheritance $x California)
   (Inheritance $x coffeeDrinker)
) &db False ) 4.811589161216016e-05)

!(assertEqual (IIsurp-old-nary (, (Inheritance $x California)
   (Inheritance $x coffeeDrinker)
) &db True ) 0.19892713455520758)



!(assertEqual (IIsurp-old-nary (, (Inheritance $x California)
   (Inheritance $x surfer)
) &db False ) 0.00011281104175734944)


!(assertEqual (IIsurp-old-nary (, (Inheritance $x California)
   (Inheritance $x surfer)
) &db True ) 0.699597675458203)






