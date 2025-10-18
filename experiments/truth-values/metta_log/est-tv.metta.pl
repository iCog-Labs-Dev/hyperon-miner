%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/truth-values/metta_log/est-tv.metta at 2025-10-18T23:17:01+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).



<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call_22</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">time</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-atom">top_call_22</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">ExecRes</span></span>)</span>.




top_call :-
    time(top_call_22).




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call_23</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">time</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-atom">top_call_23</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">ExecRes</span></span>)</span>.




top_call :-
    time(top_call_23).




( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">top_call_25</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-anon">_</span></span>)</span></span>) ).




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">time</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-atom">top_call_25</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">ExecRes</span></span>)</span>.




top_call :-
    time(top_call_25).




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call_26</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">time</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-atom">top_call_26</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">ExecRes</span></span>)</span>.




top_call :-
    time(top_call_26).


%  ;types
%  ; (: pro_prob_without_joint (-> SpaceType (BList Pattern) TruthValue))
%  ; (: estimate_v_xi (-> SpaceType (List Pattern) Number))
%  ; (: inner_temp (-> SpaceType (BList Pattern) (List Pattern) Number Any (List Number)))
%  ; (: eq-prob (-> SpaceType Number (BList Pattern) (BList Pattern) Number Number Any Number Number))
%  ; (: prob-with-joint (-> SpaceType Number (BList Pattern) Any Number Number))
%  ; (: ji-est-tv (-> SpaceType Number Pattern (PList Pattern) (List TruthValue)))
%  ; (: do-ji-tv-est (-> SpaceType Pattern TruthValue))
%  ;; =============================================================================
%  ;; Function: pro_prob_without_joint
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   This function calculates the product of the probability over subpatterns
%  ;;   without considering the joint variables. It estimates the empirical truth value
%  ;;   for each subpattern and then computes the average of these truth values to derive
%  ;;   the final product of the probabilities.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The database in which the subpatterns' empirical truth values will be calculated.
%  ;;   - $subpatterns: A list of subpatterns for which the empirical truth values need to be calculated.
%  ;;
%  ;; Internal Calculation:
%  ;;   1. Calls `emp_tv_mem` to calculate the empirical truth value (`$tv`) for the given subpatterns in the database.
%  ;;   2. Uses `avrg_tv` to compute the average of the empirical truth values, which represents the product of the probabilities.
%  ;;   3. Returns the average empirical truth value as the product of probabilities over the subpatterns.
%  ;;
%  ;; Returns:
%  ;;   - The average empirical truth value, representing the product of the probabilities over the subpatterns without considering joint variables.
%  ;; =============================================================================
/*
  (= (pro_prob_without_joint $db $subpatterns)  
    (let* 
      ( ($tv (emp_tv_mem $subpatterns $db)) ($prod_etv (avrg_tv $tv))) $prod_etv))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">pro_prob_without_joint</span>, <span class="pl-var">_db129</span>, <span class="pl-var">_subpatterns1</span>, <span class="pl-var">RetVal1247</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_118045786{vn = ..., cns = ...}</span>, <span class="pl-avar">_118045890{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_118045814{vn = ..., cns = ...}</span>, <span class="pl-avar">_118045932{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_118045932{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_118045890{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">emp_tv_mem</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_118046000{$_tv}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_118046000{$_tv}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">avrg_tv</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_118046040{$_prod_etv}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_118045842{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_118046040{$_prod_etv}</span></span></span>) ).


%  ;; =============================================================================
%  ;; Function: estimate_v_xi
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   This function calculates the set of values that Xi (a specific component of a pattern)
%  ;;   can take when it is matched against the database alone, without any interaction
%  ;;   with the other components. The calculation uses an approximation formula.
%  ;;
%  ;; Formula:
%  ;;   The set size for Xi (denoted as |V(Xi)|) is approximated by taking the Nth root of the support
%  ;;   count (S) of the pattern's occurrences in the database, where N is a constant factor.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The database in which the pattern will be matched to estimate Xi's possible values.
%  ;;   - $pattern_i: A component of the pattern whose possible values are to be estimated.
%  ;;
%  ;; Calculation:
%  ;;   1. It computes the support count `S` for the pattern component ($pattern_i) in the database using the `sup-num` function.
%  ;;   2. The Nth root of the support value `S` is then taken, with 0.5 (the square root) as the exponent in the `pow` function.
%  ;;   3. The result is the estimated number of possible values that Xi can take.
%  ;;
%  ;; Returns:
%  ;;   - The estimated set size of values that Xi can take.
%  ;; =============================================================================
/*
  (= (estimate_v_xi $db $pattern_i)  
    (let $result 
      (sup-num $db $pattern_i) 
      ( (py-atom pow) $result 0.5)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">estimate_v_xi</span>, <span class="pl-var">_db133</span>, <span class="pl-var">_pattern_i1</span>, <span class="pl-var">RetVal1251</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_118224392{vn = ..., cns = ...}</span>, <span class="pl-avar">_118224496{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_118224420{vn = ..., cns = ...}</span>, <span class="pl-avar">_118224538{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_118224496{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_118224538{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'sup-num'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_118224606{$_result}</span></span>)</span> , 
     <span class="pl-atom">py_call_method_and_args_sig</span>( <span class="pl-atom">'%Undefined%'</span>, 
       [], 
       <span class="pl-atom">pow</span>, 
       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_118224606{$_result}</span>, <span class="pl-float">0.5</span></span>]</span>, 
       _118224448{vn = ..., cns = ...})</span>) ).


%  ;; =============================================================================
%  ;; Function: inner_temp
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   This function calculates and sets the value of |V(Xi)| for a given component `compJ`
%  ;;   with respect to the components preceding it (i.e., those where i < j). It either sets the 
%  ;;   value to -1 if no abstraction exists or estimates the value using `estimate_v_xi`.
%  ;; 
%  ;; Parameters:
%  ;;   - $db: The database to be used for estimation.
%  ;;   - $original: A list of components (or patterns).
%  ;;   - $compJ: The component for which the value of |V(Xi)| needs to be set.
%  ;;   - $i: An index variable used to recursively process the components.
%  ;;   - $var: A variable passed to the recursive call.
%  ;; 
%  ;; Steps:
%  ;;   1. If $i equals 0, it means no further components are left to process, and the function terminates.
%  ;;   2. Otherwise, it deconstructs the `$original` list into `$head` and `$tail`.
%  ;;   3. It checks if the `$head` component is more abstract than `$compJ` using the function `is_more_abstract_init`.
%  ;;      - If `$head` is more abstract, it estimates the possible values for Xi using `estimate_v_xi`.
%  ;;      - If `$head` is not more abstract, it sets the value to -1, indicating no abstraction.
%  ;;   4. The function then recursively calls itself with the remaining components in `$tail` and decrements `$i`.
%  ;;   5. The resulting list is constructed by consing the value of `v_xi` with the results of the recursive call.
%  ;;   6. Finally, the function returns a list of estimated values for each component.
%  ;; 
%  ;; Returns:
%  ;;   - A list where each element is the value of |V(Xi)| for each component, or -1 if no abstraction exists.
%  ;; =============================================================================
/*
  (= (inner_temp $db $original $CompJ $i $var)  
    (if 
      (== $i 0) () 
      (let* 
        ( ( ($head $tail) (decons-atom $original)) 
          ($bool_value (is_more_abstract_init $head $CompJ)) 
          ($v_xi (if $bool_value (estimate_v_xi $db $head) -1)) 
          ($dummy (inner_temp $db $tail $CompJ (- $i 1) $var))) 
        (cons-atom $v_xi $dummy))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">inner_temp</span>, 
     <span class="pl-var">_db137</span>, <span class="pl-var">_original21</span>, <span class="pl-var">CompJ1</span>, <span class="pl-var">_i5</span>, 
     <span class="pl-var">_var137</span>, <span class="pl-var">RetVal1255</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_118505812{vn = ..., cns = ...}</span>, <span class="pl-avar">_118506000{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_118505840{vn = ..., cns = ...}</span>, <span class="pl-avar">_118506042{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_118505868{vn = ..., cns = ...}</span>, <span class="pl-avar">_118506084{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_118505896{vn = ..., cns = ...}</span>, <span class="pl-avar">_118506126{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_118505924{vn = ..., cns = ...}</span>, <span class="pl-avar">_118506168{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_118506126{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _118506248{$P1_CODE_791} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_791</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom, _original ]], 
             [ <span class="pl-var">_bool_value</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">is_more_abstract_init</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_v_xi</span>, 
               [ <span class="pl-atom">if</span>, 
                 <span class="pl-var">_bool_value</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">estimate_v_xi</span>, <span class="pl-var">_db</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 <span class="pl-int">-1</span>]], 
             [ <span class="pl-var">_dummy</span>, 
               [ <span class="pl-atom">inner_temp</span>, <span class="pl-var">_db</span>, <span class="pl-var">_tail</span>, <span class="pl-var">CompJ</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_i</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 <span class="pl-var">_var</span>]]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_v_xi</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_original</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">CompJ</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">is_more_abstract_init</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">_bool_value</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_bool_value</span></span> , 
           <span class="pl-var">P1_CODE_792</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_792</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">estimate_v_xi</span>, <span class="pl-var">_db</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">estimate_v_xi</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_792</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_792</span>, <span class="pl-int">-1</span>, <span class="pl-var">_v_xi</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">CompJ</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_i</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">M</span>, <span class="pl-int">1</span>, <span class="pl-var">N</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">inner_temp</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">_dummy</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_v_xi</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_dummy</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">P</span>, <span class="pl-var">Q</span>, <span class="pl-var">P1_CODE_RESULT_791</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_118506248{$P1_CODE_791}</span>, <span class="pl-avar">_118505952{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: eq-prob
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   This function recursively calculates the probability product for each component
%  ;;   in a pattern using the formula: P(X1 = ... = Xn) = ∏_{j=2}^n 1 / M(Xj),
%  ;;   where M(Xj) is the estimated number of values Xj can take when conditioned on
%  ;;   more abstract components.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The database used to estimate variable domain sizes.
%  ;;   - $db_size: The total size of the database.
%  ;;   - $original: The original list of pattern components.
%  ;;   - $copy: A copy of the list used for recursive traversal.
%  ;;   - $i: The current index in the original pattern list.
%  ;;   - $count: The number of components left to process.
%  ;;   - $var: A placeholder variable (purpose depends on `inner_temp`).
%  ;;   - $prob: The accumulated probability product so far.
%  ;;
%  ;; Steps:
%  ;;   1. If `$count` is greater than 1:
%  ;;      a. Retrieve the tail of the current component list.
%  ;;      b. Extract the next component `$compJ` to process.
%  ;;      c. Use `inner_temp` to compute abstractness relationships and estimate |V(Xi)|.
%  ;;      d. Use `find_max` to determine the most specific (smallest) estimate among
%  ;;         abstract components; this is considered M(Xj).
%  ;;      e. If the most specific value is not positive, use the entire database size
%  ;;         as a fallback for M(Xj).
%  ;;      f. Multiply the current probability with 1 / M(Xj) to update `$prob`.
%  ;;      g. Recursively process the remaining components.
%  ;;   2. If `$count` is 1 or less, return the accumulated probability as the base case.
%  ;;
%  ;; Returns:
%  ;;   - The final product probability value computed using the abstractness-aware
%  ;;     approximation formula.
%  ;; =============================================================================
%  ; (=(eq-prob $db $db_size $original $copy $i $count $var $prob) (
%  ;     if (> $count 1) (
%  ;     let* (
%  ;         ($tail (cdr-atom $copy))
%  ;         ($compJ (car-atom $tail))
%  ;         ($most_spec  (let $result (inner_temp $db $original $compJ $i $var) (max $result) ))
%  ;         ($M_xj (if (<= $most_spec 0) $db_size $most_spec))
%  ;         ($inverse_M_xj (// 1 $M_xj))
%  ;         ($prob_j (* $prob $inverse_M_xj))  ;; from general formula
%  ;         ($dummy (eq-prob $db $db_size $original $tail (+ $i 1) (- $count 1) $var $prob_j))) 
%  ;          $dummy)
%  ;            $prob
%  ;     ))
%  ;; =============================================================================
%  ;; Function: prob-with-joint
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   This function calculates the probability that all joint variables take the
%  ;;   same value by iteratively applying `eq-prob` to each joint variable and its
%  ;;   connected subpatterns.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The database used for probability estimation.
%  ;;   - $db_size: The size of the database.
%  ;;   - $partion: The list of pattern partitions used to identify subpatterns.
%  ;;   - $joint_vars: A list of joint variables whose agreement is being evaluated.
%  ;;   - $p: The initial probability value, used for accumulation.
%  ;;
%  ;; Returns:
%  ;;   - The final probability that all joint variables are equal across their
%  ;;     respective connected components.
%  ;; =============================================================================
/*
  (= (prob-with-joint $db $db_size $partion $joint_vars $p)  
    (if 
      (== $joint_vars ()) $p 
      (let* 
        ( ( ($head $tail) (decons-atom $joint_vars)) 
          ($patterns (connected-subpatterns-with-var $partion $head)) 
          ($pattern_count (tuple-count $patterns)) 
          ($prob (eq-prob $db $db_size $patterns $patterns 1 $pattern_count $head $p))) 
        (prob-with-joint $db $db_size $partion $tail $prob))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'prob-with-joint'</span>, 
     <span class="pl-var">_db141</span>, <span class="pl-var">_db_size5</span>, <span class="pl-var">_partion13</span>, 
     <span class="pl-var">_joint_vars1</span>, <span class="pl-var">_p9</span>, 
     <span class="pl-var">RetVal1259</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_119487862{vn = ..., cns = ...}</span>, <span class="pl-avar">_119488050{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_119487890{vn = ..., cns = ...}</span>, <span class="pl-avar">_119488092{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_119487918{vn = ..., cns = ...}</span>, <span class="pl-avar">_119488134{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_119487946{vn = ..., cns = ...}</span>, <span class="pl-avar">_119488176{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_119487974{vn = ..., cns = ...}</span>, <span class="pl-avar">_119488218{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_119488176{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_119488218{vn = ..., cns = ...}</span></span> , 
     _119488304{$P1_CODE_799} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_799</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom,_joint_vars]], 
             [ <span class="pl-var">_patterns</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'connected-subpatterns-with-var'</span>, <span class="pl-var">_partion</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_pattern_count</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
             [ <span class="pl-var">_prob</span>, 
               [ <span class="pl-atom">'eq-prob'</span>, <span class="pl-var">_db</span>, <span class="pl-var">_db_size</span>, 
                 <span class="pl-var">_patterns</span>, <span class="pl-var">_patterns</span>, <span class="pl-int">1</span>, 
                            <span class="pl-var">_pattern_count</span>, <span class="pl-var">_head</span>, <span class="pl-var">_p</span>]]], 
           [ <span class="pl-atom">'prob-with-joint'</span>, <span class="pl-var">_db</span>, <span class="pl-var">_db_size</span>, 
             <span class="pl-var">_partion</span>, <span class="pl-var">_tail</span>, 
             <span class="pl-var">_prob</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_joint_vars</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">E</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_partion</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'connected-subpatterns-with-var'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_patterns</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-var">H</span>, <span class="pl-var">_pattern_count</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_db_size</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_pattern_count</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_p</span></span> , 
           <span class="pl-atom">s</span>( <span class="pl-atom">'eq-prob'</span>, 
             <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-int">1</span>, 
             <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, 
             <span class="pl-var">_prob</span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_db_size</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_partion</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">S</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_prob</span></span> , 
           <span class="pl-atom">me</span>( <span class="pl-atom">'prob-with-joint'</span>, 
             <span class="pl-var">P</span>, <span class="pl-var">Q</span>, <span class="pl-var">R</span>, <span class="pl-var">S</span>, 
             <span class="pl-var">T</span>, <span class="pl-var">P1_CODE_RESULT_799</span>))) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_119488304{$P1_CODE_799}</span>, <span class="pl-avar">_119488002{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: ji-est-tv
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Calculates the joint-independent truth value estimate (JITVE) for a pattern
%  ;;   based on a given partition. It assumes all blocks are independent but accounts
%  ;;   for joint variables shared across them.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The database containing relevant facts.
%  ;;   - $db_size: The size of the database.
%  ;;   - $pattern: The pattern whose empirical truth value is being estimated.
%  ;;   - $partitions: A list of partitions of the pattern, each representing a block
%  ;;                  assumed to be conditionally independent.
%  ;;
%  ;; Returns:
%  ;;   - A list of STV (Strength, Confidence) pairs, one for each partition,
%  ;;     adjusted by the estimated joint probability among shared variables.
%  ;; =============================================================================
/*
  (= (ji-est-tv $db $db_size $pattern $partitions)  
    (if 
      (== $partitions ()) () 
      (let* 
        ( ( ($head $tail) (decons-atom $partitions)) 
          ($prod_etv (pro_prob_without_joint $db $head)) 
          ( ($rp $rc) (decons-atom $prod_etv)) 
          ($rp_est (eq-prob (remove-parenthesis $head) $pattern $db)) 
          ( ($strength $confidence) ((* $rp $rp_est) (* 0.1 (car-atom $rc)))) 
          ($dummy (ji-est-tv $db $db_size $pattern $tail))) 
        (cons-atom 
          (STV $strength $confidence) $dummy))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'ji-est-tv'</span>, 
     <span class="pl-var">_db145</span>, <span class="pl-var">_db_size9</span>, <span class="pl-var">_pattern149</span>, 
     <span class="pl-var">_partitions5</span>, <span class="pl-var">RetVal1263</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_120532948{vn = ..., cns = ...}</span>, <span class="pl-avar">_120533108{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_120532976{vn = ..., cns = ...}</span>, <span class="pl-avar">_120533150{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_120533004{vn = ..., cns = ...}</span>, <span class="pl-avar">_120533192{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_120533032{vn = ..., cns = ...}</span>, <span class="pl-avar">_120533234{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_120533234{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _120533314{$P1_CODE_803} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_803</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom,_partitions]], 
             [ <span class="pl-var">_prod_etv</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">pro_prob_without_joint</span>, <span class="pl-var">_db</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ [     _rp    ,    _rc    ],
               [ decons-atom, _prod_etv ]], 
             [ <span class="pl-var">_rp_est</span>, 
               [ <span class="pl-atom">'eq-prob'</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'remove-parenthesis'</span>, <span class="pl-var">_head</span></span>]</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>]], 
             [ <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_strength</span>, <span class="pl-var">_confidence</span></span>]</span>, 
               [ <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">_rp</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 [ <span class="pl-atom">*</span>, 
                   <span class="pl-float">0.1</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_rc</span></span>]</span>]]], 
             [ <span class="pl-var">_dummy</span>, 
               [ <span class="pl-atom">'ji-est-tv'</span>, <span class="pl-var">_db</span>, <span class="pl-var">_db_size</span>, 
                 <span class="pl-var">_pattern</span>, <span class="pl-var">_tail</span>]]], 
           [ <span class="pl-atom">'cons-atom'</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'STV'</span>, <span class="pl-var">_strength</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-var">_dummy</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_partitions</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">pro_prob_without_joint</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">_prod_etv</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_prod_etv</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">H</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_rp</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'remove-parenthesis'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'eq-prob'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">_rp_est</span></span>)</span> , 
           <span class="pl-atom">unify_with_occurs_check</span>( 
              [ <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">_rp</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                [ <span class="pl-atom">*</span>, 
                  <span class="pl-float">0.1</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_rc</span></span>]</span>]], 
              <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_strength</span>, <span class="pl-var">_confidence</span></span>]</span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_db_size</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'ji-est-tv'</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">_dummy</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_strength</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_confidence</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'STV'</span>, <span class="pl-var">Q</span>, <span class="pl-var">R</span>, <span class="pl-var">S</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_dummy</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">S</span>, <span class="pl-var">T</span>, <span class="pl-var">P1_CODE_RESULT_803</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_120533314{$P1_CODE_803}</span>, <span class="pl-avar">_120533060{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: do-ji-tv-est
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Computes the joint-independent truth value estimate (JITVE) for a given pattern
%  ;;   by generating a partition of the pattern, estimating the JITV for each block,
%  ;;   and then averaging the results to form a final STV (Strength, Confidence).
%  ;;
%  ;; Parameters:
%  ;;   - $db: The database from which atoms are extracted and used for evaluation.
%  ;;   - $pattern: The pattern whose joint-independent empirical truth value is to be calculated.
%  ;;
%  ;; Returns:
%  ;;   - A single STV value representing the averaged strength and confidence across
%  ;;     all partitioned estimations of the pattern.
%  ;; =============================================================================
/*
  (= (do-ji-tv-est $db $pattern)  
    (let $prtns 
      (generet-partition-without-pattern $pattern) 
      (let* 
        ( (() (println! "======= Truth Value Estimation =======")) 
          ($db_size (db-size $db)) 
          ($ji_est_tv (ji-est-tv $db $db_size $pattern $prtns)) 
          ( ($strength $confidence) (avrg_tv $ji_est_tv))) 
        (STV $strength $confidence))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'do-ji-tv-est'</span>, <span class="pl-var">_db149</span>, <span class="pl-var">_pattern153</span>, <span class="pl-var">RetVal1267</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_121601784{vn = ..., cns = ...}</span>, <span class="pl-avar">_121601888{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_121601812{vn = ..., cns = ...}</span>, <span class="pl-avar">_121601930{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_121601930{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'generet-partition-without-pattern'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_121601984{$_prtns}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-string">"======= Truth Value Estimation ======="</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_121601888{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'db-size'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_121602054{$_db_size}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_121601888{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_121602054{$_db_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_121601930{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_121601984{$_prtns}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'ji-est-tv'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_121602136{$_ji_est_tv}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_121602136{$_ji_est_tv}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">avrg_tv</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span></span>)</span> , 
     <span class="pl-atom">unify_with_occurs_check</span>( <span class="pl-var">I</span>, [
       <span class="pl-var">_strength</span>, 
       _121602214{$_confidence}]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_121602194{$_strength}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_121602214{$_confidence}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'STV'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-avar">_121601840{vn = ..., cns = ...}</span></span>)</span></span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/truth-values/metta_log/est-tv.metta at 2025-10-18T23:17:27+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
