%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/truth-values/metta_log/emp-tv.metta at 2025-10-03T12:04:43+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

%  ;; Rule to calculate the empirical truth value of a pattern.
%  ;;;;;;;;;;
%   ;; Type ;;
%   ;;;;;;;;;;
%  ; (: TruthValue Type)
%  ; (: EMPTV (-> Number Number TruthValue))
%  ; (: count_to_confidence (-> Number Number))
%  ; (: emp-tv (-> Pattern SpaceType TruthValue))
%  ; (: prob_to_support (-> Pattern SpaceType Number Number))
%  ; (: support_estimate_calculator (-> Pattern SpaceType Number Number TruthValue))
%  ; (: emp_tv_pbs (-> Pattern SpaceType Number Number TruthValue))
%  ; (: sup (-> Pattern SpaceType Number))
%  ; (: ji_tv_est (-> Pattern SpaceType TruthValue))
%  ; (: categorize_subsize (-> Number Number Number))
%  ; (: copy-db (-> SpaceType Expression SpaceType))
%  ; (: add_n_atoms_to_db (-> SpaceType Number SpaceType))
%  ; (: copy-and-add-atom (-> SpaceType Number SpaceType))
%  ; (: duplicate-and-expand-space (-> SpaceType Number SpaceType))
%  ; (: copy-db-by-size (-> SpaceType Expression Number Number SpaceType))
%  ; (: subsample (-> SpaceType Number SpaceType))
%  ; (: do_emp_tv (-> Pattern SpaceType Number TruthValue))
%  ; (: gen-random (-> Number Number))
%  ; (: gen-random-subsample (-> SpaceType Number SpaceType SpaceType))
%  ; (: emp-tv-subsmp (-> Pattern SpaceType Number TruthValue))
%  ; (: emp-tv-bs-helper (-> Pattern SpaceType Number Number (List TruthValue)))
%  ; (: subsmp-size (-> Pattern Number Number Number))
%  ; (: emp-tv-bs (-> Pattern SpaceType Number Number Number TruthValue))
%  ; (: emp-tv-bs (-> Pattern SpaceType Number Number TruthValue))
%  ;; =============================================================================
%  ;; Type: TruthValue
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose: Represents a truth value with confidence measurement
%  ;; Constructor: (EMPTV <strength> <confidence>)
%  ;; =============================================================================
%  ; (: TruthValue Type)
%  ; (: EMPTV (-> $a $b TruthValue))
%  ;; =============================================================================
%  ;; Constant: Default_k
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Provides a default smoothing constant used in confidence calculations.
%  ;;
%  ;; Value:
%  ;;   - 1
%  ;;
%  ;; Usage:
%  ;;   Used in the denominator of the count_to_confidence function to avoid
%  ;;   overconfidence with small sample sizes.
%  ;; =============================================================================
/*
  (= (Default_k)  1)
*/


<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-compound"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">:-</span> <span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span></span>)</span>.


%  ;; =============================================================================
%  ;; Constant: DEFAULT_K
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Defines a large default scaling constant used in statistical calculations
%  ;;   or other smoothing functions (context-dependent).
%  ;;
%  ;; Value:
%  ;;   - 800.0
%  ;;
%  ;; Usage:
%  ;;   Intended for use where a higher smoothing or normalization factor is needed.
%  ;;   Not currently referenced in count_to_confidence.
%  ;; =============================================================================
/*
  (= (DEFAULT_K)  800.0)
*/


<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-compound"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">:-</span> <span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span></span>)</span>.


%  ;; =============================================================================
%  ;; Function: count_to_confidence
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose: 
%  ;;   Calculate a confidence value based on a count using a smoothing constant.
%  ;;
%  ;; Parameters:
%  ;;   - $x: The count value (e.g., number of observations or samples)
%  ;;
%  ;; Internal Calculation:
%  ;;   1. Adds the smoothing constant Default_k to the input count
%  ;;   2. Divides the count by the sum to compute a normalized confidence
%  ;;      => confidence = x / (x + Default_k)
%  ;;
%  ;; Returns:
%  ;;   - A confidence value between 0 and 1
%  ;; =============================================================================
/*
  (= (count_to_confidence $x)  
    (// $x 
      (+ $x 
        (DEFAULT_K))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">count_to_confidence</span>, <span class="pl-var">_x37</span>, <span class="pl-var">RetVal763</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65864186{vn = ..., cns = ...}</span>, <span class="pl-avar">_65864262{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65864262{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65864262{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'DEFAULT_K'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_65864214{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: emp-tv
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose: Calculate empirical truth value for a pattern in database
%  ;; Parameters:
%  ;;   - $pattern: Target pattern to evaluate
%  ;;   - $db: Database to analyze
%  ;; 
%  ;; Internal Computation:
%  ;;   1. universe-count: Get total relevant items
%  ;;   2. sup-num: Get pattern occurrences
%  ;;   3. confidence: Calculate using count_to_confidence
%  ;;   4. mean: Calculate support ratio
%  ;; 
%  ;; Returns:
%  ;;   - EMPTV structure containing mean and confidence
/*
  (= (emp-tv $pattern $db)  
    (let* 
      ( (() (println! "======= Emperical Truth Value =======")) 
        ($ucount (universe-count $pattern $db)) 
        ($_ $ucount) 
        ($sup (sup-num $db $pattern)) 
        ($conf (count_to_confidence $ucount)) 
        ($mean (// $sup $ucount)) 
        ($confidence (* 0.1 $conf))) 
      (EMPTV $mean $confidence)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">_pattern61</span>, <span class="pl-var">_db53</span>, <span class="pl-var">RetVal767</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66068330{vn = ..., cns = ...}</span>, <span class="pl-avar">_66068434{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66068358{vn = ..., cns = ...}</span>, <span class="pl-avar">_66068476{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-string">"======= Emperical Truth Value ======="</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068434{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068476{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'universe-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_66068574{$_ucount}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068574{$_ucount}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068476{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068434{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'sup-num'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_66068640{$_sup}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068574{$_ucount}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">count_to_confidence</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_66068680{$_conf}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068640{$_sup}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068574{$_ucount}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-avar">_66068734{$_mean}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068680{$_conf}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-float">0.1</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-avar">_66068776{$_confidence}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068734{$_mean}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66068776{$_confidence}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'EMPTV'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-avar">_66068386{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: prob_to_support
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Calculate the support of a given pattern in a database using a probability estimate.
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: The pattern whose support is being computed. Represents a data structure or identifier.
%  ;;   - $db: The database (typically a space or collection) where the pattern is evaluated.
%  ;;   - $prob: The probability estimate of the pattern (a numeric likelihood value).
%  ;;
%  ;; Internal Calculation:
%  ;;   1. Retrieve the universe count of the pattern in the given database using universe-count
%  ;;   2. Multiply the count by the given probability estimate
%  ;;      => support = probability × universe count
%  ;;
%  ;; Returns:
%  ;;   - The support value, representing the expected count or weight of the pattern in the database
%  ;; =============================================================================
/*
  (= (prob_to_support $pattern $db $prob)  
    (let $che 
      (universe-count $pattern $db) 
      (* $prob $che)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">prob_to_support</span>, <span class="pl-var">_pattern65</span>, <span class="pl-var">_db57</span>, <span class="pl-var">_prob1</span>, <span class="pl-var">RetVal771</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66440958{vn = ..., cns = ...}</span>, <span class="pl-avar">_66441090{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66440986{vn = ..., cns = ...}</span>, <span class="pl-avar">_66441132{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66441014{vn = ..., cns = ...}</span>, <span class="pl-avar">_66441174{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66441090{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66441132{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'universe-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_66441242{$_che}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66441174{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66441242{$_che}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_66441042{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: support_estimate_calculator
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Estimate the support for a pattern in a scaled database and compute the
%  ;;   empirical truth value using bootstrapping techniques.
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: The pattern for which the support estimate and truth value are calculated.
%  ;;   - $db: The database in which the pattern's support is evaluated.
%  ;;   - $prob_estimate: The estimated probability of the pattern's occurrence.
%  ;;   - $db_ratio: A scaling factor applied to the database size to reflect effective data contribution.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. Compute support estimate using prob_to_support based on pattern, db, and prob_estimate.
%  ;;   2. Scale the database size by multiplying db_size with db_ratio.
%  ;;   3. Call emp_tv_pbs with calculated values to compute the empirical truth value.
%  ;;
%  ;; Returns:
%  ;;   - An empirical truth value (e.g., confidence and mode), adjusted via bootstrapping
%  ;; =============================================================================
/*
  (= (support_estimate_calculator $pattern $db $prob_estimate $db_ratio)  
    (let* 
      ( ($support_estimate (prob_to_support $pattern $db $prob_estimate)) ($database_size (* (db_size $db) $db_ratio))) 
      (emp_tv_pbs $pattern $db $prob_estimate $db_ratio $database_size $support_estimate)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">support_estimate_calculator</span>, 
     <span class="pl-var">_pattern69</span>,  <span class="pl-var">_db61</span>, <span class="pl-var">_prob_estimate1</span>, <span class="pl-var">_db_ratio1</span>, <span class="pl-var">RetVal775</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66637354{vn = ..., cns = ...}</span>, <span class="pl-avar">_66637514{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66637382{vn = ..., cns = ...}</span>, <span class="pl-avar">_66637556{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66637410{vn = ..., cns = ...}</span>, <span class="pl-avar">_66637598{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66637438{vn = ..., cns = ...}</span>, <span class="pl-avar">_66637640{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637514{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637556{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637598{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">prob_to_support</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_66637722{$_support_estimate}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637556{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637640{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_66637790{$_database_size}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637514{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637556{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637598{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637640{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637790{$_database_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66637722{$_support_estimate}</span></span> , 
     <span class="pl-atom">s</span>( <span class="pl-atom">emp_tv_pbs</span>, 
       <span class="pl-var">G</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span>, <span class="pl-avar">_66637466{vn = ..., cns = ...}</span>)</span>) ).


%  ;; =============================================================================
%  ;; Function: sup
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Compute the support of a pattern in a database by counting how many data
%  ;;   trees match the pattern.
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: The pattern to be matched against data in the database.
%  ;;   - $db: The database of data trees where the pattern is searched.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. Perform pattern matching on the database using the `match` function.
%  ;;   2. Collapse the result to a flat collection of matches.
%  ;;   3. Count the number of resulting tuples using `tuple-count`.
%  ;;      => This represents the number of data trees that match the pattern.
%  ;;
%  ;; Returns:
%  ;;   - An integer indicating the support (number of matches) for the given pattern.
%  ;; =============================================================================
/*
  (= (sup $pattern $db)  
    (tuple-count (collapse (match $db $x (let $pattern $x $pattern)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">sup</span>, <span class="pl-var">_pattern73</span>, <span class="pl-var">_db65</span>, <span class="pl-var">RetVal779</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67048122{vn = ..., cns = ...}</span>, <span class="pl-avar">_67048226{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67048150{vn = ..., cns = ...}</span>, <span class="pl-avar">_67048268{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       ( <span class="pl-compound pl-level-0"><span class="pl-var">B</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span>  ,
         <span class="pl-compound pl-level-0"><span class="pl-functor">metta_atom_iter</span>(<span class="pl-args"><span class="pl-var">B</span>, <span class="pl-var">_x</span></span>)</span> , 
         <span class="pl-compound pl-level-0"><span class="pl-var">_pattern</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span> , 
         <span class="pl-compound pl-level-0"><span class="pl-var">A</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>), 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_67048178{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: categorize_subsize
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Categorize a subset size based on whether it exceeds half of a given threshold size.
%  ;;
%  ;; Parameters:
%  ;;   - $subsize: The size of the subset to be evaluated.
%  ;;   - $ts: The threshold size used for comparison.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. Divide the threshold size by 2.
%  ;;   2. Compare the subset size to this half-threshold.
%  ;;   3. If subset size > half of threshold, return 2; otherwise, return 1.
%  ;;
%  ;; Returns:
%  ;;   - 2: If $subsize > ($ts / 2)
%  ;;   - 1: If $subsize ≤ ($ts / 2)
%  ;; =============================================================================
/*
  (= (categorize_subsize $subsize $ts)  
    (if 
      (> $subsize 
        (// $ts 2)) 2 1))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">categorize_subsize</span>, <span class="pl-var">_subsize9</span>, <span class="pl-var">_ts1</span>, <span class="pl-var">RetVal783</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67238082{vn = ..., cns = ...}</span>, <span class="pl-avar">_67238186{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67238110{vn = ..., cns = ...}</span>, <span class="pl-avar">_67238228{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67238186{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67238228{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-int">2</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-int">2</span>, <span class="pl-int">1</span>, <span class="pl-avar">_67238138{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: copy-db
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Create a copy of a given database by duplicating its contents into a new instance.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The database to be copied (destination for the copied data).
%  ;;   - $old-db-content: The content of the original database that needs to be duplicated.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. If the $old-db-content is empty, return the original database as is.
%  ;;   2. Otherwise, add the first element of the content (car-atom) to the new database using `add-reduct`.
%  ;;   3. Recursively process the rest of the content (cdr-atom) to continue copying the remaining data.
%  ;;   
%  ;; Returns:
%  ;;   - A new database instance containing all the data from the original database.
%  ;; =============================================================================
/*
  (= (copy-db $db $old_db_content)  
    (if 
      (== $old_db_content ()) $db 
      (let* 
        ( ( ($head $tail) (decons-atom $old_db_content)) ($67428704 (add-atom $db $head))) 
        (copy-db $db $tail))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'copy-db'</span>, <span class="pl-var">_db69</span>, <span class="pl-var">_old_db_content1</span>, <span class="pl-var">RetVal787</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67430944{vn = ..., cns = ...}</span>, <span class="pl-avar">_67431048{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67430972{vn = ..., cns = ...}</span>, <span class="pl-avar">_67431090{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67431090{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67431048{vn = ..., cns = ...}</span></span> , 
     _67431176{$P1_CODE_391} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_391</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [      _head     ,     _tail     ],
               [   decons-atom  ,_old_db_content]], 
             [ <span class="pl-var">D</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'add-atom'</span>, <span class="pl-var">_db</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'copy-db'</span>, <span class="pl-var">_db</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_old_db_content</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">F</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'add-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'copy-db'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">P1_CODE_RESULT_391</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_67431176{$P1_CODE_391}</span>, <span class="pl-avar">_67431000{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: add_n_atoms_to_db
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Add a specified number of atoms to a given database recursively.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The database to which atoms will be added.
%  ;;   - $n: The number of atoms to add to the database.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. If $n is less than or equal to 0, return the database as is (base case for recursion).
%  ;;   2. Otherwise, add a new atom to the database using `add-atom` (assumed to add "Pattern").
%  ;;   3. Recursively call the function, reducing $n by 1, to continue adding atoms until the count is reached.
%  ;;
%  ;; Returns:
%  ;;   - The database with the specified number of atoms added.
%  ;; =============================================================================
/*
  (= (add_n_atoms_to_db $db $n)  
    (if 
      (<= $n 0) $db 
      (let* 
        ( ($67853876 (add-atom $db Pattern))) 
        (add_n_atoms_to_db $db 
          (- $n 1)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">add_n_atoms_to_db</span>, <span class="pl-var">_db73</span>, <span class="pl-var">_n5</span>, <span class="pl-var">RetVal791</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67855926{vn = ..., cns = ...}</span>, <span class="pl-avar">_67856030{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67855954{vn = ..., cns = ...}</span>, <span class="pl-avar">_67856072{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67856072{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;=</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67856030{vn = ..., cns = ...}</span></span> , 
     _67856158{$P1_CODE_395} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_395</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">D</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'add-atom'</span>, <span class="pl-var">_db</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">add_n_atoms_to_db</span>, 
             <span class="pl-var">_db</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_n</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'add-atom'</span>, <span class="pl-var">E</span>, <span class="pl-atom">'Pattern'</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_n</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">G</span>, <span class="pl-int">1</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">add_n_atoms_to_db</span>, <span class="pl-var">F</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_395</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_67856158{$P1_CODE_395}</span>, <span class="pl-avar">_67855982{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: copy-and-add-atom
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Create a copy of the given database and add a specified number of atoms to the new database.
%  ;;   This function ensures that the contents of the original database are duplicated into a new instance,
%  ;;   and then it adds a specified number of atoms to the new database.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The original database to be copied.
%  ;;   - $n: The number of atoms to add to the new database.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. If $n is less than or equal to 0, return the original database without any modifications.
%  ;;   2. Otherwise, create a new database by copying the contents of $db using `copy-db`.
%  ;;   3. Add atoms to the new database by calling `add_n_atoms_to_db` with the new database and $n.
%  ;;
%  ;; Returns:
%  ;;   - A new database instance, containing the original database's data and the additional atoms added.
%  ;; =============================================================================
/*
  (= (copy-and-add-atom $db $n)  
    (if 
      (<= $n 0) $db 
      (let* (($_ (copy-db (new-space) ((collapse (get-atoms $db))))))) 
      (add_n_atoms_to_db $db $n)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'copy-and-add-atom'</span>, <span class="pl-var">_db77</span>, <span class="pl-var">_n9</span>, <span class="pl-var">RetVal795</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68196518{vn = ..., cns = ...}</span>, <span class="pl-avar">_68196622{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68196546{vn = ..., cns = ...}</span>, <span class="pl-avar">_68196664{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68196664{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;=</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68196622{vn = ..., cns = ...}</span></span> , 
     <span class="pl-atom">s</span>( <span class="pl-atom">'let*'</span>, 
       [ [ <span class="pl-anon">_</span>, 
           [ <span class="pl-atom">'copy-db'</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'new-space'</span></span>]</span>, 
             [ [ <span class="pl-atom">collapse</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">_db</span></span>]</span>]]]]], 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68196622{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68196664{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">add_n_atoms_to_db</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_68196574{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: duplicate-and-expand-space
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Create a copy of the given space and add a specified number of atoms to the new space.
%  ;;   This function ensures that all the contents of the original space are duplicated into a new space instance,
%  ;;   and then a specified number of atoms are added to the new space.
%  ;;
%  ;; Parameters:
%  ;;   - $space: The original space to be copied.
%  ;;   - $n: The number of atoms to add to the new space.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. Copy the contents of the original space into a new space instance using `copy-db` and `collapse`.
%  ;;   2. Add atoms to the new space by calling `add_n_atoms_to_db` with the new space and $n.
%  ;;
%  ;; Returns:
%  ;;   - A new space instance containing the original space's data and the additional atoms added.
%  ;; =============================================================================
/*
  (= (duplicate-and-expand-space $space $n)  
    (let* 
      ( ($che (collapse (get-atoms $space))) ($new_db (copy-db (new-space) $che))) 
      (add_n_atoms_to_db $new_db $n)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'duplicate-and-expand-space'</span>, <span class="pl-var">_space5</span>, <span class="pl-var">_n13</span>, <span class="pl-var">RetVal799</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68452050{vn = ..., cns = ...}</span>, <span class="pl-avar">_68452154{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68452078{vn = ..., cns = ...}</span>, <span class="pl-avar">_68452196{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">B</span><span class="pl-infix">=</span><span class="pl-var">_space</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">B</span>, <span class="pl-var">A</span></span>)</span></span>, 
       _68452258{$_che}) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'new-space'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68452258{$_che}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'copy-db'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_68452318{$_new_db}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68452318{$_new_db}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68452196{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">add_n_atoms_to_db</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_68452106{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: copy-db-by-size
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Create a copy of the given database up to a specified size. This function ensures that the contents of the original 
%  ;;   database are duplicated into a new database instance until the specified size is reached.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The new database instance where the contents of the original database will be copied.
%  ;;   - $old-db-content: The contents of the original database that need to be copied.
%  ;;   - $n: The current count of atoms added to the new database.
%  ;;   - $size: The maximum number of atoms to be copied to the new database.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. If the $old-db-content is empty or the current count $n has reached the specified $size, return the current database ($db).
%  ;;   2. Otherwise, add the first atom of $old-db-content to the new database using `add-atom`.
%  ;;   3. Recursively call the function, incrementing $n by 1, to continue copying until the size limit is reached.
%  ;;
%  ;; Returns:
%  ;;   - A new database instance containing the first $size atoms from the original database.
%  ;; =============================================================================
%  ; (= (copy-db-by-size $db $old-db-content $n $size)
%  ;     (if (or (== $old-db-content ()) (>= $n $size)) $db
%  ;         (let* ( ($_ (add-atom $db (car-atom $old-db-content)) ))
%  ;             (copy-db-by-size $db (cdr-atom $old-db-content) (+ $n 1) $size)
%  ;         )
%  ;     )
%  ; )
/*
  (= (copy-db-by-size $db $old_db_content $n $size)  
    (let* 
      ( ($first_bool (== $old_db_content ())) 
        ($second_bool (>= $n $size)) 
        ($third_bool (or $first_bool $second_bool)) 
        ($next_num (+ $n 1))) 
      (if $third_bool $db 
        (let* 
          ( ( ($head $tail) (decons-atom $old_db_content)) ($68768616 (add-atom $db $head))) 
          (copy-db-by-size $db $tail $next_num $size)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'copy-db-by-size'</span>, 
     <span class="pl-var">_db81</span>, <span class="pl-var">_old_db_content5</span>, <span class="pl-var">_n17</span>, 
     <span class="pl-var">_size1</span>, <span class="pl-var">RetVal803</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68772012{vn = ..., cns = ...}</span>, <span class="pl-avar">_68772172{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68772040{vn = ..., cns = ...}</span>, <span class="pl-avar">_68772214{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68772068{vn = ..., cns = ...}</span>, <span class="pl-avar">_68772256{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68772096{vn = ..., cns = ...}</span>, <span class="pl-avar">_68772298{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68772214{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-avar">_68772360{$_first_bool}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68772256{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68772298{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;=</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_68772414{$_second_bool}</span></span>)</span> , 
     <span class="pl-atom">call_for_unit</span>( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">call_as_prolog</span>(<span class="pl-args"><span class="pl-var">_first_bool</span></span>)</span><span class="pl-infix">;</span><span class="pl-compound"><span class="pl-functor">call_as_prolog</span>(<span class="pl-args"><span class="pl-var">_second_bool</span></span>)</span></span>, 
       <span class="pl-var">_third_bool</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68772256{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-int">1</span>, <span class="pl-avar">_68772502{$_next_num}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68772454{$_third_bool}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68772172{vn = ..., cns = ...}</span></span> , 
     _68772552{$P1_CODE_399} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_399</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [      _head     ,     _tail     ],
               [   decons-atom  ,_old_db_content]], 
             [ <span class="pl-var">G</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'add-atom'</span>, <span class="pl-var">_db</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">'copy-db-by-size'</span>, <span class="pl-var">_db</span>, <span class="pl-var">_tail</span>, 
             <span class="pl-var">_next_num</span>, <span class="pl-var">_size</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_old_db_content</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">I</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'add-atom'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_next_num</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_size</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'copy-db-by-size'</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P1_CODE_RESULT_399</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_68772552{$P1_CODE_399}</span>, <span class="pl-avar">_68772124{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: subsample
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Adjust the size of a given database to match a specified subset size ($subsize).
%  ;;   If the current size of the database is greater than or equal to the subset size,
%  ;;   it returns the original database. Otherwise, it categorizes the database and either 
%  ;;   adds or removes atoms to achieve the desired subset size.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The database to be subsampled.
%  ;;   - $subsize: The target subset size for the database.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. If the current size of the database is less than or equal to the target subset size, return the database as is.
%  ;;   2. Otherwise, categorize the database using `categorize_subsize` to decide whether atoms should be added or removed.
%  ;;   3. If categorized as group 1, add atoms to the database using `duplicate-and-expand-space`.
%  ;;   4. If categorized as group 2, remove atoms by using `copy-db-by-size` to adjust the size to the desired subset size.
%  ;;
%  ;; Returns:
%  ;;   - A new database instance with a size adjusted to match the target subset size ($subsize).
%  ;; =============================================================================
/*
  (= (subsample $db $subsize)  
    (if 
      (<= 
        (db_size $db) $subsize) $db 
      (case 
        (categorize_subsize $subsize 
          (db_size $db)) 
        ( (1 (duplicate-and-expand-space $db (- (* $subsize 2) (db_size $db)))) 
          (2 (copy-db-by-size (new-space) (collapse (get-atoms $db)) 0 (- (* $subsize 2) (db_size $db)))) 
          ($69569372 (copy-db-by-size (new-space) (collapse (get-atoms $db)) 0 (- (* $subsize 2) (db_size $db))))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">subsample</span>, <span class="pl-var">_db85</span>, <span class="pl-var">_subsize13</span>, <span class="pl-var">RetVal807</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69572006{vn = ..., cns = ...}</span>, <span class="pl-avar">_69572110{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69572034{vn = ..., cns = ...}</span>, <span class="pl-avar">_69572152{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69572110{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69572152{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;=</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69572110{vn = ..., cns = ...}</span></span> , 
     _69572258{$P1_CODE_403} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">CASE_RESULT_P1_CODE_RESULT_403_1</span>, 
         [ <span class="pl-atom">case</span>, 
           [ <span class="pl-atom">categorize_subsize</span>, 
             <span class="pl-var">_subsize</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-var">_db</span></span>]</span>], 
           [ [ <span class="pl-int">1</span>, 
               [ <span class="pl-atom">'duplicate-and-expand-space'</span>, 
                 <span class="pl-var">_db</span>, 
                 [ <span class="pl-atom">-</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">_subsize</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-var">_db</span></span>]</span>]]], 
             [ <span class="pl-int">2</span>, 
               [ <span class="pl-atom">'copy-db-by-size'</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'new-space'</span></span>]</span>, 
                 [ <span class="pl-atom">collapse</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">_db</span></span>]</span>], 
                 <span class="pl-int">0</span>, 
                 [ <span class="pl-atom">-</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">_subsize</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-var">_db</span></span>]</span>]]], 
             [ <span class="pl-var">F</span>, 
               [ <span class="pl-atom">'copy-db-by-size'</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'new-space'</span></span>]</span>, 
                 [ <span class="pl-atom">collapse</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">_db</span></span>]</span>], 
                 <span class="pl-int">0</span>, 
                 [ <span class="pl-atom">-</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">_subsize</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-var">_db</span></span>]</span>]]]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">categorize_subsize</span>, <span class="pl-var">G</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
           <span class="pl-var">CASE_SWITCH_19</span> =  
                
             [ <span class="pl-atom">caseOption</span>( <span class="pl-int">1</span>, 
                 <span class="pl-var">K</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_subsize</span>, <span class="pl-var">_db</span></span>]</span>, 
                 ( <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span>  ,
                   <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">M</span>, <span class="pl-int">2</span>, <span class="pl-var">N</span></span>)</span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span></span>)</span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">N</span>, <span class="pl-var">P</span>, <span class="pl-var">Q</span></span>)</span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'duplicate-and-expand-space'</span>, <span class="pl-var">L</span>, <span class="pl-var">Q</span>, <span class="pl-var">K</span></span>)</span>)), 
               <span class="pl-atom">caseOption</span>( <span class="pl-int">2</span>, 
                 <span class="pl-var">R</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_subsize</span>, <span class="pl-var">_db</span></span>]</span>, 
                 ( <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'new-space'</span>, <span class="pl-var">S</span></span>)</span>  ,
                   <span class="pl-atom">findall_ne</span>( <span class="pl-var">T</span>, 
                     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">U</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">U</span>, <span class="pl-var">T</span></span>)</span></span>, 
                     <span class="pl-var">V</span>) , 
                   <span class="pl-compound pl-level-0"><span class="pl-var">W</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">W</span>, <span class="pl-int">2</span>, <span class="pl-var">X</span></span>)</span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-var">Y</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-var">Y</span>, <span class="pl-var">Z</span></span>)</span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">X</span>, <span class="pl-var">Z</span>, <span class="pl-var">A1</span></span>)</span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'copy-db-by-size'</span>, <span class="pl-var">S</span>, <span class="pl-var">V</span>, <span class="pl-int">0</span>, <span class="pl-var">A1</span>, <span class="pl-var">R</span></span>)</span>)), 
               <span class="pl-atom">caseOption</span>( <span class="pl-var">F</span>, 
                 <span class="pl-var">B1</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_subsize</span>, <span class="pl-var">_db</span></span>]</span>, 
                 ( <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'new-space'</span>, <span class="pl-var">C1</span></span>)</span>  ,
                   <span class="pl-atom">findall_ne</span>( <span class="pl-var">D1</span>, 
                     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">E1</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">E1</span>, <span class="pl-var">D1</span></span>)</span></span>, 
                     <span class="pl-var">F1</span>) , 
                   <span class="pl-compound pl-level-0"><span class="pl-var">G1</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">G1</span>, <span class="pl-int">2</span>, <span class="pl-var">H1</span></span>)</span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-var">I1</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-var">I1</span>, <span class="pl-var">J1</span></span>)</span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">H1</span>, <span class="pl-var">J1</span>, <span class="pl-var">K1</span></span>)</span> , 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'copy-db-by-size'</span>, <span class="pl-var">C1</span>, <span class="pl-var">F1</span>, <span class="pl-int">0</span>, <span class="pl-var">K1</span>, <span class="pl-var">B1</span></span>)</span>))] , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">select_case</span>(<span class="pl-args"><span class="pl-var">CASE_SWITCH_19</span>, <span class="pl-var">J</span>, <span class="pl-var">CASE_RESULT_P1_CODE_RESULT_403_1</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_69572258{$P1_CODE_403}</span>, <span class="pl-avar">_69572062{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: emp-tv-subsmp
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Calculates the empirical truth value for a given pattern in a subsampled version of a database.
%  ;;   The function first creates a subsample of the database of the specified size and then computes 
%  ;;   the empirical truth value based on that subsample.
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: The pattern for which the empirical truth value is to be calculated.
%  ;;   - $db: The database from which the subsample will be drawn.
%  ;;   - $subsize: The size of the subsample to be used.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. Use the `subsample-py` function to generate a subsample of the database of the desired size.
%  ;;   2. Call the `emp-tv` function to compute the empirical truth value for the pattern based on the subsample.
%  ;;
%  ;; Returns:
%  ;;   - The empirical truth value for the pattern based on the subsampled database.
%  ;; =============================================================================
/*
  (= (emp-tv-subsmp $pattern $db $subsize)  
    (let* 
      ( ($space (subsample-py $db $subsize))) 
      (emp-tv $pattern $space)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'emp-tv-subsmp'</span>, <span class="pl-var">_pattern77</span>, <span class="pl-var">_db89</span>, <span class="pl-var">_subsize17</span>, <span class="pl-var">RetVal811</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70395166{vn = ..., cns = ...}</span>, <span class="pl-avar">_70395298{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70395194{vn = ..., cns = ...}</span>, <span class="pl-avar">_70395340{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70395222{vn = ..., cns = ...}</span>, <span class="pl-avar">_70395382{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70395340{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70395382{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'subsample-py'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_70395450{$_space}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70395298{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70395450{$_space}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_70395250{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: emp-tv-bs-helper
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   This function performs bootstrapping to estimate the empirical truth value of a given pattern.
%  ;;   It recursively generates multiple subsamples from the database, computes the empirical truth value 
%  ;;   for each subsample, and aggregates the results.
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: The pattern for which the empirical truth value is to be calculated.
%  ;;   - $db: The database from which the subsamples will be drawn.
%  ;;   - $n-resample: The number of resamples to perform.
%  ;;   - $subsize: The size of each subsample.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. If the number of resamples is 0, return an empty list (base case).
%  ;;   2. Otherwise, compute the empirical truth value for a random subsample of the database using `emp-tv-subsmp`.
%  ;;   3. Recursively call the function to perform the remaining resamples.
%  ;;   4. Add the empirical truth value for the current subsample to the list of results.
%  ;;
%  ;; Returns:
%  ;;   - A list containing the empirical truth values for the pattern, calculated from multiple subsamples.
%  ;; =============================================================================
/*
  (= (emp-tv-bs-helper $pattern $db $n_resample $subsize)  
    (if 
      (== $n_resample 0) () 
      (let* 
        ( ($subsample_tv (emp-tv-subsmp $pattern $db $subsize)) ($remaining_esstvs (emp-tv-bs-helper $pattern $db (- $n_resample 1) $subsize))) 
        (cons-atom $subsample_tv $remaining_esstvs))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'emp-tv-bs-helper'</span>, 
     <span class="pl-var">_pattern81</span>,  <span class="pl-var">_db93</span>, <span class="pl-var">_n_resample1</span>, <span class="pl-var">_subsize21</span>, <span class="pl-var">RetVal815</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70624878{vn = ..., cns = ...}</span>, <span class="pl-avar">_70625038{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70624906{vn = ..., cns = ...}</span>, <span class="pl-avar">_70625080{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70624934{vn = ..., cns = ...}</span>, <span class="pl-avar">_70625122{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70624962{vn = ..., cns = ...}</span>, <span class="pl-avar">_70625164{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70625122{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _70625244{$P1_CODE_407} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_407</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_subsample_tv</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-tv-subsmp'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_remaining_esstvs</span>, 
               [ <span class="pl-atom">'emp-tv-bs-helper'</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_n_resample</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 <span class="pl-var">_subsize</span>]]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_subsample_tv</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-tv-subsmp'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">_subsample_tv</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_n_resample</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">H</span>, <span class="pl-int">1</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-tv-bs-helper'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">_remaining_esstvs</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_subsample_tv</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_remaining_esstvs</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_407</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_70625244{$P1_CODE_407}</span>, <span class="pl-avar">_70624990{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Add the result to the list and continue
%  ;; =============================================================================
%  ;; Function: subsmp-size
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Calculates the sub-sample size based on the given pattern, database size, 
%  ;;   support estimate, and a minimum sub-sample size. The function computes an 
%  ;;   appropriate sub-sample size that ensures statistical robustness.
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: The pattern to be matched.
%  ;;   - $db-size: The size of the database.
%  ;;   - $support-estimate: The estimated support value of the pattern.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. Compute the number of conjuncts in the pattern using `n_conjuncts`.
%  ;;   2. Calculate the alpha value, which is the ratio of the support estimate 
%  ;;      to the database size raised to the power of the number of conjuncts.
%  ;;   3. Calculate the base by dividing the database size by ten times alpha.
%  ;;   4. Compute the result by raising the base to the power of 1/$nc.
%  ;;   5. Return the maximum between the computed result and the minimum of 
%  ;;      the minimum sub-sample size and database size.
%  ;;
%  ;; Returns:
%  ;;   - The calculated sub-sample size, ensuring it is at least the minimum 
%  ;;     size and does not exceed the database size.
%  ;; =============================================================================
/*
  (= (subsmp-size $pattern $db_size $support_estimate)  
    (let* 
      ( ($nc (n_conjuncts $pattern)) 
        ( ($min_size) (10)) 
        ($alpha (// $support_estimate (pow-math $db_size $nc))) 
        ($base (// $db_size (* 10 $alpha))) 
        ($power (// 1 $nc)) 
        ($res (pow-math $base $power))) 
      (max $res 
        (min $min_size $db_size))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'subsmp-size'</span>, 
     <span class="pl-var">_pattern85</span>,  <span class="pl-var">_db_size1</span>, <span class="pl-var">_support_estimate1</span>, <span class="pl-var">RetVal819</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71255752{vn = ..., cns = ...}</span>, <span class="pl-avar">_71255884{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71255780{vn = ..., cns = ...}</span>, <span class="pl-avar">_71255926{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71255808{vn = ..., cns = ...}</span>, <span class="pl-avar">_71255968{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71255884{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">n_conjuncts</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_71256022{$_nc}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-int">10</span></span>]</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_71256074{$_min_size}</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71255968{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71255926{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71256022{$_nc}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'pow-math'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_71256156{$_alpha}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71255926{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71256156{$_alpha}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-int">10</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-avar">_71256226{$_base}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71256022{$_nc}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-int">1</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-avar">_71256268{$_power}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71256226{$_base}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71256268{$_power}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'pow-math'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span>, <span class="pl-avar">_71256322{$_res}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">12</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71256322{$_res}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71256074{$_min_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">14</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71255926{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">min</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">14</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">15</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">max</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">12</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">15</span></span>)</span>, <span class="pl-avar">_71255836{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: emp-tv-bs
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Calculates the empirical truth value using bootstrapping (resampling) for a given pattern 
%  ;;   and database, incorporating multiple resamples and subsample sizes. The function 
%  ;;   first checks if the subsample size is smaller than the database size. If so, it performs 
%  ;;   bootstrapping by resampling the database multiple times, calculating the empirical truth 
%  ;;   value for each resample, and returning the average. If the subsample size is greater than 
%  ;;   or equal to the database size, it directly computes the empirical truth value.
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: The pattern for which the empirical truth value is to be calculated.
%  ;;   - $db: The database in which the pattern's empirical truth value is to be calculated.
%  ;;   - $n-resample: The number of resamples to perform during bootstrapping.
%  ;;   - $subsize: The subsample size used in the resampling process.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. If the subsample size is less than the database size, the function performs resampling:
%  ;;      - Calls `emp-tv-bs-helper` to generate multiple empirical truth values (one for each resample).
%  ;;      - Averages the resampled empirical truth values using `avrg-tv-py`.
%  ;;      - Calls `mk-stv` to create a simple truth value from the mean and variance of the empirical truth values.
%  ;;   2. If the subsample size is greater than or equal to the database size, it directly calculates the empirical truth value using `emp-tv`.
%  ;;
%  ;; Returns:
%  ;;   - If subsize is smaller than the database size: A simple truth value based on the average empirical truth values from the resamples.
%  ;;   - If subsize is greater than or equal to the database size: The direct empirical truth value of the pattern.
%  ;; =============================================================================
/*
  (= (emp-tv-bs $pattern $db $n_resample $subsize)  
    (if 
      (< $subsize 
        (db_size $db)) 
      (let* 
        ( ($esstvs (emp-tv-bs-helper $pattern $db $n_resample $subsize)) 
          ( (EMPTV $mean $variance) (avrg-tv-py $esstvs)) 
          ($mk_stv_val (mk_stv $mean $variance)) 
          ($FinalAnswer (cons-atom EMPTV $mk_stv_val))) $FinalAnswer) 
      (emp-tv $pattern $db)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'emp-tv-bs'</span>, 
     <span class="pl-var">_pattern89</span>,  <span class="pl-var">_db97</span>, <span class="pl-var">_n_resample5</span>, <span class="pl-var">_subsize25</span>, <span class="pl-var">RetVal823</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71735916{vn = ..., cns = ...}</span>, <span class="pl-avar">_71736076{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71735944{vn = ..., cns = ...}</span>, <span class="pl-avar">_71736118{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71735972{vn = ..., cns = ...}</span>, <span class="pl-avar">_71736160{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71736000{vn = ..., cns = ...}</span>, <span class="pl-avar">_71736202{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71736202{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71736118{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     _71736296{$P1_CODE_411} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_411</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_esstvs</span>, 
               [ <span class="pl-atom">'emp-tv-bs-helper'</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>, 
                 <span class="pl-var">_n_resample</span>, <span class="pl-var">_subsize</span>]], 
             [ [   EMPTV   ,  _mean   ,_variance ],
               [ avrg-tv-py, _esstvs  ]], 
             [ <span class="pl-var">_mk_stv_val</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">mk_stv</span>, <span class="pl-var">_mean</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">FinalAnswer</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">'EMPTV'</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           <span class="pl-var">FinalAnswer</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_n_resample</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-tv-bs-helper'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">_esstvs</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_esstvs</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'avrg-tv-py'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
           <span class="pl-atom">unify_with_occurs_check</span>( <span class="pl-var">J</span>, [
             <span class="pl-atom">'EMPTV'</span>, <span class="pl-var">_mean</span>, <span class="pl-var">_variance</span>]) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_mean</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_variance</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">mk_stv</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">_mk_stv_val</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_mk_stv_val</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">'EMPTV'</span>, <span class="pl-var">M</span>, <span class="pl-var">FinalAnswer</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_411</span><span class="pl-infix">=</span><span class="pl-var">FinalAnswer</span></span>)) , 
     _71736804{$P1_CODE_412} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_412</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P1_CODE_RESULT_412</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_71736296{$P1_CODE_411}</span>, <span class="pl-avar">_71736804{$P1_CODE_412}</span>, <span class="pl-avar">_71736028{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; If subsize >= db size, directly return empirical truth value
%  ;; =============================================================================
%  ;; Function: do_emp_tv
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Calculates the empirical truth value for a given pattern in a database.
%  ;;   It processes the database to obtain a sequence of atoms, estimates the joint truth value (JTV),
%  ;;   and then uses the support estimate calculator to compute the final empirical truth value.
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: The pattern for which the empirical truth value is to be calculated.
%  ;;   - $db: The database in which the pattern's empirical truth value is to be calculated.
%  ;;   - $db_ratio: The ratio used to scale the database size.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. Extract the sequence of atoms from the database using `get-atoms` and `collapse`.
%  ;;   2. Estimate the joint truth value (JTV) for the given pattern and database using `ji_tv_est`.
%  ;;   3. Extract the mean and confidence values from the joint truth estimate.
%  ;;   4. Use the `support_estimate_calculator` to compute the empirical truth value based on the mean and database ratio.
%  ;;
%  ;; Returns:
%  ;;   - The computed empirical truth value for the given pattern in the database.
%  ;; =============================================================================
/*
  (= (do_emp_tv $pattern $db $db_ratio)  
    (let* 
      ( ($jte (do-ji-tv-est $db $pattern)) (($_ $mean $_) $jte)) 
      (emp_tv_pbs $pattern $db $mean $db_ratio)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">do_emp_tv</span>, <span class="pl-var">_pattern93</span>, <span class="pl-var">_db101</span>, <span class="pl-var">_db_ratio5</span>, <span class="pl-var">RetVal827</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72453574{vn = ..., cns = ...}</span>, <span class="pl-avar">_72453706{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72453602{vn = ..., cns = ...}</span>, <span class="pl-avar">_72453748{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72453630{vn = ..., cns = ...}</span>, <span class="pl-avar">_72453790{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72453748{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72453706{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'do-ji-tv-est'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_72453858{$_jte}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72453858{$_jte}</span></span> , 
     <span class="pl-atom">unify_with_occurs_check</span>( <span class="pl-var">C</span>, [
       <span class="pl-anon">_</span>, <span class="pl-avar">_72453908{$_mean}</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72453706{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72453748{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72453908{$_mean}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72453790{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">emp_tv_pbs</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_72453658{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (emp_tv_pbs $pattern $db $prob_estimate $db_ratio)  
    (let* 
      ( ($support_estimate (prob_to_support $pattern $db $prob_estimate)) 
        ($db_size (* (db_size $db) $db_ratio)) 
        ($subsize (subsmp-size $pattern $db_size $support_estimate)) 
        (10 10)) 
      (if 
        (> $support_estimate $db_size) 
        (emp-tv-bs $pattern $db 10 $subsize) 
        (emp-tv $pattern $db))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">emp_tv_pbs</span>, 
     <span class="pl-var">_pattern97</span>,  <span class="pl-var">_db105</span>, <span class="pl-var">_prob_estimate5</span>, <span class="pl-var">_db_ratio9</span>, <span class="pl-var">RetVal831</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72785956{vn = ..., cns = ...}</span>, <span class="pl-avar">_72786116{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72785984{vn = ..., cns = ...}</span>, <span class="pl-avar">_72786158{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72786012{vn = ..., cns = ...}</span>, <span class="pl-avar">_72786200{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72786040{vn = ..., cns = ...}</span>, <span class="pl-avar">_72786242{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72786116{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72786158{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72786200{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">prob_to_support</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_72786324{$_support_estimate}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72786158{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72786242{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_72786392{$_db_size}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72786116{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72786392{$_db_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72786324{$_support_estimate}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'subsmp-size'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-avar">_72786460{$_subsize}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72786324{$_support_estimate}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72786392{$_db_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span></span>)</span> , 
     _72786532{$P1_CODE_419} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_419</span>, 
         [ <span class="pl-atom">'emp-tv-bs'</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>, <span class="pl-int">10</span>, 
           <span class="pl-var">_subsize</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-int">10</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-tv-bs'</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">P1_CODE_RESULT_419</span></span>)</span>)) , 
     _72786678{$P1_CODE_420} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_420</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">Q</span>, <span class="pl-var">R</span>, <span class="pl-var">P1_CODE_RESULT_420</span></span>)</span>)) , 
     <span class="pl-atom">s</span>( <span class="pl-atom">if</span>, 
       <span class="pl-var">L</span>, <span class="pl-avar">_72786532{$P1_CODE_419}</span>, <span class="pl-avar">_72786678{$P1_CODE_420}</span>, 
       _72786068{vn = ..., cns = ...})</span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/truth-values/metta_log/emp-tv.metta at 2025-10-03T12:04:58+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
