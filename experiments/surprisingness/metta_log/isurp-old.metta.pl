%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/surprisingness/metta_log/isurp-old.metta at 2025-10-17T09:14:27+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

%  ; ;;types
%  ; (: total_counts (-> Pattern SpaceType Number))
%  ; ; (: accumulator-x (-> (List Number) Number))
%  ; ; (: accumulator-x (-> (List Number) Number Number))
%  ; (: n_conjuncts_new (-> Pattern Number))
%  ; ; (: compute-component-support (-> (List Pattern) SpaceType (List Number)))
%  ; (: compute-component-support (-> Any SpaceType Any))
%  ; (: ptrn-support (-> Pattern SpaceType Number))
%  ; (: prob (-> Pattern SpaceType Number Number))
%  ; ; (: add-pattern (-> (List Pattern) SpaceType Pattern))
%  ; ; (: blk-prob (-> (List Pattern) SpaceType Number Number))
%  ; ; (: iprob-old (-> (MList Pattern)) SpaceType Number)
%  ; ; (: iprob_ (-> (MList Pattern) SpaceType Number (List Number)))
%  ; ; (: iprob (-> (MList Pattern)) SpaceType Number Number)
%  ; ; (: isurp-old_ (-> (List (List Pattern)) SpaceType Number (List Number)))
%  ; (: isurp-old (-> Pattern SpaceType Bool Number))
%  ;;;;;;;;;;;;;;;;;;;;
%  ;;High-Level Steps;;
%  ;;;;;;;;;;;;;;;;;;;;
%  ;; - Compute the probability of the pattern (pattern_prob).
%  ;; - Generate all partitions excluding the pattern.
%  ;; - Calculate the probabilities of all partitions (iprob).
%  ;; - Identify the minimum and maximum probabilities (emin, emax) of the partitions.
%  ;; - Compute the distance of pattern_prob from the interval [emin,emax]
%  ;; - Normalize the distance if required.
%  ;; - Bound the final surprisingness value to a maximum of 1.0
%  ;;The total count is implemented using the binomial coefficient and the power of 
%  ;;the database size and number of conjuncts, because in the classic implementation, 
%  ;;the documentation recommends using powers — but the actual implementation uses the binomial coefficient.
%  ;;Calculates the total possible counts for a pattern based on database size 
%  ;;and the number of conjunctive clauses in the pattern.
%  ;(=(total_counts $pattern $db) (pow (db_size $db) (n_conjuncts_new $pattern)))
%  ;; Function: total_counts
%  ;; Description: Calculates the total possible counts for a pattern using the binomial coefficient.
%  ;; Parameters:
%  ;;   - $pattern: The pattern whose total count is to be estimated.
%  ;;   - $db: The database context in which the pattern appears.
%  ;; Returns:
%  ;;   - The total number of possible combinations based on database size and number of conjunctive clauses.
/*
  (= (total_counts $pattern $db)  
    (cal_binomial 
      (db_size $db) 
      (n_conjuncts_new $pattern)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">total_counts</span>, <span class="pl-var">_pattern73</span>, <span class="pl-var">_db45</span>, <span class="pl-var">RetVal831</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70869226{vn = ..., cns = ...}</span>, <span class="pl-avar">_70869330{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70869254{vn = ..., cns = ...}</span>, <span class="pl-avar">_70869372{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70869372{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70869330{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">n_conjuncts_new</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">cal_binomial</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_70869282{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Function: accumulator-x
%  ;; Description: Computes the product of a list of numbers recursively
%  ;; Parameters:
%  ;;   - $num_list: A list of numbers to multiply.
%  ;;   - $prev_value (optional): The accumulated product (defaults to 1).
%  ;; Returns:
%  ;;   - The product of all elements in the list as a single number.
/*
  (= (accumulator-x $num_list)  
    (accumulator-x $num_list 1))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'accumulator-x'</span>, <span class="pl-var">_num_list9</span>, <span class="pl-var">RetVal835</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70999838{vn = ..., cns = ...}</span>, <span class="pl-avar">_70999914{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70999914{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'accumulator-x'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">1</span>, <span class="pl-avar">_70999866{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (accumulator-x $num_list $prev_value)  
    (if 
      (== $num_list ()) $prev_value 
      (let 
        ($head $tail) 
        (decons-atom $num_list) 
        (accumulator-x $tail 
          (* $head $prev_value)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'accumulator-x'</span>, <span class="pl-var">_num_list13</span>, <span class="pl-var">_prev_value1</span>, <span class="pl-var">RetVal839</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71134414{vn = ..., cns = ...}</span>, <span class="pl-avar">_71134518{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71134442{vn = ..., cns = ...}</span>, <span class="pl-avar">_71134560{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71134518{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71134560{vn = ..., cns = ...}</span></span> , 
     _71134646{$P1_CODE_455} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_455</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>, <span class="pl-var">_tail</span></span>]</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">_num_list</span></span>]</span>, 
           [ <span class="pl-atom">'accumulator-x'</span>, 
             <span class="pl-var">_tail</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_num_list</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">E</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_prev_value</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'accumulator-x'</span>, <span class="pl-var">F</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_455</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_71134646{$P1_CODE_455}</span>, <span class="pl-avar">_71134470{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;;Recursively calculates the support for each component of a 
/*
  (= (compute-component-support $MeTTa_SP__cps_1 $db)  
    (collapse (sup-num $db (superpose $MeTTa_SP__cps_1))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'compute-component-support'</span>, <span class="pl-var">_cps1</span>, <span class="pl-var">_db49</span>, <span class="pl-var">RetVal843</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71487698{vn = ..., cns = ...}</span>, <span class="pl-avar">_71487802{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71487726{vn = ..., cns = ...}</span>, <span class="pl-avar">_71487844{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       ( <span class="pl-compound pl-level-0"><span class="pl-var">B</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span>  ,
         <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__cps_1</span>, <span class="pl-var">C</span></span>)</span> , 
         <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'sup-num'</span>, <span class="pl-var">B</span>, <span class="pl-var">C</span>, <span class="pl-var">A</span></span>)</span>), 
       _71487754{vn = ..., cns = ...})</span>) ).


%  ;; Calculate the support for each component of the conjunctive 
%  ;; pattern and return the product of their results.
/*
  (= (ptrn-support $pattern $db)  
    (let $cps 
      (get-cnj-clouses $pattern) 
      (accumulator-x (compute-component-support $cps $db))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'ptrn-support'</span>, <span class="pl-var">_pattern77</span>, <span class="pl-var">_db53</span>, <span class="pl-var">RetVal847</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71649860{vn = ..., cns = ...}</span>, <span class="pl-avar">_71649964{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71649888{vn = ..., cns = ...}</span>, <span class="pl-avar">_71650006{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71649964{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-cnj-clouses'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_71650060{$_cps}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71650060{$_cps}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71650006{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'compute-component-support'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'accumulator-x'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_71649916{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Function: prob
%  ; Description: Calculates the probability of a pattern occurring in a given database.
%  ; Parameters:
%  ;   - $pattern: The pattern whose probability is to be calculated.
%  ;   - $db: The database in which the pattern is evaluated.
%  ; Returns:
%  ;   - The probability value as a ratio of the pattern's support to its total possible count.
/*
  (= (prob $pattern $db $total_count)  
    (// 
      (sup-num $db $pattern) $total_count))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">prob</span>, <span class="pl-var">_pattern81</span>, <span class="pl-var">_db57</span>, <span class="pl-var">_total_count1</span>, <span class="pl-var">RetVal851</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71798280{vn = ..., cns = ...}</span>, <span class="pl-avar">_71798412{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71798308{vn = ..., cns = ...}</span>, <span class="pl-avar">_71798454{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71798336{vn = ..., cns = ...}</span>, <span class="pl-avar">_71798496{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71798454{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71798412{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'sup-num'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71798496{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_71798364{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;;Converts a list of blocks into a conjunctive pattern
/*
  (= (add-pattern $blks $db)  
    (let* 
      ( ($pattern (cons-atom , $blks)) ($_ (add-atom $db $pattern))) $pattern))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'add-pattern'</span>, <span class="pl-var">_blks5</span>, <span class="pl-var">_db61</span>, <span class="pl-var">RetVal855</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71951382{vn = ..., cns = ...}</span>, <span class="pl-avar">_71951486{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71951410{vn = ..., cns = ...}</span>, <span class="pl-avar">_71951528{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71951486{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_71951584{$_pattern}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71951528{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71951584{$_pattern}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'add-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_71951438{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_71951584{$_pattern}</span></span></span>) ).


%  ;;Calculates the probability of a block within a partition by first converting 
%  ;;it into a pattern and then computing its probability.
/*
  (= (blk-prob $blk $db $total_count)  
    (let $pattern 
      (cons-atom , $blk) 
      (prob $pattern $db $total_count)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'blk-prob'</span>, <span class="pl-var">_blk5</span>, <span class="pl-var">_db65</span>, <span class="pl-var">_total_count5</span>, <span class="pl-var">RetVal859</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72128324{vn = ..., cns = ...}</span>, <span class="pl-avar">_72128456{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72128352{vn = ..., cns = ...}</span>, <span class="pl-avar">_72128498{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72128380{vn = ..., cns = ...}</span>, <span class="pl-avar">_72128540{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72128456{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_72128596{$_pattern}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72128596{$_pattern}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72128498{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72128540{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">prob</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_72128408{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Function: iprob
%  ; Description: Estimates the probability of each partition under the assumption that blocks 
%  ;              within a partition are independent. It multiplies the probabilities of individual blocks.
%  ; Parameters:
%  ;   - $partition: A list of blocks representing the partition.
%  ;   - $db: The database used to evaluate block probabilities.
%  ; Returns:
%  ;   - The estimated joint probability of the partition, computed by multiplying individual block probabilities.
/*
  (= (iprob-old $MeTTa_SP__partition_5 $db)  
    (accumulator-x (collapse (blk-prob (superpose $MeTTa_SP__partition_5) $db))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'iprob-old'</span>, <span class="pl-var">_partition5</span>, <span class="pl-var">_db69</span>, <span class="pl-var">RetVal863</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72287082{vn = ..., cns = ...}</span>, <span class="pl-avar">_72287186{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72287110{vn = ..., cns = ...}</span>, <span class="pl-avar">_72287228{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       ( <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__partition_5</span>, <span class="pl-var">B</span></span>)</span>  ,
         <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'blk-prob'</span>, <span class="pl-var">B</span>, <span class="pl-var">C</span>, <span class="pl-var">A</span></span>)</span>), 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'accumulator-x'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_72287138{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;;Recursive steps for iprob
/*
  (= (iprob_ $partition $db $total_count)  
    (if 
      (== $partition ()) () 
      (let* 
        ( ( ($head $tail) (decons-atom $partition)) 
          ($prob (blk-prob $head $db $total_count)) 
          ($dummy (iprob_ $tail $db $total_count))) 
        (cons-atom $prob $dummy))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">iprob_</span>, <span class="pl-var">_partition9</span>, <span class="pl-var">_db73</span>, <span class="pl-var">_total_count9</span>, <span class="pl-var">RetVal867</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72508566{vn = ..., cns = ...}</span>, <span class="pl-avar">_72508698{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72508594{vn = ..., cns = ...}</span>, <span class="pl-avar">_72508740{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72508622{vn = ..., cns = ...}</span>, <span class="pl-avar">_72508782{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72508698{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _72508862{$P1_CODE_459} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_459</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom,_partition ]], 
             [ <span class="pl-var">_prob</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'blk-prob'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_dummy</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">iprob_</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_prob</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_total_count</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'blk-prob'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_prob</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_total_count</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">iprob_</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">_dummy</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_prob</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_dummy</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_459</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_72508862{$P1_CODE_459}</span>, <span class="pl-avar">_72508650{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;;This is the recursive version of iprob-old. While the non-deterministic (or above) 
%  ;;implementation works within this file, it causes issues when used from other files.
/*
  (= (iprob $partition $db $total_count)  
    (let $products 
      (iprob_ $partition $db $total_count) 
      (accumulator-x $products)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">iprob</span>, <span class="pl-var">_partition13</span>, <span class="pl-var">_db77</span>, <span class="pl-var">_total_count13</span>, <span class="pl-var">RetVal871</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73028430{vn = ..., cns = ...}</span>, <span class="pl-avar">_73028562{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73028458{vn = ..., cns = ...}</span>, <span class="pl-avar">_73028604{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73028486{vn = ..., cns = ...}</span>, <span class="pl-avar">_73028646{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73028562{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73028604{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73028646{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">iprob_</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_73028728{$_products}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73028728{$_products}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'accumulator-x'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_73028514{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;;Recursive steps for isurp
/*
  (= (isurp-old_ $partitions $db $total_count)  
    (if 
      (== $partitions ()) () 
      (let* 
        ( ( ($head $tail) (decons-atom $partitions)) 
          ($res (iprob $head $db $total_count)) 
          ($dummy (isurp-old_ $tail $db $total_count))) 
        (cons-atom $res $dummy))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'isurp-old_'</span>, 
     <span class="pl-var">_partitions1</span>,  <span class="pl-var">_db81</span>, <span class="pl-var">_total_count17</span>, <span class="pl-var">RetVal875</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73236522{vn = ..., cns = ...}</span>, <span class="pl-avar">_73236654{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73236550{vn = ..., cns = ...}</span>, <span class="pl-avar">_73236696{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73236578{vn = ..., cns = ...}</span>, <span class="pl-avar">_73236738{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73236654{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _73236818{$P1_CODE_463} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_463</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom,_partitions]], 
             [ <span class="pl-var">_res</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">iprob</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_dummy</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'isurp-old_'</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_res</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_partitions</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_total_count</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">iprob</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_res</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_total_count</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'isurp-old_'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">_dummy</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_res</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_dummy</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_463</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_73236818{$P1_CODE_463}</span>, <span class="pl-avar">_73236606{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Function: isurp-old
%  ;; Description: Computes the I-surprisingness of a conjunctive pattern based on its probability 
%  ;;              and the distribution of probabilities from independently generated partitions. 
%  ;;              It measures how far the pattern's probability deviates from the expected interval 
%  ;;              defined by the minimum and maximum probabilities. Optionally, the surprisingness 
%  ;;              value can be normalized.
%  ; Parameters:
%  ;   - $pattern: A conjunctive pattern whose surprisingness is to be evaluated.
%  ;   - $db: The database or corpus used for evaluating probabilities.
%  ;   - $normalize: A boolean flag indicating whether to normalize the surprisingness by the pattern's probability.
%  ; Returns:
%  ;   - A numeric value representing the surprisingness score, optionally normalized and capped at 1.0.
/*
  (= (isurp-old $pattern $db $normalize)  
    (let* 
      ( (() (println! "==== isurp-old surprisingness =====")) 
        ($total_count (total_counts $pattern $db)) 
        (() (println! "Total counts: " $total_count)) 
        ($pattern_prob (prob $pattern $db $total_count)) 
        (() (println! "Pattern probability: " $pattern_prob)) 
        ($partitions (generet-partition-without-pattern $pattern)) 
        (() (println! "Generated partitions: " $partitions)) 
        ($results (isurp-old_ $partitions $db $total_count)) 
        (() (println! "Partition probabilities: " $results)) 
        ($emin (min-atom $results)) 
        (() (println! "Minimum partition probability (emin): " $emin)) 
        ($emax (max-atom $results)) 
        (() (println! "Maximum partition probability (emax): " $emax)) 
        ($dst (dst_from_interval $emin $emax $pattern_prob)) 
        (() (println! "Distance from interval: " $dst))) 
      (min ((if $normalize (// $dst (max $emax $pattern_prob)) $dst) 1.0))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'isurp-old'</span>, <span class="pl-var">_pattern85</span>, <span class="pl-var">_db85</span>, <span class="pl-var">_normalize1</span>, <span class="pl-var">RetVal879</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73988018{vn = ..., cns = ...}</span>, <span class="pl-avar">_73988150{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73988046{vn = ..., cns = ...}</span>, <span class="pl-avar">_73988192{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73988074{vn = ..., cns = ...}</span>, <span class="pl-avar">_73988234{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-string">"==== isurp-old surprisingness ====="</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988150{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988192{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">total_counts</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_73988332{$_total_count}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988332{$_total_count}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'println!'</span>, <span class="pl-string">"Total counts: "</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988150{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988192{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988332{$_total_count}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">prob</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-avar">_73988440{$_pattern_prob}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988440{$_pattern_prob}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'println!'</span>, <span class="pl-string">"Pattern probability: "</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988150{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'generet-partition-without-pattern'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-avar">_73988520{$_partitions}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988520{$_partitions}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'println!'</span>, <span class="pl-string">"Generated partitions: "</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">12</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">12</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988520{$_partitions}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">14</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988192{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">15</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988332{$_total_count}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'isurp-old_'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">14</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">15</span></span>)</span>, <span class="pl-avar">_73988628{$_results}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">16</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988628{$_results}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'println!'</span>, <span class="pl-string">"Partition probabilities: "</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">16</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">17</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">17</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">18</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988628{$_results}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'min-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">18</span></span>)</span>, <span class="pl-avar">_73988708{$_emin}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">19</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988708{$_emin}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'println!'</span>, <span class="pl-string">"Minimum partition probability (emin): "</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">19</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">20</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">20</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">21</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988628{$_results}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'max-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">21</span></span>)</span>, <span class="pl-avar">_73988788{$_emax}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">22</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988788{$_emax}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'println!'</span>, <span class="pl-string">"Maximum partition probability (emax): "</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">22</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">23</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">23</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">24</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988708{$_emin}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">25</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988788{$_emax}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">26</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988440{$_pattern_prob}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">dst_from_interval</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">24</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">25</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">26</span></span>)</span>, <span class="pl-avar">_73988896{$_dst}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">27</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73988896{$_dst}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'println!'</span>, <span class="pl-string">"Distance from interval: "</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">27</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">28</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">28</span></span>)</span>, []</span>)</span> , 
     <span class="pl-atom">me</span>( <span class="pl-atom">min</span>, 
       [ [ <span class="pl-atom">if</span>, 
           <span class="pl-var">_normalize</span>, 
           [ <span class="pl-atom">//</span>, 
             <span class="pl-var">_dst</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">max</span>, <span class="pl-var">_emax</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
           <span class="pl-var">_dst</span>], 
         <span class="pl-float">1.0</span>], 
       _73988102{vn = ..., cns = ...})</span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/surprisingness/metta_log/isurp-old.metta at 2025-10-17T09:14:33+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
