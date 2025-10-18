%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/surprisingness/metta_log/isurp.metta at 2025-10-18T23:17:36+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

%  ; ;types
%  ; (: emp_prob_pbs_mem (-> Pattern SpaceType Number Number))
%  ; ; ; (: pro-prob-wout-joint (-> (List Pattern) SpaceType Number Number Number))
%  ; ; (: ji-prob-est (-> (List Pattern) Pattern SpaceType Number Number))
%  ; ; ; (: do-ji-prob (-> (MList Pattern)) Pattern SpaceType Number (List Number))
%  ; (: ji_prob_est_interval (-> Pattern SpaceType Number Any))
%  ; (: isurp (-> Pattern SpaceType Bool Number Number))
%  ;; Calculate the empirical probability of pattern, using
%  ;; boostrapping if necessary
%  ; (= (emp_prob_pbs_mem $subpattern $db  $db_ratio) 0.4)
%  ;; ==============================================================
%  ;; Function: pro-prob-wout-joint (Product Probability Without Joint Variables)
%  ;; Purpose:  Computes the product probability of subpatterns while ignoring
%  ;;           dependencies between joint variables (treats components as independent)
%  ;;
%  ;; Parameters:
%  ;;   $subpatterns - List of pattern components to evaluate
%  ;;   $db          - Database/context for probability calculation
%  ;;   $db_ratio    - Sampling ratio for empirical probability estimation
%  ;;   $p           - Accumulator for the product probability (starts at 1)
%  ;;
%  ;; How it works:
%  ;; 1. Base Case: When no subpatterns remain, returns accumulated probability
%  ;; 2. Recursive Case:
%  ;;    a. Decomposes subpatterns into head (current) and tail (remaining)
%  ;;    b. Calculates empirical probability of current subpattern
%  ;;    c. Multiplies with accumulated probability
%  ;;    d. Recursively processes remaining subpatterns
%  ;;
%  ;; Mathematical Formulation:
%  ;;   P(pattern) = Π P(subpattern_i) for i in 1..n
%  ;;   Where subpatterns are treated as independent components
%  ;;
%  ;; Key Characteristics:
%  ;; - Recursive implementation
%  ;; - Tail-recursive for efficiency
%  ;; - Multiplicative probability accumulation
%  ;; - Uses empirical probability (emp-prob) for component estimates
%  ;;
%  ;; Typical Usage:
%  ;; Used within ji_prob_est to compute the independent probability component
%  ;; before applying joint variable corrections
%  ;; ==============================================================
/*
  (= (pro-prob-wout-joint $subpatterns $db $db_ratio $p)  
    (if 
      (== $subpatterns ()) $p 
      (let* 
        ( ( ($subpattern $tail) (decons-atom $subpatterns)) 
          ($joined_comma (cons-atom , $subpattern)) 
          ($empr (emp-prob $joined_comma $db)) 
          ($new_prob (* $p $empr))) 
        (pro-prob-wout-joint $tail $db $db_ratio $new_prob))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'pro-prob-wout-joint'</span>, 
     <span class="pl-var">_subpatterns5</span>, <span class="pl-var">_db177</span>, <span class="pl-var">_db_ratio21</span>, <span class="pl-var">_p13</span>, 
     <span class="pl-var">RetVal1295</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_127991434{vn = ..., cns = ...}</span>, <span class="pl-avar">_127991594{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_127991462{vn = ..., cns = ...}</span>, <span class="pl-avar">_127991636{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_127991490{vn = ..., cns = ...}</span>, <span class="pl-avar">_127991678{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_127991518{vn = ..., cns = ...}</span>, <span class="pl-avar">_127991720{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_127991594{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_127991720{vn = ..., cns = ...}</span></span> , 
     _127991806{$P1_CODE_843} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_843</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [ _subpattern ,   _tail    ],
               [ decons-atom ,_subpatterns]], 
             [ <span class="pl-var">_joined_comma</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_empr</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_joined_comma</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_new_prob</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">_p</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">'pro-prob-wout-joint'</span>, <span class="pl-var">_tail</span>, <span class="pl-var">_db</span>, <span class="pl-var">_db_ratio</span>, 
             <span class="pl-var">_new_prob</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_subpatterns</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">E</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_subpattern</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_subpattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>, <span class="pl-var">F</span>, <span class="pl-var">_joined_comma</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_joined_comma</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">_empr</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_p</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_empr</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">_new_prob</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_db_ratio</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_new_prob</span></span> , 
           <span class="pl-atom">me</span>( <span class="pl-atom">'pro-prob-wout-joint'</span>, 
             <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, 
             <span class="pl-var">P1_CODE_RESULT_843</span>))) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_127991806{$P1_CODE_843}</span>, <span class="pl-avar">_127991546{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; ==============================================================
%  ;; Function: ji-prob-est (Joint-Independent Probability Estimate)
%  ;; Purpose:  Estimates the probability of a pattern by:
%  ;;           1. Treating partition components as independent
%  ;;           2. Accounting for joint variables between components
%  ;;
%  ;; Parameters:
%  ;;   $partition - Database partition (components to evaluate separately)
%  ;;   $pattern   - The pattern to evaluate
%  ;;   $db        - The database/context
%  ;;   $db_ratio  - Sampling ratio for probability estimation
%  ;;
%  ;; How it works:
%  ;; 1. Calculates component probability ($p) without joint variables:
%  ;;    (pro-prob-wout-joint $partition $db $db_ratio 1)
%  ;;    - This gives the base probability ignoring variable dependencies
%  ;;
%  ;; 2. Gets database size for normalization:
%  ;;    (db_size $db)
%  ;;
%  ;; 3. Computes joint variable correction factor:
%  ;;    (eq-prob-py $partition $pattern $db-size)
%  ;;    - Estimates probability that joint variables have equal values
%  ;;    - Accounts for dependencies between components
%  ;;
%  ;; 4. Returns combined probability estimate:
%  ;;    (* $p $eq_prob)
%  ;;    - Product of independent probability and joint correction factor
%  ;;
%  ;; Mathematical Interpretation:
%  ;;   P(pattern) ≈ P(components independent) × P(variables equal)
%  ;;
%  ;; Key Characteristics:
%  ;; - Conservative estimate (tends to underestimate true probability)
%  ;; - Handles variable dependencies through eq-prob-py correction
%  ;; - Uses sampling (via db_ratio) for computational efficiency
%  ;;
%  ;; Typical Usage:
%  ;; Used within ji_prob_est_interval to provide probability bounds
%  ;; for surprisingness calculations (isurp function)
%  ;; ==============================================================
/*
  (= (ji-prob-est $partition $pattern $db $db_ratio)  
    (let* 
      ( ($p (pro-prob-wout-joint $partition $db $db_ratio 1)) 
        ($_ (db_size $db)) 
        ($eq_prob (eq-prob $partition $pattern $db))) 
      (* $p $eq_prob)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'ji-prob-est'</span>, 
     <span class="pl-var">_partition45</span>, <span class="pl-var">_pattern181</span>, <span class="pl-var">_db181</span>, 
     <span class="pl-var">_db_ratio25</span>, <span class="pl-var">RetVal1299</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_128738432{vn = ..., cns = ...}</span>, <span class="pl-avar">_128738592{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_128738460{vn = ..., cns = ...}</span>, <span class="pl-avar">_128738634{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_128738488{vn = ..., cns = ...}</span>, <span class="pl-avar">_128738676{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_128738516{vn = ..., cns = ...}</span>, <span class="pl-avar">_128738718{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_128738592{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_128738676{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_128738718{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'pro-prob-wout-joint'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-int">1</span>, <span class="pl-avar">_128738808{$_p}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_128738676{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_128738592{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_128738634{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_128738676{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'eq-prob'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_128738902{$_eq_prob}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_128738808{$_p}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_128738902{$_eq_prob}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-avar">_128738544{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: do-ji-prob
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Recursively computes joint independent probabilities (JI-Probs) for a pattern
%  ;;   across multiple partitions in a database, returning a list of probability estimates.
%  ;;
%  ;; Inputs:
%  ;;   - `$partitions`: List of data partitions to analyze (e.g., `(P1 P2 P3)`)
%  ;;   - `$pattern`: The target pattern to evaluate (e.g., `(P A B)`)
%  ;;   - `$db`: Reference database for probability estimation
%  ;;   - `$db_ratio`: Database ratio parameter for probability calculation
%  ;;
%  ;; Output:
%  ;;   - List of JI-Prob estimates for each partition (e.g., `(0.8 0.6 0.9)`)
%  ;;   - Empty list if no partitions provided
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns empty list when partitions are exhausted
%  ;;   2. Recursive Case:
%  ;;      a. Extracts current partition and remaining partitions
%  ;;      b. Computes JI-Prob using `ji-prob-est` helper
%  ;;      c. Recursively processes remaining partitions
%  ;;      d. Combines results while preserving order
%  ;;
%  ;; Notes:
%  ;;   - Requires `ji-prob-est` helper function
%  ;;   - Preserves partition order in results
%  ;;   - Time Complexity: O(n) where n = partition count
%  ;;   - Space Complexity: O(n) for result storage
%  ;;
%  ;; Examples:
%  ;;   (do-ji-prob '(P1 P2) '(P A B) DB 0.5) → (0.7 0.6)
%  ;;   (do-ji-prob '() '(P X) DB 0.1) → ()
%  ;; =============================================================================
/*
  (= (do-ji-prob $partitions $pattern $db $db_ratio)  
    (if 
      (== $partitions ()) () 
      (let* 
        ( ( ($partition $tail) (decons-atom $partitions)) 
          ($jip (ji-prob-est $partition $pattern $db $db_ratio)) 
          ($dummy (do-ji-prob $tail $pattern $db $db_ratio))) 
        (cons-atom $jip $dummy))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'do-ji-prob'</span>, 
     <span class="pl-var">_partitions9</span>, <span class="pl-var">_pattern185</span>, <span class="pl-var">_db185</span>, 
     <span class="pl-var">_db_ratio29</span>, <span class="pl-var">RetVal1303</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_129124556{vn = ..., cns = ...}</span>, <span class="pl-avar">_129124716{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_129124584{vn = ..., cns = ...}</span>, <span class="pl-avar">_129124758{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_129124612{vn = ..., cns = ...}</span>, <span class="pl-avar">_129124800{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_129124640{vn = ..., cns = ...}</span>, <span class="pl-avar">_129124842{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_129124716{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _129124922{$P1_CODE_847} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_847</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [ _partition ,   _tail   ],
               [ decons-atom,_partitions]], 
             [ <span class="pl-var">_jip</span>, 
               [ <span class="pl-atom">'ji-prob-est'</span>,          <span class="pl-var">_partition</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>, <span class="pl-var">_db_ratio</span>]], 
             [ <span class="pl-var">_dummy</span>, 
               [ <span class="pl-atom">'do-ji-prob'</span>,          <span class="pl-var">_tail</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>, <span class="pl-var">_db_ratio</span>]]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_jip</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_partitions</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_partition</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_db_ratio</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'ji-prob-est'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">_jip</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_db_ratio</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'do-ji-prob'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">_dummy</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_jip</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_dummy</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">P1_CODE_RESULT_847</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_129124922{$P1_CODE_847}</span>, <span class="pl-avar">_129124668{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; ==============================================================
%  ;; Function: ji_prob_est_interval
%  ;; Purpose: Estimates the expected probability interval [emin, emax] for a pattern
%  ;;          using a joint independent (JI) estimation method
%  ;;
%  ;; Parameters:
%  ;;   $pattern    - The pattern whose probability we want to estimate
%  ;;   $db         - The database/context for probability estimation
%  ;;   $db_ratio   - Ratio parameter controlling database sampling/weighting
%  ;;
%  ;; How it works:
%  ;; 1. Generates partitions of the pattern excluding the pattern:
%  ;;    (generet-partition-without-pattern $pattern)
%  ;;    - Creates modified versions of the database that exclude the target pattern
%  ;;    - This is similar to resampling in statistics
%  ;;
%  ;; 2. Computes probability estimates across partitions:
%  ;;    (do-ji-prob partitions $pattern $db $db_ratio)
%  ;;    - Calculates probability estimates for the pattern in each modified partition
%  ;;    - The $db_ratio likely controls the size/weight of sampled partitions
%  ;;
%  ;; 3. Determines the minimum and maximum observed probabilities:
%  ;;    (min-max probabilities)
%  ;;    - Finds the range [emin, emax] of probability values across partitions
%  ;;
%  ;; 4. Returns the probability interval as (emin emax)
%  ;;
%  ;;
%  ;; Typical Usage:
%  ;;   Used as input for surprisingness measures (like isurp) to determine
%  ;;   whether a pattern occurs more/less frequently than expected
%  ;;
%  ;; Return Value:
%  ;;   Returns a pair (emin emax) representing the estimated probability range
%  ;; ==============================================================
/*
  (= (ji_prob_est_interval $pattern $db $db_ratio)  
    (let* 
      ( ($gen_parts (generet-partition-without-pattern $pattern)) 
        ($comp_ji (do-ji-prob $gen_parts $pattern $db $db_ratio)) 
        ($emin (min-atom $comp_ji)) 
        ($emax (max-atom $comp_ji))) 
      ($emin $emax)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">ji_prob_est_interval</span>, 
     <span class="pl-var">_pattern189</span>,  <span class="pl-var">_db189</span>, <span class="pl-var">_db_ratio33</span>, <span class="pl-var">RetVal1307</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_129811390{vn = ..., cns = ...}</span>, <span class="pl-avar">_129811522{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_129811418{vn = ..., cns = ...}</span>, <span class="pl-avar">_129811564{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_129811446{vn = ..., cns = ...}</span>, <span class="pl-avar">_129811606{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_129811522{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'generet-partition-without-pattern'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_129811660{$_gen_parts}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_129811660{$_gen_parts}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_129811522{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_129811564{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_129811606{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'do-ji-prob'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_129811742{$_comp_ji}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_129811742{$_comp_ji}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'min-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_129811782{$_emin}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_129811742{$_comp_ji}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'max-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_129811822{$_emax}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_129811782{$_emin}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_129811822{$_emax}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-avar">_129811474{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; ==============================================================
%  ;; Function: isurp (Independent Surprisingness)
%  ;; Purpose:  Measures how statistically surprising a pattern is
%  ;;           within a given database context, with optional normalization
%  ;;
%  ;; Parameters:
%  ;;   $pattern    - The pattern to evaluate for surprisingness
%  ;;   $db         - The database/context to evaluate against
%  ;;   $normalize  - Boolean flag to normalize the result (0-1 range) 
%  ;;   $db_ratio   - Ratio parameter for database sampling/weighting
%  ;;
%  ;; How it works:
%  ;; 1. Calculates probability interval (emin, emax) for the pattern using ji_prob_est_interval
%  ;;    - This estimates the expected probability range of the pattern
%  ;; 2. Computes empirical probability (emp) using emp-prob-pbs
%  ;;    - The actual observed probability in the database
%  ;; 3. Measures distance (dst) between empirical probability and expected interval
%  ;;    - Using dst_from_interval (likely measures how far emp is from expected range)
%  ;; 4. Determines maximum probability value (maxprb) between emp and emax
%  ;; 5. Returns:
%  ;;    - If normalize=true: The ratio of distance to max probability (clamped to 1.0)
%  ;;    - If normalize=false: The raw distance value (clamped to 1.0)
%  ;;
%  ;; Mathematical Interpretation:
%  ;;   Measures how much the observed frequency deviates from expected,
%  ;;   with normalization option to make values comparable across patterns
%  ;;
%  ;; Return Value:
%  ;;   Returns a surprisingness measure between 0 and 1, where:
%  ;;   - 0 = completely expected
%  ;;   - 1 = maximally surprising
%  ;; ==============================================================
/*
  (= (isurp $pattern $db $normalize $db_ratio)  
    (let* 
      ( ( ($emin $emax) (ji_prob_est_interval $pattern $db $db_ratio)) 
        (() (println! (emin $emin and emax $emax))) 
        ($emp (emp-prob-pbs $pattern $db $emax $db_ratio)) 
        (() (println! (emp-prob-pbs $emp))) 
        ($dst (dst_from_interval $emin $emax $emp)) 
        (() (println! (distance $_))) 
        ($maxprb (max-atom ($emp $emax))) 
        (() (println! (max-prob $maxprb)))) 
      (min ((if $normalize (// $dst $maxprb) $dst) 1.0))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">isurp</span>, 
     <span class="pl-var">_pattern193</span>, <span class="pl-var">_db193</span>, <span class="pl-var">_normalize1</span>, 
     <span class="pl-var">_db_ratio37</span>, <span class="pl-var">RetVal1311</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_130223798{vn = ..., cns = ...}</span>, <span class="pl-avar">_130223958{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_130223826{vn = ..., cns = ...}</span>, <span class="pl-avar">_130224000{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_130223854{vn = ..., cns = ...}</span>, <span class="pl-avar">_130224042{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_130223882{vn = ..., cns = ...}</span>, <span class="pl-avar">_130224084{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130223958{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224000{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224084{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">ji_prob_est_interval</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_130224184{$_emin}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224184{$_emin}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224204{$_emax}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">emin</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-atom">and</span>, <span class="pl-atom">emax</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130223958{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224000{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224204{$_emax}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224084{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob-pbs'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span>, <span class="pl-avar">_130224354{$_emp}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">12</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224354{$_emp}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'emp-prob-pbs'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">12</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">14</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">14</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">15</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224184{$_emin}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">16</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224204{$_emax}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">17</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224354{$_emp}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">dst_from_interval</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">15</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">16</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">17</span></span>)</span>, <span class="pl-avar">_130224472{$_dst}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">18</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">distance</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">18</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">19</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">19</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">20</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">20</span></span>)</span>, []</span>)</span> , 
     <span class="pl-atom">eval_for1</span>( <span class="pl-atom">'%Undefined%'</span>, 
       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'Expression'</span>, <span class="pl-atom">'Number'</span></span>]</span>, 
       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_130224354{$_emp}</span>, <span class="pl-avar">_130224204{$_emax}</span></span>]</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">21</span></span>)</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'max-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">21</span></span>)</span>, <span class="pl-avar">_130224578{$_maxprb}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">22</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_130224578{$_maxprb}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'max-prob'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">22</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">23</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">23</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">24</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">24</span></span>)</span>, []</span>)</span> , 
     <span class="pl-atom">me</span>( <span class="pl-atom">min</span>, 
       [ [ <span class="pl-atom">if</span>, 
           <span class="pl-var">_normalize</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-var">_dst</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
           <span class="pl-var">_dst</span>], 
         <span class="pl-float">1.0</span>], 
       _130223910{vn = ..., cns = ...})</span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/surprisingness/metta_log/isurp.metta at 2025-10-18T23:17:42+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
