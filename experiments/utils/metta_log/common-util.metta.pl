%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/common-util.metta at 2025-10-16T14:05:55+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

%  ;;;;;;;;;;;;;;;;;;
%  ;; Common Utils ;;
%  ;;;;;;;;;;;;;;;;;;
%  ;predicate to check if a given expression is a pattern or not
/*
  (= (checkPat $x)  
    (let $type 
      (get-metatype $x) 
      (if 
        (not (== $type Expression)) False 
        (and 
          (> 
            (size-atom $x) 1) 
          (let $head 
            (car-atom $x) 
            (== 
              (get-metatype $head) Symbol))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">checkPat</span>, <span class="pl-var">_x1</span>, <span class="pl-var">RetVal327</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_32941190{vn = ..., cns = ...}</span>, <span class="pl-avar">_32941266{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_32941266{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_32941320{$_type}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-prefix">\+</span><span class="pl-compound"><span class="pl-functor">eval_true</span>(<span class="pl-args">(<span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span>)</span>)</span></span> , 
     _32941388{$P1_CODE_83} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Bool'</span>, <span class="pl-var">P1_CODE_RESULT_83</span>, 
         [ <span class="pl-atom">and</span>, 
           [ <span class="pl-atom">&gt;</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">_x</span></span>]</span>, 
             <span class="pl-int">1</span>], 
           [ <span class="pl-atom">let</span>, 
             <span class="pl-var">_head</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_x</span></span>]</span>, 
             [ <span class="pl-atom">==</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_head</span></span>]</span>, 
               <span class="pl-atom">'Symbol'</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-var">E</span>, <span class="pl-int">1</span>, <span class="pl-var">P1_CODE_RESULT_83</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">F</span>, <span class="pl-var">_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">H</span>, <span class="pl-atom">'Symbol'</span>, <span class="pl-var">P1_CODE_RESULT_83</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_32941388{$P1_CODE_83}</span>, <span class="pl-avar">_32941218{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;;;;;;;;;; functions related to Conjunction ;;;;;;;;;;;;
%  ;; Extracts conjuncts from a conjunctive expression,
/*
  (= (get-conjuncts $cnj)  
    (unify 
      (, $ncnj $ptrn) $cnj 
      (let $result 
        (get-conjuncts $ncnj) 
        (cons-atom $ptrn $result)) 
      ($cnj)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-conjuncts'</span>, <span class="pl-var">_cnj1</span>, <span class="pl-var">RetVal331</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_33356518{vn = ..., cns = ...}</span>, <span class="pl-avar">_33356594{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_33356634{$_ncnj}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_33356660{$_ptrn}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_33356594{vn = ..., cns = ...}</span></span> , 
     _33356714{$P1_CODE_87} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_87</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_result</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-conjuncts'</span>, <span class="pl-var">_ncnj</span></span>]</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_ptrn</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_ncnj</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-conjuncts'</span>, <span class="pl-var">E</span>, <span class="pl-var">_result</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_ptrn</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_result</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_RESULT_87</span></span>)</span>)) , 
     _33356896{$P1_CODE_88} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, 
         <span class="pl-var">RetTypeNotCd88</span>, 
         <span class="pl-var">P1_CODE_RESULT_88</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_cnj</span></span>]</span>, 
         <span class="pl-atom">eval_for1</span>( 
            <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
            <span class="pl-var">RetTypeNotCd88</span>, 
            <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_cnj</span></span>]</span>, 
            <span class="pl-var">P1_CODE_RESULT_88</span>)) , 
     <span class="pl-atom">s</span>( <span class="pl-atom">unify</span>, 
       <span class="pl-var">C</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_33356714{$P1_CODE_87}</span>, 
       <span class="pl-avar">_33356896{$P1_CODE_88}</span>, <span class="pl-avar">_33356546{vn = ..., cns = ...}</span>)</span>) ).


%  ;;Determines the number of conjunctive clauses in a pattern.
/*
  (= (n_conjuncts_new $pattern)  
    (let 
      ($head $tail) 
      (decons-atom $pattern) 
      (if 
        (== $head ,) 
        (tuple-count $tail) 1)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">n_conjuncts_new</span>, <span class="pl-var">_pattern1</span>, <span class="pl-var">RetVal335</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_33730378{vn = ..., cns = ...}</span>, <span class="pl-avar">_33730454{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_33730454{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_33730526{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_33730526{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     _33730606{$P1_CODE_95} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_95</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-var">_tail</span></span>]</span>, 
         <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-var">E</span>, <span class="pl-var">P1_CODE_RESULT_95</span></span>)</span></span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_33730606{$P1_CODE_95}</span>, <span class="pl-int">1</span>, <span class="pl-avar">_33730406{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: flatten
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:  
%  ;;   Flattens a nested conjunctive expression (e.g., `(, (, A B) C)`) into a  
%  ;;   single-level conjunction (e.g., `(, A B C)`), preserving the original order.  
%  ;;  
%  ;; Input:  
%  ;;   - `$cnj`: A nested conjunctive expression (e.g., `(and X (and Y Z))`).  
%  ;;  
%  ;; Output:  
%  ;;   - A flattened conjunction with all sub-expressions at the top level.  
%  ;;  
%  ;; How it works:  
%  ;;   1. Extracts all conjuncts (including nested ones) using `get-conjuncts`.  
%  ;;   2. Reverses the list to maintain logical order (assuming `get-conjuncts`  
%  ;;      returns them in reverse).  
%  ;;   3. Rebuilds the flattened conjunction using `cons-atom`.  
%  ;; =============================================================================
/*
  (= (flatten $cnj)  
    (let $flatten 
      (reverse-list (get-conjuncts $cnj)) 
      (cons-atom , $flatten)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">flatten</span>, <span class="pl-var">_cnj5</span>, <span class="pl-var">RetVal339</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_33995284{vn = ..., cns = ...}</span>, <span class="pl-avar">_33995360{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_33995360{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-conjuncts'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'reverse-list'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_33995428{$_flatten}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_33995428{$_flatten}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_33995312{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: get-clauses
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Extracts clauses from an expression, specifically handling AND-conjunctions
%  ;;
%  ;; Type Signature:
%  ;;   (-> Expression Expression)
%  ;;
%  ;; Parameters:
%  ;;   $element - Input expression to analyze
%  ;;
%  ;; Returns:
%  ;;   - Body of expression if it's an AND-conjunction
%  ;;   - Original expression otherwise
%  ;;
%  ;; Example:
%  ;;   (get-clauses '(And A B C)) → (A B C)
%  ;;   (get-clauses '(Or X Y)) → (Or X Y)
%  ;; =============================================================================
%  ; (: get-clauses (-> Expression Expression))
/*
  (= (get-clauses $element)  
    (let $link 
      (car-atom $element) 
      (if 
        (== $link ,) 
        (cdr-atom $element) $element)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-clauses'</span>, <span class="pl-var">_element1</span>, <span class="pl-var">RetVal343</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_34152066{vn = ..., cns = ...}</span>, <span class="pl-avar">_34152142{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34152142{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_34152196{$_link}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34152196{$_link}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _34152256{$P1_CODE_99} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_99</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_element</span></span>]</span>, 
         <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_element</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">P1_CODE_RESULT_99</span></span>)</span></span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34152142{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_34152256{$P1_CODE_99}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_34152094{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (add-atom-nodup $space $atom)  
    (case 
      (match $space $atom $atom) 
      ( ($atom ()) (Empty (add-atom $space $atom)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'add-atom-nodup'</span>, <span class="pl-var">_space1</span>, <span class="pl-var">_atom1</span>, <span class="pl-var">CASE_RESULT_RetVal347_1</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_34403292{vn = ..., cns = ...}</span>, <span class="pl-avar">_34403396{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_34403320{vn = ..., cns = ...}</span>, <span class="pl-avar">_34403438{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34403396{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">metta_atom_iter</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_34403438{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34403438{vn = ..., cns = ...}</span></span> , 
     _34403514{$CASE_SWITCH_7} =  
          
       [ <span class="pl-compound pl-level-0"><span class="pl-functor">caseOption</span>(<span class="pl-args"><span class="pl-var">_atom</span>, [], <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_space</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-compound">[]<span class="pl-infix">=~</span>[]</span></span>)</span>, 
         <span class="pl-atom">caseOption</span>( <span class="pl-atom">'Empty'</span>, 
           <span class="pl-var">C</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_space</span>, <span class="pl-var">_atom</span></span>]</span>, 
           <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_space</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span></span>)] , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">select_case</span>(<span class="pl-args"><span class="pl-avar">_34403514{$CASE_SWITCH_7}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_34403348{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: conjunct-pattern
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:  
%  ;;   Converts a list of blocks (`$blks`) into a conjunctive pattern (logical AND)
%  ;;   and  adds it to a database (`$db`) 
%  ;;  
%  ;; Inputs:  
%  ;;   - `$blks`: A list of blocks (e.g., `(A B C)`).  
%  ;;   - `$db`  : A database to which the pattern is added as an atom.  
%  ;;             
%  ;;  
%  ;; Output:  
%  ;;   - A conjunctive pattern combining `$blks` (e.g., `(, A B C)`).  
%  ;;  
%  ;; How it works:  
%  ;;   1. Combines `$blks` into a conjunction using `cons-atom` (e.g., `(, A B C)`).  
%  ;;   2. adds the pattern to it via `add-atom` (side effect).  
%  ;;   3. Returns the generated pattern, regardless of `$db`.  
%  ;;  
%  ;; Notes:  
%  ;;  
%  ;;   - No checks are done on `$blks` (e.g., empty lists may produce `(and)`).  
%  ;; =============================================================================
/*
  (= (conjunct-pattern $blks $db)  
    (let* 
      ( ($pattern (cons-atom , $blks)) ($_ (add-atom $db $pattern))) $pattern))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'conjunct-pattern'</span>, <span class="pl-var">_blks1</span>, <span class="pl-var">_db1</span>, <span class="pl-var">RetVal351</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_34635084{vn = ..., cns = ...}</span>, <span class="pl-avar">_34635188{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_34635112{vn = ..., cns = ...}</span>, <span class="pl-avar">_34635230{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34635188{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_34635286{$_pattern}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34635230{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34635286{$_pattern}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'add-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_34635140{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_34635286{$_pattern}</span></span></span>) ).


/*
  (= (pow-py $base $power)  
    (pow-math $base $power))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'pow-py'</span>, <span class="pl-var">_base1</span>, <span class="pl-var">_power1</span>, <span class="pl-var">RetVal355</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_34800742{vn = ..., cns = ...}</span>, <span class="pl-avar">_34800846{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_34800770{vn = ..., cns = ...}</span>, <span class="pl-avar">_34800888{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34800846{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34800888{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'pow-math'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_34800798{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: //
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Performs floating-point division between `$a` and `$b` by explicitly 
%  ;;   converting the numerator to a float to avoid integer division.
%  ;;
%  ;; Inputs:
%  ;;   - `$a`: Numerator (any numeric type).
%  ;;   - `$b`: Denominator (any numeric type, must be ≠ 0).
%  ;;
%  ;; Output:
%  ;;   - Floating-point result of `$a / $b` (as a float).
%  ;;   - Undefined behavior if `$b = 0` (division error).
%  ;;
%  ;; How it works:
%  ;;   1. Converts `$a` to float by multiplying with `1.0` (e.g., `3` → `3.0`).
%  ;;   2. Divides the float-converted `$a` by `$b` using standard division (`/`).
%  ;;
%  ;; Notes:
%  ;;   - Ensures floating-point result even with integer inputs (e.g., `(// 5 2) → 2.5`).
%  ;;   - Equivalent to `(float (/ $a $b))`.
%  ;;   - No runtime checks for `$b = 0` (may trigger language-specific errors).
%  ;; =============================================================================
/*
  (= (// $a $b)  
    (/ 
      (* 1.0 $a) $b))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-var">_a1</span>, <span class="pl-var">_b1</span>, <span class="pl-var">RetVal359</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_34935270{vn = ..., cns = ...}</span>, <span class="pl-avar">_34935374{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_34935298{vn = ..., cns = ...}</span>, <span class="pl-avar">_34935416{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34935374{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-float">1.0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_34935416{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">/</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_34935326{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: concatTuple
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Recursively concatenates two lists `$xs` and `$ys` by prepending elements of `$xs`  
%  ;;   to `$ys` in order. Preserves the original structure of both lists.
%  ;;
%  ;; Inputs:
%  ;;   - `$xs`: First list to concatenate (e.g., `(1 2 3)`).
%  ;;   - `$ys`: Second list to append (e.g., `(4 5)`).
%  ;;
%  ;; Output:
%  ;;   - A new list combining all elements of `$xs` followed by `$ys` (e.g., `(1 2 3 4 5)`).
%  ;;   - If `$xs` is empty (`()`), returns `$ys` directly.
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: If `$xs` is empty, return `$ys` immediately.
%  ;;   2. Recursive Step:
%  ;;      a. Split `$xs` into `$head` (first element) and `$tail` (remaining elements)  
%  ;;         using `decons-atom`.
%  ;;      b. Recursively concatenate `$tail` with `$ys` (yielding `$tailNew`).
%  ;;      c. Rebuild the list by prepending `$head` to `$tailNew` via `cons-atom`.
%  ;; =============================================================================
/*
  (= (concatTuple $xs $ys)  
    (if 
      (== $xs ()) $ys 
      (let* 
        ( ( ($head $tail) (decons-atom $xs)) ($TailNew (concatTuple $tail $ys))) 
        (cons-atom $head $TailNew))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">concatTuple</span>, <span class="pl-var">_xs1</span>, <span class="pl-var">_ys1</span>, <span class="pl-var">RetVal363</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_35113558{vn = ..., cns = ...}</span>, <span class="pl-avar">_35113662{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_35113586{vn = ..., cns = ...}</span>, <span class="pl-avar">_35113704{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_35113662{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_35113704{vn = ..., cns = ...}</span></span> , 
     _35113790{$P1_CODE_103} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_103</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom,    _xs    ]], 
             [ <span class="pl-var">TailNew</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">concatTuple</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_xs</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">E</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_ys</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">concatTuple</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">TailNew</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">TailNew</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_103</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_35113790{$P1_CODE_103}</span>, <span class="pl-avar">_35113614{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: remove-parenthesis
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Removes redundant nested parentheses from a single-element list by unwrapping
%  ;;   it recursively until a non-single-element list is found.
%  ;;
%  ;; Input:
%  ;;   - `$x`: A potentially nested list structure (e.g., `((((A))))` or `(A B C)`).
%  ;;
%  ;; Output:
%  ;;   - The innermost element if `$x` is a series of single-element lists (e.g., `A`).
%  ;;   - The original list if it contains multiple elements or is already atomic.
%  ;;
%  ;; How it works:
%  ;;   1. Splits `$x` into `$head` and `$tail` using `decons-atom`.
%  ;;   2. If `$tail` is empty (single-element list), recursively processes `$head`.
%  ;;   3. Otherwise, returns the original list unchanged.
%  ;; =============================================================================
/*
  (= (remove-parenthesis $x)  
    (if 
      (== 
        (get-metatype $x) Expression) 
      (if 
        (== 
          (size-atom $x) 1) 
        (remove-parenthesis (car-atom $x)) $x) 
      ($x)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'remove-parenthesis'</span>, <span class="pl-var">_x5</span>, <span class="pl-var">RetVal367</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_35556256{vn = ..., cns = ...}</span>, <span class="pl-avar">_35556332{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_35556332{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _35556420{$P1_CODE_107} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd107</span>, <span class="pl-var">P1_CODE_RESULT_107</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">==</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">_x</span></span>]</span>, 
             <span class="pl-int">1</span>], 
           [ <span class="pl-atom">'remove-parenthesis'</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_x</span></span>]</span>], 
           <span class="pl-var">_x</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">E</span>, <span class="pl-int">1</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-var">P1_CODE_108</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd107</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_108</span>, 
                [ <span class="pl-atom">'remove-parenthesis'</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_x</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'remove-parenthesis'</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_108</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">F</span>, <span class="pl-var">P1_CODE_108</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_107</span></span>)</span>)) , 
     _35556756{$P1_CODE_109} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, 
         <span class="pl-var">RetTypeNotCd109</span>, 
         <span class="pl-var">P1_CODE_RESULT_109</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_x</span></span>]</span>, 
         <span class="pl-atom">eval_for1</span>( 
            <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
            <span class="pl-var">RetTypeNotCd109</span>, 
            <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_x</span></span>]</span>, 
            <span class="pl-var">P1_CODE_RESULT_109</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_35556420{$P1_CODE_107}</span>, <span class="pl-avar">_35556756{$P1_CODE_109}</span>, <span class="pl-avar">_35556284{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Function: get-variables
%  ; Description: Recursively extracts all variables from a given conjunct pattern.
%  ;  - If the pattern is empty, it returns the accumulated variables ($acc).
%  ;  - For each element in the pattern:
%  ;    1. If the element is an Expression, it recursively extracts variables from it.
%  ;   2. If the element is a Variable and not already in the accumulator ($acc), it adds it.
%  ;    3. Otherwise, it skips the element.
%  ; The function ensures no duplicate variables are added to the result.
%  ;The overloaded version of the function serves as a way to call the function with only the conjunct without an 
%  ;initial accumulator
%  ;; =============================================================================
%  ;; Function: checkInter
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Checks if element `$x` exists in accumulator list `$acc` using intersection.
%  ;;   Essentially acts as a list membership test.
%  ;;
%  ;; Inputs:
%  ;;   - `$x`: The element to check for membership (any atom).
%  ;;   - `$acc`: The list to check against (e.g., `(a b c d)`).
%  ;;
%  ;; Output:
%  ;;   - Non-empty list if `$x` is found in `$acc` (truthy).
%  ;;   - Empty list `()` if `$x` is not in `$acc` (falsey).
%  ;;
%  ;; How it works:
%  ;;   1. Wraps `$x` in a singleton list via `($x)`.
%  ;;   2. Computes intersection with `$acc` using `intersection-atom`.
%  ;;   3. Returns the result (empty list for no intersection).
%  ;; =============================================================================
/*
  (= (checkInter $x $acc)  
    (intersection-atom 
      ($x) $acc))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">checkInter</span>, 
     <span class="pl-var">_x9</span>, 
     <span class="pl-var">_acc1</span>, 
     [ [ <span class="pl-atom">'intersection-atom'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_x</span></span>]</span>, 
         <span class="pl-var">_acc</span>]]) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_36055644{vn = ..., cns = ...}</span>, <span class="pl-avar">_36055724{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_36055672{vn = ..., cns = ...}</span>, <span class="pl-avar">_36055758{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: get-variables
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Recursively extracts all unique variables from a pattern expression, 
%  ;;   accumulating them in `$acc`. Handles nested expressions and avoids duplicates.
%  ;;
%  ;; Inputs:
%  ;;   - `$pattern`: The expression to scan (e.g., `(P $x (Q $y $x))`).
%  ;;   - `$acc`: Accumulator list for variables (start with `()`).
%  ;;
%  ;; Output:
%  ;;   - A list of unique variables found in `$pattern` (e.g., `($x $y)`).
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns `$acc` when `$pattern` is empty.
%  ;;   2. Recursive Steps:
%  ;;      a. Splits `$pattern` into `$head` and `$tail` using car/cdr-atom.
%  ;;      b. If `$head` is an Expression: Recursively processes both `$head` and `$tail`.
%  ;;      c. If `$head` is a Variable and not already in `$acc`: Adds to accumulator.
%  ;;      d. Otherwise: Continues with `$tail`.
%  ;; =============================================================================
/*
  (= (get-variables $pattern $acc)  
    (if 
      (== $pattern ()) $acc 
      (let* 
        ( ($head (car-atom $pattern)) ($tail (cdr-atom $pattern))) 
        (if 
          (== 
            (get-metatype $head) Expression) 
          (get-variables $tail 
            (get-variables $head $acc)) 
          (if 
            (and 
              (== 
                (get-metatype $head) Variable) 
              (== 
                (checkInter $head $acc) 
                (()))) 
            (get-variables $tail 
              (union-atom $acc 
                ($head))) 
            (get-variables $tail $acc))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">_pattern5</span>, <span class="pl-var">_acc5</span>, <span class="pl-var">RetVal375</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_36318652{vn = ..., cns = ...}</span>, <span class="pl-avar">_36318756{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_36318680{vn = ..., cns = ...}</span>, <span class="pl-avar">_36318798{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_36318756{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_36318798{vn = ..., cns = ...}</span></span> , 
     _36318884{$P1_CODE_119} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd119</span>, <span class="pl-var">P1_CODE_RESULT_119</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_pattern</span></span>]</span>], 
             [ <span class="pl-var">_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_pattern</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             [ <span class="pl-atom">==</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_head</span></span>]</span>, 
               <span class="pl-atom">'Expression'</span>], 
             [ <span class="pl-atom">'get-variables'</span>, 
               <span class="pl-var">_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-atom">if</span>, 
               [ <span class="pl-atom">and</span>, 
                 [ <span class="pl-atom">==</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_head</span></span>]</span>, 
                   <span class="pl-atom">'Variable'</span>], 
                 [ <span class="pl-atom">==</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">checkInter</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                   [ 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args">[]</span>]</span>]], 
               [ <span class="pl-atom">'get-variables'</span>, 
                 <span class="pl-var">_tail</span>, 
                 [ <span class="pl-atom">'union-atom'</span>, 
                   <span class="pl-var">_acc</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>]], 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">G</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-var">P1_CODE_120</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd119</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_120</span>, 
                [ <span class="pl-atom">'get-variables'</span>, 
                  <span class="pl-var">_tail</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">I</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_120</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_121</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd119</span></span>]</span>, <span class="pl-var">RetTypeNotCd121</span>, <span class="pl-var">P1_CODE_RESULT_121</span>, 
                [ <span class="pl-atom">if</span>, 
                  [ <span class="pl-atom">and</span>, 
                    [ <span class="pl-atom">==</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_head</span></span>]</span>, 
                      <span class="pl-atom">'Variable'</span>], 
                    [ <span class="pl-atom">==</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">checkInter</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                      [ 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args">[]</span>]</span>]], 
                  [ <span class="pl-atom">'get-variables'</span>, 
                    <span class="pl-var">_tail</span>, 
                    [ <span class="pl-atom">'union-atom'</span>, 
                      <span class="pl-var">_acc</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>]], 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">N</span>, <span class="pl-atom">'Variable'</span>, <span class="pl-var">O</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">checkInter</span>, <span class="pl-var">P</span>, <span class="pl-var">Q</span>, <span class="pl-var">R</span></span>)</span> , 
                  <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">13</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args">[]</span>]</span>, <span class="pl-var">S</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">R</span>, <span class="pl-var">S</span>, <span class="pl-var">O</span></span>)</span> , 
                  <span class="pl-var">P1_CODE_122</span> =  
                       
                    <span class="pl-atom">as_p1</span>( 
                       <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd119</span></span>]</span>, 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>), 
                       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd121</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_122</span>, 
                       [ <span class="pl-atom">'get-variables'</span>, 
                         <span class="pl-var">_tail</span>, 
                         [ <span class="pl-atom">'union-atom'</span>, 
                           <span class="pl-var">_acc</span>, 
                           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>]], 
                       ( <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span>  ,
                         <span class="pl-compound pl-level-0"><span class="pl-var">U</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">U</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>, <span class="pl-var">V</span></span>)</span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">T</span>, <span class="pl-var">V</span>, <span class="pl-var">P1_CODE_RESULT_122</span></span>)</span>)) , 
                  <span class="pl-var">P1_CODE_123</span> =  
                       
                    <span class="pl-atom">as_p1</span>( 
                       <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd119</span></span>]</span>, 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>), 
                       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd121</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_123</span>, 
                       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                       ( <span class="pl-compound pl-level-0"><span class="pl-var">W</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span>  ,
                         <span class="pl-compound pl-level-0"><span class="pl-var">X</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">W</span>, <span class="pl-var">X</span>, <span class="pl-var">P1_CODE_RESULT_123</span></span>)</span>)) , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">O</span>, <span class="pl-var">P1_CODE_122</span>, <span class="pl-var">P1_CODE_123</span>, <span class="pl-var">P1_CODE_RESULT_121</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_120</span>, <span class="pl-var">P1_CODE_121</span>, <span class="pl-var">P1_CODE_RESULT_119</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_36318884{$P1_CODE_119}</span>, <span class="pl-avar">_36318708{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;=========================================================================
%  ; This is the overloaded version of the function serves as a way to call the metta function to check types
/*
  (= (get-variables $pattern)  
    (get-variables $pattern ()))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-var">_pattern9</span>, <span class="pl-var">RetVal379</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_37595166{vn = ..., cns = ...}</span>, <span class="pl-avar">_37595242{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_37595242{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-avar">_37595194{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (is-symbol $var)  
    (== 
      (get-metatype $var) Symbol))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-symbol'</span>, <span class="pl-var">_var1</span>, <span class="pl-var">RetVal383</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_37707232{vn = ..., cns = ...}</span>, <span class="pl-avar">_37707308{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_37707308{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'Symbol'</span>, <span class="pl-avar">_37707260{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (is-variable $var)  
    (== 
      (get-metatype $var) Variable))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-variable'</span>, <span class="pl-var">_var5</span>, <span class="pl-var">RetVal387</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_37842400{vn = ..., cns = ...}</span>, <span class="pl-avar">_37842476{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_37842476{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'Variable'</span>, <span class="pl-avar">_37842428{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (is-expression $var)  
    (== 
      (get-metatype $var) Expression))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-expression'</span>, <span class="pl-var">_var9</span>, <span class="pl-var">RetVal391</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_37977570{vn = ..., cns = ...}</span>, <span class="pl-avar">_37977646{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_37977646{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-avar">_37977598{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: reverse-list
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Recursively reverses the order of elements in a list.
%  ;;
%  ;; Input:
%  ;;   - `$subparts`: The list to reverse (e.g., `(1 2 3 4)`).
%  ;;
%  ;; Output:
%  ;;   - A new list with elements in reverse order (e.g., `(4 3 2 1)`).
%  ;;   - Empty list `()` if input is empty.
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns empty list when input is empty.
%  ;;   2. Recursive Case:
%  ;;      a. Splits list into `$head` (first element) and `$tail` (remaining elements)
%  ;;      b. Recursively reverses `$tail`
%  ;;      c. Appends `$head` to the end of the reversed tail using `push-back`
/*
  (= (reverse-list ())  )
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'reverse-list'</span>, <span class="pl-var">Nil1</span>, []</span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_38112598{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span></span>) ).


/*
  (= (reverse-list $subparts)  
    (let 
      ($head $tail) 
      (decons-atom $subparts) 
      (push-back $head 
        (reverse-list $tail))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'reverse-list'</span>, <span class="pl-var">_subparts1</span>, <span class="pl-var">RetVal399</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_38212232{vn = ..., cns = ...}</span>, <span class="pl-avar">_38212308{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_38212308{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_38212380{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_38212380{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_38212400{$_tail}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'reverse-list'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'push-back'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_38212260{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: remove-element
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Recursively removes all occurrences of `$element` from `$list`, preserving
%  ;;   the order of remaining elements.
%  ;;
%  ;; Inputs:
%  ;;   - `$element`: The value to remove (e.g., `2` or `'a`).
%  ;;   - `$list`: The list to process (e.g., `(1 2 3 2 4)`).
%  ;;
%  ;; Output:
%  ;;   - A new list with all instances of `$element` removed.
%  ;;   - Empty list `()` if input is empty or all elements were removed.
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns empty list when input is empty.
%  ;;   2. Recursive Case:
%  ;;      a. Splits list into `$head` (first element) and `$tail` (remaining elements)
%  ;;      b. If `$head` matches `$element`, skips it and processes `$tail`
%  ;;      c. Otherwise, keeps `$head` and recursively processes `$tail`
%  ;; =============================================================================
/*
  (= (remove-element $_ ())  )
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'remove-element'</span>, <span class="pl-var">_element5</span>, <span class="pl-var">Nil5</span>, []</span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_38353832{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_38353860{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span></span>) ).


/*
  (= (remove-element $element $list)  
    (let 
      ($head $tail) 
      (decons-atom $list) 
      (if 
        (== $element $head) 
        (remove-element $element $tail) 
        (let $dummy 
          (remove-element $element $tail) 
          (cons-atom $head $dummy)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'remove-element'</span>, <span class="pl-var">_element9</span>, <span class="pl-var">_list1</span>, <span class="pl-var">RetVal407</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_38489870{vn = ..., cns = ...}</span>, <span class="pl-avar">_38489974{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_38489898{vn = ..., cns = ...}</span>, <span class="pl-avar">_38490016{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_38490016{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_38490088{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_38489974{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_38490088{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     _38490174{$P1_CODE_139} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_139</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'remove-element'</span>, <span class="pl-var">_element</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_element</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'remove-element'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_RESULT_139</span></span>)</span>)) , 
     _38490280{$P1_CODE_140} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_140</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_dummy</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'remove-element'</span>, <span class="pl-var">_element</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_element</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'remove-element'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">_dummy</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_dummy</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_140</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_38490174{$P1_CODE_139}</span>, <span class="pl-avar">_38490280{$P1_CODE_140}</span>, <span class="pl-avar">_38489926{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: append-list
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Prepends an atom to the front of a list. Note: This is actually a "cons"
%  ;;   operation 
%  ;;
%  ;; Inputs:
%  ;;   - `$atom`: The element to add to the front (e.g., `1` or `'a`).
%  ;;   - `$list`: The list to prepend to (e.g., `(2 3 4)`).
%  ;;
%  ;; Output:
%  ;;   - A new list with `$atom` as the first element followed by `$list`.
%  ;;   - If `$list` is empty, returns a singleton list containing `$atom`.
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns `($atom)` when `$list` is empty.
%  ;;   2. Recursive Case:
%  ;;      a. Deconstructs `$list` into `$head` and `$tail`
%  ;;      b. Recursively processes the tail
%  ;;      c. Reconstructs the list with `$atom` at the front
%  ;; =============================================================================
%  ;;
/*
  (= (append-list $atom ())  
    ($atom))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'append-list'</span>, <span class="pl-var">_atom5</span>, <span class="pl-var">Nil9</span>, <span class="pl-var">RetVal411</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_38918528{vn = ..., cns = ...}</span>, <span class="pl-avar">_38918632{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_38918556{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_38918632{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>]</span>, <span class="pl-avar">_38918584{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (append-list $atom $list)  
    (let* 
      ( ( ($head $tail) (decons-atom $list)) ($dummy (append-list $head $tail))) 
      (cons-atom $atom $dummy)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'append-list'</span>, <span class="pl-var">_atom9</span>, <span class="pl-var">_list5</span>, <span class="pl-var">RetVal415</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39048062{vn = ..., cns = ...}</span>, <span class="pl-avar">_39048166{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39048090{vn = ..., cns = ...}</span>, <span class="pl-avar">_39048208{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39048208{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_39048280{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39048280{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39048300{$_tail}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'append-list'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_39048354{$_dummy}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39048166{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39048354{$_dummy}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_39048118{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;TODO: what is the difference between append-list and append-list-v2
/*
  (= (append-list-v2 $atom ())  
    ($atom))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'append-list-v2'</span>, <span class="pl-var">_atom13</span>, <span class="pl-var">Nil13</span>, <span class="pl-var">RetVal419</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39229502{vn = ..., cns = ...}</span>, <span class="pl-avar">_39229606{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_39229530{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39229606{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>]</span>, <span class="pl-avar">_39229558{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (append-list-v2 $atom $list)  
    (let* 
      ( ( ($head $tail) (decons-atom $list)) (((append-list $head $tail)) ((append-list $head $tail)))) 
      (cons-atom $atom 
        ( (append-list $head $tail)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'append-list-v2'</span>, <span class="pl-var">_atom17</span>, <span class="pl-var">_list9</span>, <span class="pl-var">RetVal423</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39357816{vn = ..., cns = ...}</span>, <span class="pl-avar">_39357920{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39357844{vn = ..., cns = ...}</span>, <span class="pl-avar">_39357962{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39357962{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_39358034{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39357920{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-ellipsis">...</span>|<span class="pl-ellipsis">...</span></span>]</span></span>]</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_39357872{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;TODO: what is the difference between append-list and push-back
/*
  (= (push-back $atom ())  
    ($atom))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'push-back'</span>, <span class="pl-var">_atom21</span>, <span class="pl-var">Nil17</span>, <span class="pl-var">RetVal427</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39533364{vn = ..., cns = ...}</span>, <span class="pl-avar">_39533468{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_39533392{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39533468{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>]</span>, <span class="pl-avar">_39533420{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (push-back $atom $list)  
    (let* 
      ( ( ($head $tail) (decons-atom $list)) ($dummy (push-back $atom $tail))) 
      (cons-atom $head $dummy)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'push-back'</span>, <span class="pl-var">_atom25</span>, <span class="pl-var">_list13</span>, <span class="pl-var">RetVal431</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39663118{vn = ..., cns = ...}</span>, <span class="pl-avar">_39663222{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39663146{vn = ..., cns = ...}</span>, <span class="pl-avar">_39663264{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39663264{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_39663336{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39663222{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39663356{$_tail}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'push-back'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_39663410{$_dummy}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39663336{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39663410{$_dummy}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_39663174{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: insert
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Recursively inserts all elements from `$subparts` into `$res` in order,
%  ;;   effectively concatenating two lists by appending elements one by one.
%  ;;
%  ;; Inputs:
%  ;;   - `$subparts`: Source list of elements to insert (e.g., `(1 2 3)`).
%  ;;   - `$res`: Target list to receive elements (e.g., `(4 5 6)`).
%  ;;
%  ;; Output:
%  ;;   - A new list containing all elements of `$res` followed by all elements of `$subparts`.
%  ;;   - If `$subparts` is empty, returns `$res` unchanged.
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns `$res` when `$subparts` is empty.
%  ;;   2. Recursive Case:
%  ;;      a. Splits `$subparts` into `$head` (first element) and `$tail` (remaining elements)
%  ;;      b. Appends `$head` to `$res` using `push-back`
%  ;;      c. Recursively processes remaining `$tail` with the new result
/*
  (= (insert () $res)  $res)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">insert</span>, <span class="pl-var">Nil21</span>, <span class="pl-var">_res1</span>, <span class="pl-var">RetVal435</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_39855054{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39855082{vn = ..., cns = ...}</span>, <span class="pl-avar">_39855170{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_39855110{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_39855170{vn = ..., cns = ...}</span></span></span>) ).


/*
  (= (insert $subparts $res)  
    (let 
      ($head $tail) 
      (decons-atom $subparts) 
      (let $temp 
        (push-back $head $res) 
        (insert $tail $temp))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">insert</span>, <span class="pl-var">_subparts5</span>, <span class="pl-var">_res5</span>, <span class="pl-var">RetVal439</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39973712{vn = ..., cns = ...}</span>, <span class="pl-avar">_39973816{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_39973740{vn = ..., cns = ...}</span>, <span class="pl-avar">_39973858{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39973816{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_39973930{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39973930{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39973858{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'push-back'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_39974004{$_temp}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39973950{$_tail}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_39974004{$_temp}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">insert</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_39973768{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: is-present
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Recursively checks if `$atom` exists anywhere in `$list`, including nested sublists.
%  ;;   Returns a boolean (True/False) indicating presence.
%  ;;
%  ;; Inputs:
%  ;;   - `$atom`: The element to search for (any atomic value).
%  ;;   - `$list`: The list or nested structure to search (e.g., `(1 (2 3) 4)`).
%  ;;
%  ;; Output:
%  ;;   - True if `$atom` is found anywhere in `$list` (including nested lists).
%  ;;   - False if `$atom` is not found or `$list` is empty.
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns False for empty list.
%  ;;   2. Recursive Cases:
%  ;;      a. For expressions (nested lists):
%  ;;         i. Checks current head element
%  ;;         ii. Recursively checks both head and tail
%  ;;      b. For atoms:
%  ;;         i. Direct comparison with target atom
/*
  (= (is-present $_ ())  False)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-present'</span>, <span class="pl-var">_atom29</span>, <span class="pl-var">Nil25</span>, <span class="pl-atom">'False'</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_40142076{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_40142104{vn = ..., cns = ...}</span>, []</span>)</span></span>) ).


/*
  (= (is-present $atom $list)  
    (if 
      (is-expression $list) 
      (let* 
        ( ( ($head $tail) (decons-atom $list))) 
        (if 
          (== $atom $head) True 
          (or 
            (is-present $atom $head) 
            (is-present $atom $tail)))) 
      (if 
        (== $atom $list) True False)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-present'</span>, <span class="pl-var">_atom33</span>, <span class="pl-var">_list17</span>, <span class="pl-var">RetVal447</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_40298164{vn = ..., cns = ...}</span>, <span class="pl-avar">_40298268{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_40298192{vn = ..., cns = ...}</span>, <span class="pl-avar">_40298310{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_40298310{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-expression'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _40298376{$P1_CODE_147} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd147</span>, <span class="pl-var">P1_CODE_RESULT_147</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom,   _list   ]]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_atom</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-atom">'True'</span>, 
             [ <span class="pl-atom">or</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-present'</span>, <span class="pl-var">_atom</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-present'</span>, <span class="pl-var">_atom</span>|<span class="pl-ellipsis">...</span></span>]</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_list</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_atom</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-var">P1_CODE_148</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd147</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_148</span>, 
                [ <span class="pl-atom">or</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-present'</span>, <span class="pl-var">_atom</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-present'</span>, <span class="pl-var">_atom</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                <span class="pl-atom">call_for_unit</span>( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'is-present'</span>(<span class="pl-args"><span class="pl-var">_atom</span>, <span class="pl-var">_head</span></span>)</span><span class="pl-infix">;</span><span class="pl-compound"><span class="pl-functor">'is-present'</span>(<span class="pl-args"><span class="pl-var">_atom</span>, <span class="pl-var">_tail</span></span>)</span></span>, 
                  <span class="pl-var">P1_CODE_RESULT_148</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_148</span>, <span class="pl-var">P1_CODE_RESULT_147</span></span>)</span>)) , 
     _40298874{$P1_CODE_149} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_149</span>, 
         [ <span class="pl-atom">if</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_atom</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'True'</span>, <span class="pl-atom">'False'</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_atom</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_list</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">J</span>, <span class="pl-atom">'True'</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_RESULT_149</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_40298376{$P1_CODE_147}</span>, <span class="pl-avar">_40298874{$P1_CODE_149}</span>, <span class="pl-avar">_40298220{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: is-pattern
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Determines if an expression is a valid pattern by checking its structure
%  ;;   against common pattern forms. A pattern consists of a symbol followed by
%  ;;   variables or nested expressions.
%  ;;
%  ;; Input:
%  ;;   - `$expr`: The expression to evaluate (e.g., `(P $x $y)` or `(Q (R $z))`).
%  ;;
%  ;; Output:
%  ;;   - True if the expression matches pattern structure
%  ;;   - False otherwise
%  ;;
%  ;; Pattern Rules:
%  ;;   1. Binary form: ($link $x $y) where:
%  ;;      - $link is a symbol
%  ;;      - Both $x and $y are either variables or expressions
%  ;;   2. Unary form: ($link $x) where:
%  ;;      - $link is a symbol
%  ;;      - $x is either a variable or expression
%  ;;
%  ;; How it works:
%  ;;   1. Uses `unify` to match against two possible pattern structures
%  ;;   2. Checks each component with type predicates:
%  ;;      - `is-symbol` for the link/predicate
%  ;;      - `is-variable` or `is-expression` for arguments
%  ;;   3. Returns True if either pattern matches
%  ; ==============================================================================
%  ; (= (is-pattern $expr) False)
/*
  (= (is-pattern $expr)  
    (collapse( or 
      (unify $expr 
        (superpose-atom $x $y) 
        (and 
          (is-symbol superpose-atom) 
          (or 
            (or 
              (is-variable $x) 
              (is-expression $x)) 
            (or 
              (is-variable $y) 
              (is-expression $y)))) False) 
      (unify $expr 
        (superpose-atom $x) 
        (and 
          (is-symbol superpose-atom) 
          (or 
            (is-variable $x) 
            (is-expression $x))) False)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-pattern'</span>, <span class="pl-var">_expr1</span>, <span class="pl-var">RetVal451</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_40968458{vn = ..., cns = ...}</span>, <span class="pl-avar">_40968534{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_40968534{vn = ..., cns = ...}</span></span> , 
     _40968586{$P1_CODE_159} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_159</span>, 
         [ <span class="pl-atom">and</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-symbol'</span>, <span class="pl-atom">'superpose-atom'</span></span>]</span>, 
           [ <span class="pl-atom">or</span>, 
             [ <span class="pl-atom">or</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-variable'</span>, <span class="pl-var">_x</span></span>]</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-expression'</span>, <span class="pl-var">_x</span></span>]</span>], 
             [ <span class="pl-atom">or</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-variable'</span>, <span class="pl-var">_y</span></span>]</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-expression'</span>, <span class="pl-var">_y</span></span>]</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">B</span> <span class="pl-infix">=</span> <span class="pl-atom">'superpose-atom'</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-symbol'</span>, <span class="pl-var">B</span>, <span class="pl-var">P1_CODE_RESULT_159</span></span>)</span> , 
           <span class="pl-atom">call_for_unit</span>( ( <span class="pl-compound pl-level-0"><span class="pl-functor">'is-variable'</span>(<span class="pl-args"><span class="pl-var">_x</span></span>)</span>  ;
                                                         <span class="pl-compound pl-level-0"><span class="pl-functor">'is-expression'</span>(<span class="pl-args"><span class="pl-var">_x</span></span>)</span> ; 
                                                         <span class="pl-compound pl-level-0"><span class="pl-functor">'is-variable'</span>(<span class="pl-args"><span class="pl-var">_y</span></span>)</span> ; 
                                                         <span class="pl-compound pl-level-0"><span class="pl-functor">'is-expression'</span>(<span class="pl-args"><span class="pl-var">_y</span></span>)</span>), 
             <span class="pl-var">P1_CODE_RESULT_159</span>))) , 
     <span class="pl-atom">s</span>( <span class="pl-atom">unify</span>, 
       <span class="pl-var">A</span>, 
       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'superpose-atom'</span>, <span class="pl-avar">_40968682{$_x}</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-avar">_40968586{$P1_CODE_159}</span>, <span class="pl-atom">'False'</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_40968534{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">member</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_40968682{$_x}</span></span>)</span> , 
     _40968922{$P1_CODE_160} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_160</span>, 
         [ <span class="pl-atom">and</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-symbol'</span>, <span class="pl-atom">'superpose-atom'</span></span>]</span>, 
           [ <span class="pl-atom">or</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-variable'</span>, <span class="pl-var">_x</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-expression'</span>, <span class="pl-var">_x</span></span>]</span>]], 
           ((&#13;&#10; 
            (<span class="pl-compound pl-level-0"><span class="pl-atom">true</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-symbol'</span>, <span class="pl-atom">'superpose-atom'</span>, <span class="pl-var">P1_CODE_RESULT_160</span></span>)</span></span>),
            (<span class="pl-atom">call_for_unit</span>( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'is-variable'</span>(<span class="pl-args"><span class="pl-var">_x</span></span>)</span><span class="pl-infix">;</span><span class="pl-compound"><span class="pl-functor">'is-expression'</span>(<span class="pl-args"><span class="pl-var">_x</span></span>)</span></span>, 
               <span class="pl-var">P1_CODE_RESULT_160</span>))  ))) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">unify</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_40968922{$P1_CODE_160}</span>, <span class="pl-atom">'False'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'collapse('</span>, <span class="pl-atom">or</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_40968486{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: is-valid
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Checks if all elements in closure `$clous` exist within partition `$partion`.
%  ;;   Essentially verifies that a closure is fully contained within a partition.
%  ;;
%  ;; Inputs:
%  ;;   - `$clous`: The closure/list of elements to validate (e.g., `(A B C)`).
%  ;;   - `$partion`: The reference partition/list to check against (e.g., `(A B C D E)`).
%  ;;
%  ;; Output:
%  ;;   - True if every element in `$clous` exists in `$partion`.
%  ;;   - False if any element in `$clous` is missing from `$partion`.
%  ;;   - True if `$clous` is empty (vacuous truth).
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Empty closure is always valid (returns True).
%  ;;   2. Recursive Case:
%  ;;      a. Splits `$clous` into `$head` (first element) and `$tail` (remaining elements).
%  ;;      b. Checks if `$head` exists in `$partion` using `is-present`.
%  ;;      c. Recursively validates the remaining elements in `$tail`.
/*
  (= (is-valid () $_)  True)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-valid'</span>, <span class="pl-var">Nil29</span>, <span class="pl-var">_partion1</span>, <span class="pl-atom">'True'</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_41450100{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_41450128{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span></span>) ).


/*
  (= (is-valid $clous $partion)  
    (let 
      ($head $tail) 
      (decons-atom $clous) 
      (and 
        (is-present $head $partion) 
        (is-valid $tail $partion))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-valid'</span>, <span class="pl-var">_clous1</span>, <span class="pl-var">_partion5</span>, <span class="pl-var">RetVal459</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_41563362{vn = ..., cns = ...}</span>, <span class="pl-avar">_41563466{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_41563390{vn = ..., cns = ...}</span>, <span class="pl-avar">_41563508{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_41563466{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_41563580{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_41563580{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_41563508{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-present'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_41563418{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_41563600{$_tail}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_41563508{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-valid'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_41563418{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: comp
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Creates all possible ordered pairs between `$main_head` and elements of `$list`,
%  ;;   then recursively combines them. The operation resembles a Cartesian product
%  ;;   between the main head and list elements.
%  ;;
%  ;; Inputs:
%  ;;   - `$main_head`: The primary element to pair with each list item (e.g., `A`).
%  ;;   - `$list`: The list of elements to pair with `$main_head` (e.g., `(1 2 3)`).
%  ;;
%  ;; Output:
%  ;;   - A new list containing all `($main_head $x)` pairs for each `$x` in `$list`,
%  ;;     followed by recursive applications to the remaining elements.
%  ;;   - Empty list if either input is empty.
%  ;;   - ((1 A) (2 A) (3 A))
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns empty list when `$list` is empty.
%  ;;   2. Recursive Case:
%  ;;      a. Splits `$list` into current element `$x` and remaining `$tail`
%  ;;      b. Creates pair `(append-list $main_head $x)`
%  ;;      c. Recursively processes `$tail` and combines results
%  ;;
/*
  (= (comp $main_head $list)  
    (map-atom $list $x 
      ($x $main_head)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">comp</span>, <span class="pl-var">_main_head1</span>, <span class="pl-var">_list21</span>, <span class="pl-var">RetVal463</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_41736430{vn = ..., cns = ...}</span>, <span class="pl-avar">_41736534{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_41736458{vn = ..., cns = ...}</span>, <span class="pl-avar">_41736576{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_41736576{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_41736628{$_x}</span></span> , 
     <span class="pl-atom">me</span>( <span class="pl-atom">'map-atom'</span>, 
       <span class="pl-var">A</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, 
       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_41736628{$_x}</span>, <span class="pl-avar">_41736534{vn = ..., cns = ...}</span></span>]</span>, 
       _41736486{vn = ..., cns = ...})</span>) ).


%  ;; =============================================================================
%  ;; Function: get-clouses 
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Recursively extracts all expression nodes from a pattern while maintaining
%  ;;   their hierarchical structure. Returns a flat list of all sub-expressions.
%  ;;
%  ;; Input:
%  ;;   - `$pattern`: The pattern to analyze (e.g., `(, (, A B) (, C D))`).
%  ;;
%  ;; Output:
%  ;;   - A flattened list containing:
%  ;;     * The root expression (if it's a compound expression)
%  ;;     * All sub-expressions at any nesting level
%  ;;     * Atomic values are excluded from the results
%  ;;   - Empty list if input contains no expressions
%  ;;   - (,  A B C D )`
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns empty list when pattern is empty
%  ;;   2. Recursive Processing:
%  ;;      a. Deconstructs pattern into head and tail
%  ;;      b. For expression heads:
%  ;;         i. Adds the expression itself to results
%  ;;         ii. Recursively processes both its contents and the tail
%  ;;      c. For atomic heads, just processes the tail
/*
  (= (get-clouses $pattern)  
    (let $clouses 
      (_get-clouses $pattern) 
      (cons-atom , $clouses)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-clouses'</span>, <span class="pl-var">_pattern13</span>, <span class="pl-var">RetVal467</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_41903334{vn = ..., cns = ...}</span>, <span class="pl-avar">_41903410{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_41903410{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'_get-clouses'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_41903464{$_clouses}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_41903464{$_clouses}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_41903362{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (_get-clouses $pattern)  
    (if 
      (== () $pattern) () 
      (let* 
        ( ( ($h $t) (decons-atom $pattern)) 
          ($l (if (== (get-metatype $h) Expression) (_get-clouses $h) (if (== , $h) () ($h)))) 
          ($r (_get-clouses $t))) 
        (union-atom $l $r))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'_get-clouses'</span>, <span class="pl-var">_pattern17</span>, <span class="pl-var">RetVal471</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_42101946{vn = ..., cns = ...}</span>, <span class="pl-avar">_42102022{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_42102022{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _42102102{$P1_CODE_167} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_167</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [     _h     ,    _t     ],
               [ decons-atom, _pattern  ]], 
             [ <span class="pl-var">_l</span>, 
               [ <span class="pl-atom">if</span>, 
                 [ <span class="pl-atom">==</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_h</span></span>]</span>, 
                   <span class="pl-atom">'Expression'</span>], 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'_get-clouses'</span>, <span class="pl-var">_h</span></span>]</span>, 
                 [ <span class="pl-atom">if</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-atom">','</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                   [], 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_h</span></span>]</span>]]], 
             [ <span class="pl-var">_r</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'_get-clouses'</span>, <span class="pl-var">_t</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">_l</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_h</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_h</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">F</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-var">P1_CODE_168</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_168</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'_get-clouses'</span>, <span class="pl-var">_h</span></span>]</span>, 
                <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_h</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'_get-clouses'</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_168</span></span>)</span></span>) , 
           <span class="pl-var">P1_CODE_169</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd169</span>, <span class="pl-var">P1_CODE_RESULT_169</span>, 
                [ <span class="pl-atom">if</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-atom">','</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                  [], 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_h</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_h</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-atom">','</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
                  <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
                  <span class="pl-var">P1_CODE_170</span> =  
                       
                    <span class="pl-atom">as_p1</span>( 
                       <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-compound"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-ellipsis">...</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span></span>)</span>, 
                       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd169</span></span>]</span>, 
                       <span class="pl-var">RetTypeNotCd170</span>, 
                       <span class="pl-var">P1_CODE_RESULT_170</span>, 
                       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_h</span></span>]</span>, 
                       <span class="pl-atom">eval_for1</span>( 
                          <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd169</span></span>]</span>, 
                            <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-compound"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-ellipsis">...</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span></span>)</span>), 
                          <span class="pl-var">RetTypeNotCd170</span>, 
                          <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_h</span></span>]</span>, 
                          <span class="pl-var">P1_CODE_RESULT_170</span>)) , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">J</span>, [], <span class="pl-var">P1_CODE_170</span>, <span class="pl-var">P1_CODE_RESULT_169</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_168</span>, <span class="pl-var">P1_CODE_169</span>, <span class="pl-var">_l</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_t</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'_get-clouses'</span>, <span class="pl-var">K</span>, <span class="pl-var">_r</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_l</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_r</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">P1_CODE_RESULT_167</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_42102102{$P1_CODE_167}</span>, <span class="pl-avar">_42101974{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: find_max
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Recursively finds the maximum number in a list of numbers using tail recursion.
%  ;;   Requires an initial `$max` value (typically -∞ or first element).
%  ;;
%  ;; Inputs:
%  ;;   - `$num_list`: List of numbers to search (e.g., `(3 1 4 2)`).
%  ;;   - `$max`: Current maximum value (initialize with minimal value).
%  ;;
%  ;; Output:
%  ;;   - The largest number found in `$num_list`.
%  ;;   - Returns `$max` unchanged if list is empty.
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns current `$max` when list is empty.
%  ;;   2. Recursive Case:
%  ;;      a. Deconstructs list into `$head` (first number) and `$tail` (remaining numbers)
%  ;;      b. Compares `$head` with current `$max`
%  ;;      c. Recurses with `$tail` and updated maximum
/*
  (= (find_max_helper $num_list $max)  
    (if 
      (== $num_list ()) $max 
      (let* 
        ( ( ($head $tail) (decons-atom $num_list)) ($dummy (find_max_helper $tail (if (> $head $max) $head $max)))) $dummy)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">find_max_helper</span>, <span class="pl-var">_num_list1</span>, <span class="pl-var">_max1</span>, <span class="pl-var">RetVal475</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_42990434{vn = ..., cns = ...}</span>, <span class="pl-avar">_42990538{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_42990462{vn = ..., cns = ...}</span>, <span class="pl-avar">_42990580{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_42990538{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_42990580{vn = ..., cns = ...}</span></span> , 
     _42990666{$P1_CODE_183} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_183</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom, _num_list ]], 
             [ <span class="pl-var">_dummy</span>, 
               [ <span class="pl-atom">find_max_helper</span>, 
                 <span class="pl-var">_tail</span>, 
                 [ <span class="pl-atom">if</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">_head</span>, <span class="pl-var">_max</span>]]]], 
           <span class="pl-var">_dummy</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_num_list</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">E</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_max</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_max</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">find_max_helper</span>, <span class="pl-var">F</span>, <span class="pl-var">L</span>, <span class="pl-var">_dummy</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_183</span><span class="pl-infix">=</span><span class="pl-var">_dummy</span></span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_42990666{$P1_CODE_183}</span>, <span class="pl-avar">_42990490{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (max $list)  
    (find_max_helper $list 
      (car-atom $list)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">max</span>, <span class="pl-var">_list25</span>, <span class="pl-var">RetVal479</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_43458148{vn = ..., cns = ...}</span>, <span class="pl-avar">_43458224{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_43458224{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_43458224{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">find_max_helper</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_43458176{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (find_min_helper $num_list $min)  
    (if 
      (== $num_list ()) $min 
      (let* 
        ( ( ($head $tail) (decons-atom $num_list)) ($dummy (find_min_helper $tail (if (< $head $min) $head $min)))) $dummy)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">find_min_helper</span>, <span class="pl-var">_num_list5</span>, <span class="pl-var">_min1</span>, <span class="pl-var">RetVal483</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_43618994{vn = ..., cns = ...}</span>, <span class="pl-avar">_43619098{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_43619022{vn = ..., cns = ...}</span>, <span class="pl-avar">_43619140{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_43619098{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_43619140{vn = ..., cns = ...}</span></span> , 
     _43619226{$P1_CODE_187} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_187</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom, _num_list ]], 
             [ <span class="pl-var">_dummy</span>, 
               [ <span class="pl-atom">find_min_helper</span>, 
                 <span class="pl-var">_tail</span>, 
                 [ <span class="pl-atom">if</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">_head</span>, <span class="pl-var">_min</span>]]]], 
           <span class="pl-var">_dummy</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_num_list</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">E</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_min</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_min</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">find_min_helper</span>, <span class="pl-var">F</span>, <span class="pl-var">L</span>, <span class="pl-var">_dummy</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_187</span><span class="pl-infix">=</span><span class="pl-var">_dummy</span></span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_43619226{$P1_CODE_187}</span>, <span class="pl-avar">_43619050{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (min $list)  
    (find_min_helper $list 
      (car-atom $list)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">min</span>, <span class="pl-var">_list29</span>, <span class="pl-var">RetVal487</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_44086708{vn = ..., cns = ...}</span>, <span class="pl-avar">_44086784{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_44086784{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_44086784{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">find_min_helper</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_44086736{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: get-cnj-clauses
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Extracts components from a conjunctive pattern. If the pattern is explicitly
%  ;;   conjunctive (head is ","), returns the tail. Otherwise, treats the entire
%  ;;   pattern as a single clause.
%  ;;
%  ;; Input:
%  ;;   - `$pattern`: A potential conjunctive pattern (e.g., `(, A B)` or `(P Q R)`).
%  ;;
%  ;; Output:
%  ;;   - For explicit conjunctions (head is ","): returns the subpatterns (e.g., `(A B)`)
%  ;;   - For other patterns: returns the original pattern unchanged
%  ;;
%  ;; How it works:
%  ;;   1. Deconstructs the pattern into head and tail
%  ;;   2. Checks if head is the conjunction operator ","
%  ;;   3. Returns tail for conjunctions, full pattern otherwise
%  ;;
/*
  (= (get-cnj-clouses $pattern)  
    (let 
      ($head $tail) 
      (decons-atom $pattern) 
      (if 
        (== $head ,) $tail $pattern)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-cnj-clouses'</span>, <span class="pl-var">_pattern21</span>, <span class="pl-var">RetVal491</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_44228778{vn = ..., cns = ...}</span>, <span class="pl-avar">_44228854{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_44228854{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_44228926{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_44228926{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_44228946{$_tail}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_44228854{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_44228806{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: min-max
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Returns a tuple containing both the minimum and maximum values from a list of numbers
%  ;;   in a single pass through the data (if `min` and `max` are optimized).
%  ;;
%  ;; Input:
%  ;;   - `$list`: A list of comparable elements (typically numbers)
%  ;;              e.g., `(3 1 4 1 5 9)`
%  ;;
%  ;; Output:
%  ;;   - A tuple (list) where:
%  ;;     - First element is the minimum value
%  ;;     - Second element is the maximum value
%  ;;   - Undefined behavior for empty lists
%  ;;
%  ;; How it works:
%  ;;   1. Applies both `min` and `max` to the same list
%  ;;   2. Returns results as a tuple (2-element list)
/*
  (= (min-max $list)  
    (min $list)
    (max $list))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'min-max'</span>, 
     <span class="pl-var">_list33</span>, 
     [ [  min ,_list],
       [  max ,_list]]) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_44406284{vn = ..., cns = ...}</span>, <span class="pl-avar">_44406330{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (var-appers $_ ())  )
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'var-appers'</span>, <span class="pl-var">_var13</span>, <span class="pl-var">Nil33</span>, []</span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_44521078{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_44521106{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span></span>) ).


/*
  (= (var-appers $var $blk)  
    (let* 
      ( ( ($head $tail) (decons-atom $blk)) ($is_present (let $temp (collapse (is-present $var $head)) (car-atom $temp)))) 
      (if $is_present 
        (let $dummy 
          (var-appers $var $tail) 
          (cons-atom $var $dummy)) 
        (var-appers $var $tail))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'var-appers'</span>, <span class="pl-var">_var17</span>, <span class="pl-var">_blk1</span>, <span class="pl-var">RetVal503</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_44672510{vn = ..., cns = ...}</span>, <span class="pl-avar">_44672614{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_44672538{vn = ..., cns = ...}</span>, <span class="pl-avar">_44672656{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_44672656{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_44672728{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">C</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span></span>, 
       _44672810{$_temp}) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_44672810{$_temp}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_44672850{$_is_present}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_44672850{$_is_present}</span></span> , 
     _44672888{$P1_CODE_191} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_191</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_dummy</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'var-appers'</span>, <span class="pl-var">_var</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_var</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'var-appers'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">_dummy</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_dummy</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_191</span></span>)</span>)) , 
     _44673090{$P1_CODE_192} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_192</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'var-appers'</span>, <span class="pl-var">_var</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'var-appers'</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">P1_CODE_RESULT_192</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_44672888{$P1_CODE_191}</span>, <span class="pl-avar">_44673090{$P1_CODE_192}</span>, <span class="pl-avar">_44672566{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%  ;; Common Utils from prev file ;;
%  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%   ;; Declaration of List data type and constructors
%  ; (: List (-> $a Type))
%  ; (: Nil (List $a))
%  ; (: Cons (-> $a (List $a) (List $a)))
%  ;  ;; Define Nat
%  ; (: Nat Type)
%  ; (: Z Nat)
%  ; (: S (-> Nat Nat))
%  ;; Define cast functions between Nat and Number
%  ; (: fromNumber (-> Number Nat))
/*
  (= (fromNumber $n)  
    (if 
      (<= $n 0) Z 
      (S (fromNumber (- $n 1)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">fromNumber</span>, <span class="pl-var">_n1</span>, <span class="pl-var">RetVal507</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_45166764{vn = ..., cns = ...}</span>, <span class="pl-avar">_45166840{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_45166840{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;=</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _45166914{$P1_CODE_199} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_199</span>, 
         [ <span class="pl-atom">'S'</span>, 
           [ <span class="pl-atom">fromNumber</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_n</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_n</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">C</span>, <span class="pl-int">1</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">fromNumber</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'S'</span>, <span class="pl-var">E</span>, <span class="pl-var">P1_CODE_RESULT_199</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'Z'</span>, <span class="pl-avar">_45166914{$P1_CODE_199}</span>, <span class="pl-avar">_45166792{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; (: fromNat (-> Nat Number))
/*
  (= (fromNat Z)  0)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">fromNat</span>, <span class="pl-var">Z1</span>, <span class="pl-int">0</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_45404080{vn = ..., cns = ...}</span>, <span class="pl-atom">'Z'</span></span>)</span></span>) ).


/*
  (= (fromNat (S $k))  
    (+ 1 
      (fromNat $k)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">fromNat</span>, <span class="pl-var">S__k1</span>, <span class="pl-var">RetVal515</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_45499338{vn = ..., cns = ...}</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'S'</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_45499424{$_k}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">fromNat</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-int">1</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_45499366{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; this consider every thing as a pattern exept for symbole
/*
  (= (is-pattern-et $expr)  
    (not (is-symbol $expr)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-pattern-et'</span>, <span class="pl-var">_expr5</span>, <span class="pl-var">RetVal519</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_45612726{vn = ..., cns = ...}</span>, <span class="pl-avar">_45612802{vn = ..., cns = ...}</span></span>)</span> , 
     ( <span class="pl-atom">\+</span> ( 
        eval_true( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">A</span><span class="pl-infix">=</span><span class="pl-var">_expr</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-symbol'</span>, <span class="pl-var">A</span>, <span class="pl-var">RetVal519</span></span>)</span></span>)) )</span>) ).


%  ; Function: tuple-count
%   ; Description: Calculates the tuple-count of a tuple.
%   ; Parameters:
%   ;   - $tuple: The tuple whose tuple-count is to be calculated.
%   ; Returns:
%   ;   - The tuple-count of the tuple as an integer.
%   ;; Count the number elements in an expression
%  ;; This is very slow, use the grounded python function instead
%  ;    (: tuple-count (-> Any Number))
/*
  (= (tuple-count $atom)  
    (size-atom $atom))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-var">_atom37</span>, <span class="pl-var">RetVal523</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_45743364{vn = ..., cns = ...}</span>, <span class="pl-avar">_45743440{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_45743440{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_45743392{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Tuple count grounded python function
%  ; (import! &self  helper)
%  ; ! (import! &self  helper)
%  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%   ; Function: sum
%   ; Description: Calculates the sum of elements in a list.
%   ; Parameters:
%   ;   - $list: The list of numbers to be summed.
%   ; Returns:
%   ;   - The sum of the elements in the list as an integer.
%  ; (= (sum $list) (
%  ;         if (== $list ())
%  ;         0
%  ;         (+ (car-atom $list) (sum (cdr-atom $list)))
%  ;     ))
/*
  (= (sum $list)  
    (foldl-atom $list 0 $acc $x 
      (+ $acc $x)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">sum</span>, <span class="pl-var">_list37</span>, <span class="pl-var">RetVal527</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_45861994{vn = ..., cns = ...}</span>, <span class="pl-avar">_45862070{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_45862070{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_45862122{$_acc}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_45862148{$_x}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_45862122{$_acc}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_45862148{$_x}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'foldl-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_45862022{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; This function calculates the average of a tuple of numbers.
%   ; It takes a tuple as input and returns the average value.
%   ; The average is computed by dividing the sum of the tuple elements by the tuple-count of the tuple.
/*
  (= (avrg-tuple $tuple)  
    (// 
      (sum $tuple) 
      (size-atom $tuple)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'avrg-tuple'</span>, <span class="pl-var">_tuple1</span>, <span class="pl-var">RetVal531</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_45992998{vn = ..., cns = ...}</span>, <span class="pl-avar">_45993074{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_45993074{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">sum</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_45993074{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_45993026{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%  ;; Count the number of instances of a given pattern
%  ;;(: counter (-> hyperon::space::DynSpace Atom Number))
/*
  (= (counter $db $ptrn)  
    (let $result 
      (collapse (match $db $ptrn $ptrn)) 
      (tuple-count $result)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">counter</span>, <span class="pl-var">_db5</span>, <span class="pl-var">_ptrn1</span>, <span class="pl-var">RetVal535</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46124518{vn = ..., cns = ...}</span>, <span class="pl-avar">_46124622{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46124546{vn = ..., cns = ...}</span>, <span class="pl-avar">_46124664{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">B</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">metta_atom_iter</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span></span></span>, 
       _46124736{$_result}) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_46124736{$_result}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_46124574{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Count the number of instances of a given pattern
/*
  (= (count $pattern $db)  
    (let* 
      ( ($dptrn (Debruijn2var $pattern (Cons $_ (Cons $_ Nil)))) ($result (collapse (match $db $dptrn $dptrn)))) 
      (tuple-count $result)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">count</span>, <span class="pl-var">_pattern25</span>, <span class="pl-var">_db9</span>, <span class="pl-var">RetVal539</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46314756{vn = ..., cns = ...}</span>, <span class="pl-avar">_46314860{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46314784{vn = ..., cns = ...}</span>, <span class="pl-avar">_46314902{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_46314860{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'Cons'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-atom">'Nil'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'Cons'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'Debruijn2var'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_46315020{$_dptrn}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">F</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">metta_atom_iter</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span></span></span>, 
       _46315078{$_result}) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_46315078{$_result}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-avar">_46314812{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Evaluate if the pattern has enough support
%   ;; Evaluate if the pattern has enough support
%  ; (: sup-eval (-> hyperon::space::DynSpace Atom Number Boolean))
/*
  (= (sup-eval $db $pattern $ms)  
    (let $sup 
      (counter $db $pattern) 
      (if 
        (>= $sup $ms) True False)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'sup-eval'</span>, <span class="pl-var">_db13</span>, <span class="pl-var">_pattern29</span>, <span class="pl-var">_ms1</span>, <span class="pl-var">RetVal543</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46585652{vn = ..., cns = ...}</span>, <span class="pl-avar">_46585784{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46585680{vn = ..., cns = ...}</span>, <span class="pl-avar">_46585826{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46585708{vn = ..., cns = ...}</span>, <span class="pl-avar">_46585868{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_46585784{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_46585826{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">counter</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_46585936{$_sup}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_46585936{$_sup}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_46585868{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;=</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-atom">'True'</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_46585736{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; returns the number of support of a pattern
/*
  (= (sup-num $db $pattern)  
    (let $sup 
      (counter $db $pattern) $sup))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'sup-num'</span>, <span class="pl-var">_db17</span>, <span class="pl-var">_pattern33</span>, <span class="pl-var">RetVal547</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46754252{vn = ..., cns = ...}</span>, <span class="pl-avar">_46754356{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46754280{vn = ..., cns = ...}</span>, <span class="pl-avar">_46754398{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_46754356{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_46754398{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">counter</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_46754466{$_sup}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_46754308{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_46754466{$_sup}</span></span></span>) ).


/*
  (= (sup-num-special $db $pattern)  
    (let $sup 
      (tuple-count (collapse (match $db $x (let $pattern $x $pattern)))) $sup))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'sup-num-special'</span>, <span class="pl-var">_db21</span>, <span class="pl-var">_pattern37</span>, <span class="pl-var">RetVal551</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46895060{vn = ..., cns = ...}</span>, <span class="pl-avar">_46895164{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_46895088{vn = ..., cns = ...}</span>, <span class="pl-avar">_46895206{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       ( <span class="pl-compound pl-level-0"><span class="pl-var">B</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span>  ,
         <span class="pl-compound pl-level-0"><span class="pl-functor">metta_atom_iter</span>(<span class="pl-args"><span class="pl-var">B</span>, <span class="pl-var">_x</span></span>)</span> , 
         <span class="pl-compound pl-level-0"><span class="pl-var">_pattern</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span> , 
         <span class="pl-compound pl-level-0"><span class="pl-var">A</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>), 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_46895318{$_sup}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_46895116{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_46895318{$_sup}</span></span></span>) ).


%  ;Check if expression is truth value or not
%  ; (: cog-tv? (-> Atom Bool))
/*
  (= (cog-tv? $_)  
    (if 
      (== 
        (match &self 
          (stv $_ $_ $_) True) True) True False))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'cog-tv?'</span>, <span class="pl-var">EXP1</span>, <span class="pl-var">RetVal555</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_47096896{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">get_value</span>(<span class="pl-args"><span class="pl-atom">'&amp;self'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span></span>)</span> , 
     <span class="pl-atom">metta_atom_iter</span>( <span class="pl-var">A</span>, [
       <span class="pl-atom">stv</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-atom">'True'</span>, <span class="pl-atom">'True'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'True'</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_47096924{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (has-type $_ Nil)  False)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'has-type'</span>, <span class="pl-var">_x13</span>, <span class="pl-var">Nil37</span>, <span class="pl-atom">'False'</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_47295362{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_47295390{vn = ..., cns = ...}</span>, <span class="pl-atom">'Nil'</span></span>)</span></span>) ).


/*
  (= (has-type $x $y)  
    (== $x 
      (car-atom $y)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'has-type'</span>, <span class="pl-var">_x17</span>, <span class="pl-var">_y1</span>, <span class="pl-var">RetVal563</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_47404912{vn = ..., cns = ...}</span>, <span class="pl-avar">_47405016{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_47404940{vn = ..., cns = ...}</span>, <span class="pl-avar">_47405058{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_47405016{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_47405058{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_47404968{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; (= (has-type $x $y) (let $che (car-atom $y) (== $x $che)))
%  ;;(: get-arity (-> $pattern) Number)
%   ;; we substruct 1 since the get-arity count the all tuple and we don't want to count
%   ;; the "AND LINK" as a part of the arity
/*
  (= (get-arity Nil)  0)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-arity'</span>, <span class="pl-var">Nil41</span>, <span class="pl-int">0</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_47544170{vn = ..., cns = ...}</span>, <span class="pl-atom">'Nil'</span></span>)</span></span>) ).


/*
  (= (get-arity $pattern)  
    (- 
      (tuple-count $pattern) 1))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-arity'</span>, <span class="pl-var">_pattern41</span>, <span class="pl-var">RetVal571</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_47639420{vn = ..., cns = ...}</span>, <span class="pl-avar">_47639496{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_47639496{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-int">1</span>, <span class="pl-avar">_47639448{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;     for pattern type Nil will run both implmentation of  n_conjucts
/*
  (= (n_conjuncts Nil)  0)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">n_conjuncts</span>, <span class="pl-var">Nil45</span>, <span class="pl-int">0</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_47749294{vn = ..., cns = ...}</span>, <span class="pl-atom">'Nil'</span></span>)</span></span>) ).


%  ; (= (n_conjuncts $pattern)
%   ;     (if (not (has-type lambda $pattern))
%   ;         0
%   ;         (if (or (has-type and $pattern) (has-type Present $pattern))
%   ;             (get-arity (cdr-atom $pattern))
%   ;             1)))
%  ; (= (n_conjuncts $pattern) (
%  ;         if (not (is-pattern-et $pattern))
%  ;         0
%  ; ( let* (($che ,) ($pro (has-type $che $pattern))) (if $pro
%  ;             (get-arity $pattern)
%  ;             1
%  ;         ))
%  ; )
%  ; )
/*
  (= (n_conjuncts $pattern)  
    (if 
      (not (is-pattern-et $pattern)) 0 
      (let $che 
        (has-type , $pattern) 
        (if $che 
          (get-arity $pattern) 1))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">n_conjuncts</span>, <span class="pl-var">_pattern45</span>, <span class="pl-var">RetVal579</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_47873574{vn = ..., cns = ...}</span>, <span class="pl-avar">_47873650{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-prefix">\+</span><span class="pl-compound"><span class="pl-functor">eval_true</span>(<span class="pl-args">(<span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span>)</span>)</span></span> , 
     _47873724{$P1_CODE_203} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd203</span>, <span class="pl-var">P1_CODE_RESULT_203</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_che</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'has-type'</span>, <span class="pl-atom">','</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-var">_che</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-arity'</span>, <span class="pl-var">_pattern</span></span>]</span>, 
             <span class="pl-int">1</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'has-type'</span>, <span class="pl-atom">','</span>, <span class="pl-var">C</span>, <span class="pl-var">_che</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_che</span></span> , 
           <span class="pl-var">P1_CODE_204</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd203</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_204</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-arity'</span>, <span class="pl-var">_pattern</span></span>]</span>, 
                <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-arity'</span>, <span class="pl-var">E</span>, <span class="pl-var">P1_CODE_RESULT_204</span></span>)</span></span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">D</span>, <span class="pl-var">P1_CODE_204</span>, <span class="pl-int">1</span>, <span class="pl-var">P1_CODE_RESULT_203</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-avar">_47873724{$P1_CODE_203}</span>, <span class="pl-avar">_47873602{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Function: intilize
%  ;; 
%  ;; Description:
%  ;;   Initializes the given database by performing the following steps:
%  ;;     1. Retrieves all atoms from the database ($db) using get-atoms.
%  ;;     2. Collapses the retrieved atoms to form a simplified representation.
%  ;;     3. Counts the number of tuples present in the collapsed data.
%  ;;     4. Adds a new atom to self with the computed tuple count.
%  ;;
%  ;; Parameters:
%  ;;   $db - The database object containing the atoms to process.
%  ;;
%  ;; Returns:
%  ;;   The modified self with the new atom added, encapsulating the tuple count.
/*
  (= (intilize $db)  
    (add-atom &self 
      (db-size $db 
        (tuple-count (collapse (get-atoms $db))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">intilize</span>, <span class="pl-var">_db25</span>, <span class="pl-var">RetVal583</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_48226620{vn = ..., cns = ...}</span>, <span class="pl-avar">_48226696{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">get_value</span>(<span class="pl-args"><span class="pl-atom">'&amp;self'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_48226696{vn = ..., cns = ...}</span></span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">C</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">D</span>, <span class="pl-var">C</span></span>)</span></span>, 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'db-size'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'add-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_48226648{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Function: db_size
%  ;;
%  ;; Description:
%  ;;   Computes the size of a dynamic space by counting the number of atoms present.
%  ;;
%  ;; Parameters:
%  ;;   $db - An instance of hyperon::space::DynSpace representing the database.
%  ;;
%  ;; Returns:
%  ;;   A Number indicating the total count of atoms in the database.
%  ;;
%  ;; Details:
%  ;;   - Retrieves all atoms from the dynamic space using get-atoms.
%  ;;   - Collapses the list of atoms to a simpler form.
%  ;;   - Uses tuple-count to determine the number of atoms.
%   ;;db size
%  ; (: db_size (-> SpaceType  Number))
/*
  (= (db_size $db)  
    (let* 
      ( ($_ (println! $db)) 
        ($db_content (collapse (get-atoms $db))) 
        ($db_size (tuple-count $db_content))) $db_size))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-var">_db29</span>, <span class="pl-var">RetVal587</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_48410610{vn = ..., cns = ...}</span>, <span class="pl-avar">_48410686{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_48410686{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">B</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">C</span>, <span class="pl-var">B</span></span>)</span></span>, 
       _48410772{$_db_content}) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_48410772{$_db_content}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_48410812{$_db_size}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_48410638{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_48410812{$_db_size}</span></span></span>) ).


%  ;;abs accepts a number and returns an absolute value of a number
%  ; (: abs (-> Number Number))
/*
  (= (abs $x)  
    (if 
      (>= $x 0) $x 
      (* $x -1)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">abs</span>, <span class="pl-var">_x21</span>, <span class="pl-var">RetVal591</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_48615888{vn = ..., cns = ...}</span>, <span class="pl-avar">_48615964{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_48615964{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;=</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_48615964{vn = ..., cns = ...}</span></span> , 
     _48616050{$P1_CODE_211} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Number'</span>, <span class="pl-var">P1_CODE_RESULT_211</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">_x</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-atom">true</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span></span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_48616050{$P1_CODE_211}</span>, <span class="pl-avar">_48615916{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; equals-to-zero  accepts a Number and compares it with zero if it is equals to zero it returns a boolean value True else False
%  ; (: equals-to-zero (-> Number Bool))
/*
  (= (equals-to-zero $x)  
    (== $x 0))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'equals-to-zero'</span>, <span class="pl-var">_x25</span>, <span class="pl-var">RetVal595</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_48826504{vn = ..., cns = ...}</span>, <span class="pl-avar">_48826580{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_48826580{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-avar">_48826532{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; classify_integer_position function accepts a Number and returns a strings that tells if a number is Greater than zero equal to zero or less than zero
%  ; (: classify_integer_position (-> Number String))
/*
  (= (classify_integer_position $x)  
    (if 
      (> $x 0) 
      ("Greater than zero") 
      (case 
        (equals-to-zero $x) 
        ( (False "Less than zero") (True "Equal to zero")))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">classify_integer_position</span>, <span class="pl-var">_x29</span>, <span class="pl-var">RetVal599</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_48965132{vn = ..., cns = ...}</span>, <span class="pl-avar">_48965208{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_48965208{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _48965282{$P1_CODE_215} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd215</span>, <span class="pl-var">P1_CODE_RESULT_215</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-string">"Greater than zero"</span></span>]</span>, 
         <span class="pl-atom">eval_for1</span>( 
            <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
            <span class="pl-var">RetTypeNotCd215</span>, 
            <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-string">"Greater than zero"</span></span>]</span>, 
            <span class="pl-var">P1_CODE_RESULT_215</span>)) , 
     _48965360{$P1_CODE_216} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">CASE_RESULT_P1_CODE_RESULT_216_1</span>, 
         [ <span class="pl-atom">case</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'equals-to-zero'</span>, <span class="pl-var">_x</span></span>]</span>, 
           [ [     False     ,Less than zero],
             [      True     ,Equal to zero ]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'equals-to-zero'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-var">CASE_SWITCH_11</span> =  
                
             [ <span class="pl-compound pl-level-0"><span class="pl-functor">caseOption</span>(<span class="pl-args"><span class="pl-atom">'False'</span>, <span class="pl-string">"Less than zero"</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_x</span></span>]</span>, <span class="pl-atom">true</span></span>)</span>, 
               <span class="pl-compound pl-level-0"><span class="pl-functor">caseOption</span>(<span class="pl-args"><span class="pl-atom">'True'</span>, <span class="pl-string">"Equal to zero"</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_x</span></span>]</span>, <span class="pl-atom">true</span></span>)</span>] , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">select_case</span>(<span class="pl-args"><span class="pl-var">CASE_SWITCH_11</span>, <span class="pl-var">D</span>, <span class="pl-var">CASE_RESULT_P1_CODE_RESULT_216_1</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_48965282{$P1_CODE_215}</span>, <span class="pl-avar">_48965360{$P1_CODE_216}</span>, <span class="pl-avar">_48965160{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; pow is a function that calculates a to the power of b where a and b are numbers
%  ; (: pow (-> Number Number Number))
/*
  (= (pow $a $b)  
    (case 
      (classify_integer_position $b) 
      ( ("Equal to zero" 1) 
        ("Less than zero" (// 1 (pow $a (abs $b)))) 
        ($_ (* $a (pow $a (- $b 1)))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">pow</span>, <span class="pl-var">_a5</span>, <span class="pl-var">_b5</span>, <span class="pl-var">CASE_RESULT_RetVal603_1</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_49314566{vn = ..., cns = ...}</span>, <span class="pl-avar">_49314670{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_49314594{vn = ..., cns = ...}</span>, <span class="pl-avar">_49314712{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_49314712{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">classify_integer_position</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _49314778{$CASE_SWITCH_15} =  
          
       [ <span class="pl-compound pl-level-0"><span class="pl-functor">caseOption</span>(<span class="pl-args"><span class="pl-string">"Equal to zero"</span>, <span class="pl-int">1</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_b</span></span>]</span>, <span class="pl-atom">true</span></span>)</span>, 
         <span class="pl-atom">caseOption</span>( <span class="pl-string">"Less than zero"</span>, 
           <span class="pl-var">C</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_b</span></span>]</span>, 
           ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_a</span></span>  ,
             <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_b</span></span> , 
             <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">abs</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span></span>)</span> , 
             <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">pow</span>, <span class="pl-var">D</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
             <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-int">1</span>, <span class="pl-var">G</span>, <span class="pl-var">C</span></span>)</span>)), 
         <span class="pl-atom">caseOption</span>( <span class="pl-anon">_</span>, 
           <span class="pl-var">H</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_b</span></span>]</span>, 
           ( <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_a</span></span>  ,
             <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_a</span></span> , 
             <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_b</span></span> , 
             <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">K</span>, <span class="pl-int">1</span>, <span class="pl-var">L</span></span>)</span> , 
             <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">pow</span>, <span class="pl-var">J</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span></span>)</span> , 
             <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">I</span>, <span class="pl-var">M</span>, <span class="pl-var">H</span></span>)</span>))] , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">select_case</span>(<span class="pl-args"><span class="pl-avar">_49314778{$CASE_SWITCH_15}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_49314622{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; universe count
/*
  (= (universe-count $pattern $db)  
    (pow-math 
      (db_size $db) 
      (n_conjuncts $pattern)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'universe-count'</span>, <span class="pl-var">_pattern49</span>, <span class="pl-var">_db33</span>, <span class="pl-var">RetVal607</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_49612540{vn = ..., cns = ...}</span>, <span class="pl-avar">_49612644{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_49612568{vn = ..., cns = ...}</span>, <span class="pl-avar">_49612686{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_49612686{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_49612644{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">n_conjuncts</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'pow-math'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_49612596{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;Check if atom is member of list or not
/*
  (= (is-member $y $list)  
    (== 
      (intersection-atom 
        ($y) $list) 
      ($y)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-member'</span>, <span class="pl-var">_y5</span>, <span class="pl-var">_list41</span>, <span class="pl-var">RetVal611</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_49749098{vn = ..., cns = ...}</span>, <span class="pl-avar">_49749202{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_49749126{vn = ..., cns = ...}</span>, <span class="pl-avar">_49749244{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">intersection</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_y</span></span>]</span>, 
       <span class="pl-var">_list</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_for1</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_49749202{vn = ..., cns = ...}</span></span>]</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_49749154{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;check if atom is variable or not
%  ; THIS IMPLEMENTATION CONSIDERS THE VARIABLE NAMES
%   ; THIS WILL REMOVE REDUNDANT CLAUSES ALONG WITH THE ABSTRACTS
/*
  (= (is_more_abstract ($link1 $x1 $y1) ($link2 $x2 $y2))  
    (if 
      (== $link1 $link2) 
      (if 
        (and 
          (or 
            (== $x1 $x2) 
            (and 
              (== 
                (get-metatype $x1) Variable) 
              (== 
                (get-metatype $x2) Symbol))) 
          (or 
            (== $y1 $y2) 
            (and 
              (== 
                (get-metatype $y1) Variable) 
              (== 
                (get-metatype $y2) Symbol)))) True False) False))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">is_more_abstract</span>, <span class="pl-var">_link1__x1__y11</span>, <span class="pl-var">_link2__x2__y21</span>, <span class="pl-var">RetVal615</span></span>)</span> :- 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_link1__x1__y11</span>, [
       <span class="pl-var">_link1</span>, <span class="pl-avar">_49943878{$_x1}</span>, <span class="pl-avar">_49943898{$_y1}</span>]) , 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_link2__x2__y21</span>, [
       <span class="pl-var">_link2</span>, <span class="pl-avar">_49943950{$_x2}</span>, <span class="pl-avar">_49943970{$_y2}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_49943858{$_link1}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_49943930{$_link2}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _49944036{$P1_CODE_223} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_223</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">and</span>, 
             [ <span class="pl-atom">or</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_x1</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
               [ <span class="pl-atom">and</span>, 
                 [ <span class="pl-atom">==</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_x1</span></span>]</span>, 
                   <span class="pl-atom">'Variable'</span>], 
                 [ <span class="pl-atom">==</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_x2</span></span>]</span>, 
                   <span class="pl-atom">'Symbol'</span>]]], 
             [ <span class="pl-atom">or</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_y1</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
               [ <span class="pl-atom">and</span>, 
                 [ <span class="pl-atom">==</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_y1</span></span>]</span>, 
                   <span class="pl-atom">'Variable'</span>], 
                 [ <span class="pl-atom">==</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_y2</span></span>]</span>, 
                   <span class="pl-atom">'Symbol'</span>]]]], <span class="pl-atom">'True'</span>, <span class="pl-atom">'False'</span>], 
         ( <span class="pl-atom">call_for_unit</span>(   ((&#13;&#10; 
                                                          (<span class="pl-compound pl-level-0"><span class="pl-var">_x1</span><span class="pl-infix">==</span><span class="pl-var">_x2</span></span>);
                                                          (<span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">'get-metatype'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">==</span> <span class="pl-atom">'Variable'</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">'get-metatype'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">==</span> <span class="pl-atom">'Symbol'</span></span></span>)  )), 
             <span class="pl-var">D</span>)  ,
           <span class="pl-atom">call_for_unit</span>(   ((&#13;&#10; 
                                                          (<span class="pl-compound pl-level-0"><span class="pl-var">_y1</span><span class="pl-infix">==</span><span class="pl-var">_y2</span></span>);
                                                          (<span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">'get-metatype'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">==</span> <span class="pl-atom">'Variable'</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">'get-metatype'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">==</span> <span class="pl-atom">'Symbol'</span></span></span>)  )), 
             <span class="pl-var">D</span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">D</span>, <span class="pl-atom">'True'</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_RESULT_223</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_49944036{$P1_CODE_223}</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_49943806{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Recursive function to check if the given clause is more abstract than any clause in the rest
/*
  (= (is_more_abstract_in_list $clause $clauses)  
    (if 
      (== $clauses ()) False 
      (if 
        (and 
          (not (== $clause (car-atom $clauses))) 
          (is_more_abstract $clause 
            (car-atom $clauses))) True 
        (is_more_abstract_in_list $clause 
          (cdr-atom $clauses)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">is_more_abstract_in_list</span>, <span class="pl-var">_clause1</span>, <span class="pl-var">_clauses1</span>, <span class="pl-var">RetVal619</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_50512092{vn = ..., cns = ...}</span>, <span class="pl-avar">_50512196{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_50512120{vn = ..., cns = ...}</span>, <span class="pl-avar">_50512238{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_50512238{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _50512312{$P1_CODE_227} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd227</span>, <span class="pl-var">P1_CODE_RESULT_227</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">and</span>, 
             [ <span class="pl-atom">not</span>, 
               [ <span class="pl-atom">==</span>, 
                 <span class="pl-var">_clause</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>]], 
             [ <span class="pl-atom">is_more_abstract</span>, 
               <span class="pl-var">_clause</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>]], 
           <span class="pl-atom">'True'</span>, 
           [ <span class="pl-atom">is_more_abstract_in_list</span>, 
             <span class="pl-var">_clause</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>]], 
         ( ( <span class="pl-atom">\+</span> ( 
              eval_true( ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_clause</span></span>  ,
                           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_clauses</span></span> , 
                           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
                           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">C</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span></span>)</span>))) )  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_clause</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_clauses</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">is_more_abstract</span>, <span class="pl-var">G</span>, <span class="pl-var">I</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-var">P1_CODE_228</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd227</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_228</span>, 
                [ <span class="pl-atom">is_more_abstract_in_list</span>, 
                  <span class="pl-var">_clause</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_clause</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_clauses</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">is_more_abstract_in_list</span>, <span class="pl-var">J</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_228</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">F</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_228</span>, <span class="pl-var">P1_CODE_RESULT_227</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_50512312{$P1_CODE_227}</span>, <span class="pl-avar">_50512148{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Function to remove abstract clauses from a list of patterns
/*
  (= (remove_abstract_clauses $clauses $original_clauses)  
    (if 
      (== $clauses ()) () 
      (let* 
        ( (superpose-atom (car-atom $clauses)) ($is_abstract (is_more_abstract_in_list superpose-atom $original_clauses))) 
        (if $is_abstract 
          (remove_abstract_clauses 
            (cdr-atom $clauses) $original_clauses) 
          (superpose-atom (remove_abstract_clauses (cdr-atom $clauses) $original_clauses))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">remove_abstract_clauses</span>, <span class="pl-var">_clauses5</span>, <span class="pl-var">_original_clauses1</span>, <span class="pl-var">RetVal623</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_51135354{vn = ..., cns = ...}</span>, <span class="pl-avar">_51135458{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_51135382{vn = ..., cns = ...}</span>, <span class="pl-avar">_51135500{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_51135458{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _51135580{$P1_CODE_235} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd235</span>, <span class="pl-var">P1_CODE_RESULT_235</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-atom">'superpose-atom'</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>], 
             [ <span class="pl-var">_is_abstract</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">is_more_abstract_in_list</span>, <span class="pl-atom">'superpose-atom'</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-var">_is_abstract</span>, 
             [ <span class="pl-atom">remove_abstract_clauses</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>, 
               <span class="pl-var">_original_clauses</span>], 
             [ <span class="pl-atom">'superpose-atom'</span>, 
               [ <span class="pl-atom">remove_abstract_clauses</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>, 
                 <span class="pl-var">_original_clauses</span>]]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_clauses</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-atom">'superpose-atom'</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span> <span class="pl-infix">=</span> <span class="pl-atom">'superpose-atom'</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_original_clauses</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">is_more_abstract_in_list</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">_is_abstract</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_is_abstract</span></span> , 
           <span class="pl-var">P1_CODE_236</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd235</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_236</span>, 
                [ <span class="pl-atom">remove_abstract_clauses</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>, 
                  <span class="pl-var">_original_clauses</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_clauses</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_original_clauses</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">remove_abstract_clauses</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">P1_CODE_RESULT_236</span></span>)</span>)) , 
           <span class="pl-atom">member</span>( <span class="pl-var">K</span>, [
             <span class="pl-atom">remove_abstract_clauses</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>, 
             <span class="pl-var">_original_clauses</span>]) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_236</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_235</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_51135580{$P1_CODE_235}</span>, <span class="pl-avar">_51135410{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Initial function to call to remove abstract clauses
/*
  (= (remove_abstract_clauses_initial $clauses)  
    (remove_abstract_clauses $clauses $clauses))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">remove_abstract_clauses_initial</span>, <span class="pl-var">_clauses9</span>, <span class="pl-var">RetVal627</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_51721484{vn = ..., cns = ...}</span>, <span class="pl-avar">_51721560{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_51721560{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_51721560{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">remove_abstract_clauses</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_51721512{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: get_variables
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Extracts all variables from a pattern expression by recursively traversing
%  ;;   the structure and collecting elements with Variable metatype.
%  ;;
%  ;; Input:
%  ;;   - `$pattern`: The expression to analyze (e.g., `(P $x $y (Q $z))`)
%  ;;
%  ;; Output:
%  ;;   - A flat list of all variables found (e.g., `($x $y $z)`)
%  ;;   - Empty list if no variables found or input is empty
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns empty list for empty input
%  ;;   2. Recursive Processing:
%  ;;      a. Checks if first element is a Variable via get-metatype
%  ;;      b. If Variable: adds to results and processes remainder
%  ;;      c. Otherwise: just processes remainder
/*
  (= (get_variables $exp)  
    (if 
      (and 
        (== 
          (get-metatype $exp) Expression) 
        (not (== $exp ()))) 
      (let* 
        ( ( ($h $t) (decons-atom $exp)) 
          ($x (if (== (get-metatype $h) Variable) ($h) (if (== (get-metatype $h) Expression) (get_variables $h) ()))) 
          ($y (get_variables $t))) 
        (union-atom $x $y)) 
      (if 
        (== 
          (get-metatype $exp) Variable) 
        ($exp) ())))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">get_variables</span>, <span class="pl-var">_exp1</span>, <span class="pl-var">RetVal631</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_51958814{vn = ..., cns = ...}</span>, <span class="pl-avar">_51958890{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_51958890{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-prefix">\+</span><span class="pl-compound"><span class="pl-functor">eval_true</span>(<span class="pl-args">(<span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span>)</span>)</span></span> , 
     _51959020{$P1_CODE_243} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_243</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [     _h     ,    _t     ],
               [ decons-atom,   _exp    ]], 
             [ <span class="pl-var">_x</span>, 
               [ <span class="pl-atom">if</span>, 
                 [ <span class="pl-atom">==</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_h</span></span>]</span>, 
                   <span class="pl-atom">'Variable'</span>], 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_h</span></span>]</span>, 
                 [ <span class="pl-atom">if</span>, 
                   [ <span class="pl-atom">==</span>, 
                     <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_h</span></span>]</span>, 
                     <span class="pl-atom">'Expression'</span>], 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">get_variables</span>, <span class="pl-var">_h</span></span>]</span>, 
                   []]]], 
             [ <span class="pl-var">_y</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">get_variables</span>, <span class="pl-var">_t</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">_x</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_exp</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">F</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_h</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_h</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">H</span>, <span class="pl-atom">'Variable'</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-var">P1_CODE_244</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, 
                <span class="pl-var">RetTypeNotCd244</span>, 
                <span class="pl-var">P1_CODE_RESULT_244</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_h</span></span>]</span>, 
                <span class="pl-atom">eval_for1</span>( 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-compound"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-ellipsis">...</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span></span>)</span>, 
                   <span class="pl-var">RetTypeNotCd244</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_h</span></span>]</span>, 
                   <span class="pl-var">P1_CODE_RESULT_244</span>)) , 
           <span class="pl-var">P1_CODE_245</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd245</span>, <span class="pl-var">P1_CODE_RESULT_245</span>, 
                [ <span class="pl-atom">if</span>, 
                  [ <span class="pl-atom">==</span>, 
                    <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_h</span></span>]</span>, 
                    <span class="pl-atom">'Expression'</span>], 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">get_variables</span>, <span class="pl-var">_h</span></span>]</span>, 
                  []], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_h</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">K</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">L</span></span>)</span> , 
                  <span class="pl-var">P1_CODE_246</span> =  
                       
                    <span class="pl-atom">as_p1</span>( 
                       <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-compound"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-ellipsis">...</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span></span>)</span>, 
                       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd245</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_246</span>, 
                       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">get_variables</span>, <span class="pl-var">_h</span></span>]</span>, 
                       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_h</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">get_variables</span>, <span class="pl-var">M</span>, <span class="pl-var">P1_CODE_RESULT_246</span></span>)</span></span>) , 
                  <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_246</span>, [], <span class="pl-var">P1_CODE_RESULT_245</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_244</span>, <span class="pl-var">P1_CODE_245</span>, <span class="pl-var">_x</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_t</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">get_variables</span>, <span class="pl-var">N</span>, <span class="pl-var">_y</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_y</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">P1_CODE_RESULT_243</span></span>)</span>)) , 
     _51959910{$P1_CODE_247} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd247</span>, <span class="pl-var">P1_CODE_RESULT_247</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">==</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_exp</span></span>]</span>, 
             <span class="pl-atom">'Variable'</span>], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_exp</span></span>]</span>, 
           []], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_exp</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">Q</span>, <span class="pl-var">R</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">R</span>, <span class="pl-atom">'Variable'</span>, <span class="pl-var">S</span></span>)</span> , 
           <span class="pl-var">P1_CODE_248</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd247</span></span>]</span>, 
                <span class="pl-var">RetTypeNotCd248</span>, 
                <span class="pl-var">P1_CODE_RESULT_248</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_exp</span></span>]</span>, 
                <span class="pl-atom">eval_for1</span>( 
                   <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd247</span></span>]</span>, 
                     <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>), 
                   <span class="pl-var">RetTypeNotCd248</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_exp</span></span>]</span>, 
                   <span class="pl-var">P1_CODE_RESULT_248</span>)) , 
           <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">S</span>, <span class="pl-var">P1_CODE_248</span>, [], <span class="pl-var">P1_CODE_RESULT_247</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_51959020{$P1_CODE_243}</span>, <span class="pl-avar">_51959910{$P1_CODE_247}</span>, <span class="pl-avar">_51958842{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Helper function to check if a variable is in a nested list
/*
  (= (is_variable_in_list $variable $list)  
    (if 
      (== $list ()) False 
      (if 
        (== $variable 
          (car-atom $list)) True 
        (is_variable_in_list $variable 
          (cdr-atom $list)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">is_variable_in_list</span>, <span class="pl-var">_variable1</span>, <span class="pl-var">_list45</span>, <span class="pl-var">RetVal635</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_53148280{vn = ..., cns = ...}</span>, <span class="pl-avar">_53148384{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_53148308{vn = ..., cns = ...}</span>, <span class="pl-avar">_53148426{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_53148426{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _53148500{$P1_CODE_267} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd267</span>, <span class="pl-var">P1_CODE_RESULT_267</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">==</span>, 
             <span class="pl-var">_variable</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_list</span></span>]</span>], 
           <span class="pl-atom">'True'</span>, 
           [ <span class="pl-atom">is_variable_in_list</span>, 
             <span class="pl-var">_variable</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_list</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_variable</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_list</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">C</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-var">P1_CODE_268</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd267</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_268</span>, 
                [ <span class="pl-atom">is_variable_in_list</span>, 
                  <span class="pl-var">_variable</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_list</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_variable</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_list</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">is_variable_in_list</span>, <span class="pl-var">G</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_268</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">F</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_268</span>, <span class="pl-var">P1_CODE_RESULT_267</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_53148500{$P1_CODE_267}</span>, <span class="pl-avar">_53148336{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Function: is_variable_joint_with_clauses
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Determines if a variable appears in any clause from a list of clauses.
%  ;;   Essentially checks if a variable is "connected" to any clause in the set.
%  ;;
%  ;; Inputs:
%  ;;   - `$variable`: The target variable to find (e.g., `$x`)
%  ;;   - `$clauses`: List of clauses to search through (e.g., `((P $x) (Q $y) (R $x $z))`)
%  ;;
%  ;; Output:
%  ;;   - True if the variable appears in any clause
%  ;;   - False if the variable isn't found or clauses list is empty
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns False for empty clauses list
%  ;;   2. Recursive Case:
%  ;;      a. Extracts variables from first clause using `get_variables`
%  ;;      b. Checks if target variable exists in these variables (`is_variable_in_list`)
%  ;;      c. Returns True if found, otherwise processes remaining clauses
%  ;;
/*
  (= (is_variable_joint_with_clauses $variable $clauses)  
    (if 
      (== $clauses ()) False 
      (let* 
        ( ($clause_vars (let $temp (car-atom $clauses) (get_variables $temp)))) 
        (if 
          (is_variable_in_list $variable $clause_vars) True 
          (is_variable_joint_with_clauses $variable 
            (cdr-atom $clauses))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">is_variable_joint_with_clauses</span>, <span class="pl-var">_variable5</span>, <span class="pl-var">_clauses13</span>, <span class="pl-var">RetVal639</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_53661880{vn = ..., cns = ...}</span>, <span class="pl-avar">_53661984{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_53661908{vn = ..., cns = ...}</span>, <span class="pl-avar">_53662026{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_53662026{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _53662100{$P1_CODE_275} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd275</span>, <span class="pl-var">P1_CODE_RESULT_275</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_clause_vars</span>, 
               [ <span class="pl-atom">let</span>, 
                 <span class="pl-var">_temp</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">get_variables</span>, <span class="pl-var">_temp</span></span>]</span>]]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">is_variable_in_list</span>, <span class="pl-var">_variable</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-atom">'True'</span>, 
             [ <span class="pl-atom">is_variable_joint_with_clauses</span>, 
               <span class="pl-var">_variable</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_clauses</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_temp</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_temp</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">get_variables</span>, <span class="pl-var">D</span>, <span class="pl-var">_clause_vars</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_variable</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_clause_vars</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">is_variable_in_list</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-var">P1_CODE_276</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd275</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_276</span>, 
                [ <span class="pl-atom">is_variable_joint_with_clauses</span>, 
                  <span class="pl-var">_variable</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_clauses</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_variable</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_clauses</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">is_variable_joint_with_clauses</span>, <span class="pl-var">H</span>, <span class="pl-var">J</span>, <span class="pl-var">P1_CODE_RESULT_276</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_276</span>, <span class="pl-var">P1_CODE_RESULT_275</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_53662100{$P1_CODE_275}</span>, <span class="pl-avar">_53661936{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: are_all_variables_joint
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Verifies if ALL variables in a clause are connected to at least one other clause
%  ;;   in a given clauses list (jointness check for variable elimination).
%  ;;
%  ;; Inputs:
%  ;;   - ($v $vs): The variables to check (as a list, e.g., `(?x ?y ?z)`)
%  ;;   - $clauses: The list of clauses to check against (e.g., `((P ?x ?y) (Q ?y ?z))`)
%  ;;
%  ;; Output:
%  ;;   - True if every variable appears in at least one other clause
%  ;;   - False if any variable isn't found in other clauses
%  ;;   - True for empty variables list (vacuous truth)
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Empty variables list returns True
%  ;;   2. Recursive Case:
%  ;;      a. Checks if first variable ($v) is joint using is_variable_joint_with_clauses
%  ;;      b. If True: processes remaining variables ($vs)
%  ;;      c. If False: immediately returns False (short-circuit)
%  ;;
/*
  (= (are_all_variables_joint () $_)  True)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">are_all_variables_joint</span>, <span class="pl-var">Nil49</span>, <span class="pl-var">_clauses17</span>, <span class="pl-atom">'True'</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_54197076{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_54197104{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span></span>) ).


/*
  (= (are_all_variables_joint $variables $clauses)  
    (let 
      ($h $t) 
      (decons-atom $variables) 
      (and 
        (not (== () (find_common $h $clauses))) 
        (are_all_variables_joint $t $clauses))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">are_all_variables_joint</span>, <span class="pl-var">_variables1</span>, <span class="pl-var">_clauses21</span>, <span class="pl-var">RetVal647</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_54320636{vn = ..., cns = ...}</span>, <span class="pl-avar">_54320740{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_54320664{vn = ..., cns = ...}</span>, <span class="pl-avar">_54320782{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_54320740{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_54320854{$_h}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     ( <span class="pl-atom">\+</span> ( 
        eval_true( ( <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span>  ,
                     <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_h</span></span> , 
                     <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_clauses</span></span> , 
                     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">find_common</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
                     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, [], <span class="pl-var">E</span>, <span class="pl-var">RetVal647</span></span>)</span>))) ) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_54320874{$_t}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_54320782{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">are_all_variables_joint</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_54320692{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Function: find_common
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Identifies if a specific element exists in any clause from a list of clauses.
%  ;;   Returns the element if found, otherwise returns an empty list.
%  ;;
%  ;; Inputs:
%  ;;   - `$el`: The target element to find (e.g., `$x`)
%  ;;   - `$list`: List of clauses to search through (e.g., `((P $x) (Q $y) (R $z))`)
%  ;;
%  ;; Output:
%  ;;   - The element `$el` if it appears in any clause
%  ;;   - An empty list if `$el` isn't found in any clause
%  ;;
%  ;; How it works:
%  ;;   1. Collapses the list of clauses into a single flat list of elements
%  ;;   2. Uses helper function `_find_common` to check for presence of `$el`
%  ;;   3. Returns `$el` if found, otherwise returns empty list
/*
  (= (find_common $el $MeTTa_SP__list_1)  
    (collapse (_find_common $el (superpose $MeTTa_SP__list_1))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">find_common</span>, <span class="pl-var">_el1</span>, <span class="pl-var">_list49</span>, <span class="pl-var">RetVal651</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_54567780{vn = ..., cns = ...}</span>, <span class="pl-avar">_54567884{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_54567808{vn = ..., cns = ...}</span>, <span class="pl-avar">_54567926{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       ( <span class="pl-compound pl-level-0"><span class="pl-var">B</span><span class="pl-infix">=</span><span class="pl-var">_el</span></span>  ,
         <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__list_1</span>, <span class="pl-var">C</span></span>)</span> , 
         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'_find_common'</span>, <span class="pl-var">B</span>, <span class="pl-var">C</span>, <span class="pl-var">A</span></span>)</span>), 
       _54567836{vn = ..., cns = ...})</span>) ).


/*
  (= (_find_common $el $clause)  
    (if 
      (== () 
        (intersection-atom 
          ($el) $clause)) 
      (empty) $el))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'_find_common'</span>, <span class="pl-var">_el5</span>, <span class="pl-var">_clause5</span>, <span class="pl-var">RetVal655</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_54736454{vn = ..., cns = ...}</span>, <span class="pl-avar">_54736558{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_54736482{vn = ..., cns = ...}</span>, <span class="pl-avar">_54736600{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-atom">intersection</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_el</span></span>]</span>, 
       <span class="pl-var">_clause</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _54736682{$P1_CODE_283} =  
          
       <span class="pl-compound pl-level-0"><span class="pl-functor">as_p1</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-anon">_</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">empty</span></span>]</span>, <span class="pl-atom">fail</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_54736558{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_54736682{$P1_CODE_283}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_54736510{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: has_only_joint_variables
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Determines if all variables in a clause appear in at least one other clause
%  ;;   from a given list of clauses (jointness check for knowledge base consistency).
%  ;;
%  ;; Inputs:
%  ;;   - `$clause`: The clause to check (e.g., `(P $x $y)`)
%  ;;   - `$clauses`: List of other clauses to check against (e.g., `((Q $x $z) (R $y))`)
%  ;;
%  ;; Output:
%  ;;   - True if every variable in $clause appears in at least one other clause
%  ;;   - False if any variable in $clause is not found in other clauses
%  ;;   - True for clauses with no variables (vacuous truth)
%  ;;
%  ;; How it works:
%  ;;   1. Extracts all variables from $clause using get_variables
%  ;;   2. Verifies jointness using are_all_variables_joint
%  ;;
/*
  (= (has_only_joint_variables $clause $clauses)  
    (let* 
      ( ($clause_vars (get_variables $clause))) 
      (are_all_variables_joint $clause_vars $clauses)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">has_only_joint_variables</span>, <span class="pl-var">_clause9</span>, <span class="pl-var">_clauses25</span>, <span class="pl-var">RetVal659</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_54960288{vn = ..., cns = ...}</span>, <span class="pl-avar">_54960392{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_54960316{vn = ..., cns = ...}</span>, <span class="pl-avar">_54960434{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_54960392{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">get_variables</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_54960488{$_clause_vars}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_54960488{$_clause_vars}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_54960434{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">are_all_variables_joint</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_54960344{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Test: Check if all variables in the first clause are joint with others
%   ; ! (has_only_joint_variables (Inheritance $X $Z $Y)
%   ;     ( (Inheritance $X pet)
%   ;         (Inheritance cat $Y)
%   ;         (Inheritance $Z $X)))
%  ;########################
%   ; General function to remove redundant patterns if they are in
%   ; list format
%   ;########################
/*
  (= (remove_redundant_clauses ())  )
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">remove_redundant_clauses</span>, <span class="pl-var">Nil53</span>, []</span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_55134756{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span></span>) ).


/*
  (= (remove_redundant_clauses ($clause $rest))  
    (setInsert $clause 
      (remove_redundant_clauses $rest)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">remove_redundant_clauses</span>, <span class="pl-var">_clause__rest1</span>, <span class="pl-var">RetVal667</span></span>)</span> :- 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_clause__rest1</span>, [
       <span class="pl-var">_clause</span>, 
       _55235982{$_rest}]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_55235962{$_clause}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_55235982{$_rest}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">mi</span>(<span class="pl-args"><span class="pl-atom">remove_redundant_clauses</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">setInsert</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_55235910{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (setInsert $item ())  
    ($item ()))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">setInsert</span>, <span class="pl-var">_item1</span>, <span class="pl-var">Nil57</span>, <span class="pl-var">RetVal671</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span>, <span class="pl-avar">_55404564{vn = ..., cns = ...}</span>, <span class="pl-avar">_55404668{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_55404592{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-atom">eval_for1</span>( <span class="pl-atom">'%Undefined%'</span>, 
       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'List'</span>, <span class="pl-anon">_</span></span>]</span>, 
       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_55404668{vn = ..., cns = ...}</span>, []</span>]</span>, 
       _55404620{vn = ..., cns = ...})</span>) ).


/*
  (= (setInsert $item (superpose-atom $tail))  
    (if 
      (== $item superpose-atom) 
      (superpose-atom $tail) 
      (superpose-atom (setInsert $item $tail))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">setInsert</span>, <span class="pl-var">_item5</span>, <span class="pl-var">_head__tail1</span>, <span class="pl-var">RetVal675</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span>, <span class="pl-avar">_55571530{vn = ..., cns = ...}</span>, <span class="pl-avar">_55571634{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_head__tail1</span>, [
       <span class="pl-atom">'superpose-atom'</span>, 
       _55571686{$_tail}]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_55571634{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-atom">'superpose-atom'</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _55571752{$P1_CODE_287} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         [ <span class="pl-atom">-&gt;</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'List'</span>, <span class="pl-var">Type_SetInsert__1___14</span></span>]</span>], <span class="pl-var">RetTypeNotCd287</span>, <span class="pl-var">P1_CODE_RESULT_287</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'superpose-atom'</span>, <span class="pl-var">_tail</span></span>]</span>, 
         <span class="pl-atom">eval_for1</span>( 
            <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
            <span class="pl-var">RetTypeNotCd287</span>, 
            <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'superpose-atom'</span>, <span class="pl-var">_tail</span></span>]</span>, 
            <span class="pl-var">P1_CODE_RESULT_287</span>)) , 
     <span class="pl-atom">member</span>( <span class="pl-var">D</span>, [
       <span class="pl-atom">setInsert</span>, <span class="pl-avar">_55571634{vn = ..., cns = ...}</span>, <span class="pl-avar">_55571686{$_tail}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_55571752{$P1_CODE_287}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_55571586{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;;;;;;;;;;; converters ;;;;;;;;; 
%  ;;;;;;;;;;; converters ;;;;;;;;; 
%  ;; Converts a list to a tuple
/*
  (= (list_to_tuple Nil)  )
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">list_to_tuple</span>, <span class="pl-var">Nil61</span>, []</span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_55883128{vn = ..., cns = ...}</span>, <span class="pl-atom">'Nil'</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span></span>) ).


/*
  (= (list_to_tuple (Cons $head $tail))  
    (let $temp 
      (list_to_tuple $tail) 
      (cons-atom $head $temp)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">list_to_tuple</span>, <span class="pl-var">Cons__head__tail1</span>, <span class="pl-var">RetVal683</span></span>)</span> :- 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">Cons__head__tail1</span>, [
       <span class="pl-atom">'Cons'</span>, <span class="pl-avar">_55982318{$_head}</span>, <span class="pl-avar">_55982338{$_tail}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_55982338{$_tail}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">list_to_tuple</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_55982378{$_temp}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_55982318{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_55982378{$_temp}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_55982260{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: tuple_to_list
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Converts a flat list into a nested Cons-cell structure, transforming
%  ;;   `(a b c)` into `(Cons a (Cons b (Cons c Nil)))`.
%  ;;
%  ;; Input:
%  ;;   - $list: A flat list of elements (e.g., `(a b c)`)
%  ;;
%  ;; Output:
%  ;;   - A nested Cons structure (e.g., `(Cons a (Cons b (Cons c Nil)))`)
%  ;;   - Nil for empty input
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Empty input returns Nil
%  ;;   2. Recursive Case:
%  ;;      a. Splits list into head and tail
%  ;;      b. Builds Cons cell with head and recursive tail processing
%  ;;
/*
  (= (tuple_to_list ())  Nil)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">tuple_to_list</span>, <span class="pl-var">Nil65</span>, <span class="pl-atom">'Nil'</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_56133814{vn = ..., cns = ...}</span>, []</span>)</span></span>) ).


/*
  (= (tuple_to_list $list)  
    (let 
      ($head $tail) 
      (decons-atom $list) 
      (if 
        (== $head ,) 
        (tuple_to_list $tail) 
        (Cons $head 
          (tuple_to_list $tail)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">tuple_to_list</span>, <span class="pl-var">_list53</span>, <span class="pl-var">RetVal691</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_56250852{vn = ..., cns = ...}</span>, <span class="pl-avar">_56250928{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_56250928{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_56251000{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_56251000{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     _56251080{$P1_CODE_291} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_291</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">tuple_to_list</span>, <span class="pl-var">_tail</span></span>]</span>, 
         <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">tuple_to_list</span>, <span class="pl-var">E</span>, <span class="pl-var">P1_CODE_RESULT_291</span></span>)</span></span>) , 
     _56251166{$P1_CODE_292} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_292</span>, 
         [ <span class="pl-atom">'Cons'</span>, 
           <span class="pl-var">_head</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">tuple_to_list</span>, <span class="pl-var">_tail</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">tuple_to_list</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'Cons'</span>, <span class="pl-var">F</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_292</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_56251080{$P1_CODE_291}</span>, <span class="pl-avar">_56251166{$P1_CODE_292}</span>, <span class="pl-avar">_56250880{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: is_subclause_helper
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Recursively checks if a given clause (`$head`) appears anywhere in a pattern,
%  ;;   including nested expressions. Returns all matches found.
%  ;;
%  ;; Inputs:
%  ;;   - `$head`: The clause to search for (typically an expression)
%  ;;   - `$pattern`: The pattern structure to search through
%  ;;
%  ;; Output:
%  ;;   - List of True values for each exact match found
%  ;;   - Empty list if no matches found or pattern is empty
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns empty list for empty pattern
%  ;;   2. Recursive Processing:
%  ;;      a. Checks if current element is an Expression
%  ;;      b. For exact matches: returns (True)
%  ;;      c. For nested expressions: recursively searches both head and tail
%  ;;      d. For atoms: just processes the tail
/*
  (= (is_subclause $el $expr)  
    (let $res 
      (collapse (_is_subclause $el $expr)) 
      (not (== (intersection-atom (True) $res) ()))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">is_subclause</span>, <span class="pl-var">_el9</span>, <span class="pl-var">_expr9</span>, <span class="pl-var">RetVal695</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_56621522{vn = ..., cns = ...}</span>, <span class="pl-avar">_56621626{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_56621550{vn = ..., cns = ...}</span>, <span class="pl-avar">_56621668{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">B</span><span class="pl-infix">=</span><span class="pl-var">_el</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span></span>, 
       _56621744{$_res}) , 
     ( <span class="pl-atom">\+</span> ( 
        eval_true( ( <span class="pl-compound pl-level-0"><span class="pl-functor">intersection</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'True'</span></span>]</span>, <span class="pl-var">_res</span>, <span class="pl-var">D</span></span>)</span>  ,
                     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
                     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">D</span>, [], <span class="pl-var">RetVal695</span></span>)</span>))) )</span>) ).


/*
  (= (_is_subclause $el $MeTTa_SP__expr_1)  
    (if 
      (== $el $MeTTa_SP__expr_1) True 
      (if 
        (not (== (get-metatype $MeTTa_SP__expr_1) Expression)) False 
        (_is_subclause $el 
          (superpose $MeTTa_SP__expr_1)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'_is_subclause'</span>, <span class="pl-var">_el13</span>, <span class="pl-var">_expr13</span>, <span class="pl-var">RetVal699</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_56866596{vn = ..., cns = ...}</span>, <span class="pl-avar">_56866700{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_56866624{vn = ..., cns = ...}</span>, <span class="pl-avar">_56866742{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_56866700{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_56866742{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _56866822{$P1_CODE_299} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd299</span>, <span class="pl-var">P1_CODE_RESULT_299</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">not</span>, 
             [ <span class="pl-atom">==</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">MeTTa_SP__expr_1</span></span>]</span>, 
               <span class="pl-atom">'Expression'</span>]], 
           <span class="pl-atom">'False'</span>, 
           [ <span class="pl-atom">'_is_subclause'</span>, 
             <span class="pl-var">_el</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__expr_1</span></span>]</span>]], 
         ( ( <span class="pl-atom">\+</span> ( 
              eval_true( ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">MeTTa_SP__expr_1</span></span>  ,
                           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
                           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">E</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">F</span></span>)</span>))) )  ,
           <span class="pl-var">P1_CODE_300</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd299</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_300</span>, 
                [ <span class="pl-atom">'_is_subclause'</span>, 
                  <span class="pl-var">_el</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__expr_1</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_el</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__expr_1</span>, <span class="pl-var">H</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'_is_subclause'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_300</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">F</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_300</span>, <span class="pl-var">P1_CODE_RESULT_299</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-atom">'True'</span>, <span class="pl-avar">_56866822{$P1_CODE_299}</span>, <span class="pl-avar">_56866652{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: remove_current
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Removes all occurrences of a specific clause (`$current_clause`) from an expression,
%  ;;   while preserving the structure and order of other elements.
%  ;;
%  ;; Inputs:
%  ;;   - `$current_clause`: The clause to remove (exact match)
%  ;;   - `$original_expr`: The expression to filter (may contain nested structures)
%  ;;
%  ;; Output:
%  ;;   - A new expression with all instances of `$current_clause` removed
%  ;;   - Empty list if all clauses are removed or input is empty
%  ;;
%  ;; How it works:
%  ;;   1. Base Case: Returns empty list for empty input
%  ;;   2. Recursive Processing:
%  ;;      a. Splits expression into head and tail
%  ;;      b. If head matches target clause: skips and processes tail
%  ;;      c. Otherwise: keeps head and recursively processes tail
%  ;;
/*
  (= (remove_current $current_clause $original_expr)  
    (if 
      (== $original_expr ()) () 
      (let* 
        ( ($head (car-atom $original_expr)) ($tail (cdr-atom $original_expr))) 
        (if 
          (== $head $current_clause) 
          (remove_current $current_clause $tail) 
          (concatTuple 
            ($head) 
            (remove_current $current_clause $tail))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">remove_current</span>, <span class="pl-var">_current_clause1</span>, <span class="pl-var">_original_expr1</span>, <span class="pl-var">RetVal703</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_57421790{vn = ..., cns = ...}</span>, <span class="pl-avar">_57421894{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_57421818{vn = ..., cns = ...}</span>, <span class="pl-avar">_57421936{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_57421936{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _57422016{$P1_CODE_307} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd307</span>, <span class="pl-var">P1_CODE_RESULT_307</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_original_expr</span></span>]</span>], 
             [ <span class="pl-var">_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_original_expr</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">remove_current</span>, <span class="pl-var">_current_clause</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             [ <span class="pl-atom">concatTuple</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">remove_current</span>, <span class="pl-var">_current_clause</span>|<span class="pl-ellipsis">...</span></span>]</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_original_expr</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_original_expr</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_current_clause</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-var">P1_CODE_308</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd307</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_308</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">remove_current</span>, <span class="pl-var">_current_clause</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_current_clause</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">remove_current</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_308</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_309</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd307</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_309</span>, 
                [ <span class="pl-atom">concatTuple</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">remove_current</span>, <span class="pl-var">_current_clause</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">J</span></span>]</span>, <span class="pl-var">K</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_current_clause</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">remove_current</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">concatTuple</span>, <span class="pl-var">K</span>, <span class="pl-var">N</span>, <span class="pl-var">P1_CODE_RESULT_309</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_308</span>, <span class="pl-var">P1_CODE_309</span>, <span class="pl-var">P1_CODE_RESULT_307</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_57422016{$P1_CODE_307}</span>, <span class="pl-avar">_57421846{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (remove_redundant_subclauses $exp)  
    (remove_redundant_subclauses_helper $exp $exp))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">remove_redundant_subclauses</span>, <span class="pl-var">_exp5</span>, <span class="pl-var">RetVal707</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_58094506{vn = ..., cns = ...}</span>, <span class="pl-avar">_58094582{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_58094582{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_58094582{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">remove_redundant_subclauses_helper</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_58094534{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (remove_redundant_subclauses_helper $expr $original_expr)  
    (if 
      (== $expr ()) () 
      (let* 
        ( ($current_clause (car-atom $expr)) 
          ($remaining_expr (cdr-atom $expr)) 
          ($ori_exp_without_current (remove_current $current_clause $original_expr))) 
        (if 
          (is_subclause $current_clause $ori_exp_without_current) 
          (remove_redundant_subclauses_helper $remaining_expr $original_expr) 
          (concatTuple 
            ($current_clause) 
            (remove_redundant_subclauses_helper $remaining_expr $original_expr))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">remove_redundant_subclauses_helper</span>, <span class="pl-var">_expr17</span>, <span class="pl-var">_original_expr5</span>, <span class="pl-var">RetVal711</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_58268920{vn = ..., cns = ...}</span>, <span class="pl-avar">_58269024{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_58268948{vn = ..., cns = ...}</span>, <span class="pl-avar">_58269066{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_58269024{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _58269146{$P1_CODE_319} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd319</span>, <span class="pl-var">P1_CODE_RESULT_319</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_current_clause</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_expr</span></span>]</span>], 
             [ <span class="pl-var">_remaining_expr</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_expr</span></span>]</span>], 
             [ <span class="pl-var">_ori_exp_without_current</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">remove_current</span>, <span class="pl-var">_current_clause</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">is_subclause</span>, <span class="pl-var">_current_clause</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">remove_redundant_subclauses_helper</span>, <span class="pl-var">_remaining_expr</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             [ <span class="pl-atom">concatTuple</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_current_clause</span></span>]</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">remove_redundant_subclauses_helper</span>, <span class="pl-var">_remaining_expr</span>|<span class="pl-ellipsis">...</span></span>]</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_expr</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_current_clause</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_expr</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_remaining_expr</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_current_clause</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_original_expr</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">remove_current</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">_ori_exp_without_current</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_current_clause</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_ori_exp_without_current</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">is_subclause</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-var">P1_CODE_320</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd319</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_320</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">remove_redundant_subclauses_helper</span>, <span class="pl-var">_remaining_expr</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_remaining_expr</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_original_expr</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">remove_redundant_subclauses_helper</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_320</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_321</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd319</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_321</span>, 
                [ <span class="pl-atom">concatTuple</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_current_clause</span></span>]</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">remove_redundant_subclauses_helper</span>, <span class="pl-var">_remaining_expr</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_current_clause</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">L</span></span>]</span>, <span class="pl-var">M</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_remaining_expr</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_original_expr</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">remove_redundant_subclauses_helper</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">concatTuple</span>, <span class="pl-var">M</span>, <span class="pl-var">P</span>, <span class="pl-var">P1_CODE_RESULT_321</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_320</span>, <span class="pl-var">P1_CODE_321</span>, <span class="pl-var">P1_CODE_RESULT_319</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_58269146{$P1_CODE_319}</span>, <span class="pl-avar">_58268976{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; ! (is_subclause (Implies $x $y) (Implies (Human (Implies $x $y)) (Mortal $X)))
%   ; ! (remove_redundant_subclauses (, (Implies $x $W) (Implies (Human (Implies $x $y) (Mortal $X))) (Mortal $X) ))
%  ; ##############################
/*
  (= (is_pat_more_abstract $l_pat $r_pat $relative_var)  
    (if 
      (== 
        (car-atom $l_pat) ,) 
      (if 
        (== 
          (car-atom $r_pat) ,) 
        (process_input_for_check 
          (cdr-atom $l_pat) 
          (cdr-atom $r_pat) $relative_var) 
        (process_input_for_check 
          (cdr-atom $l_pat) 
          ($r_pat) $relative_var)) 
      (if 
        (== 
          (car-atom $r_pat) ,) 
        (process_input_for_check 
          ($l_pat) 
          (cdr-atom $r_pat) $relative_var) 
        (process_input_for_check 
          ($l_pat) 
          ($r_pat) $relative_var))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">is_pat_more_abstract</span>, 
     <span class="pl-var">_l_pat1</span>,  <span class="pl-var">_r_pat1</span>, <span class="pl-var">_relative_var1</span>, <span class="pl-var">RetVal715</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_59075250{vn = ..., cns = ...}</span>, <span class="pl-avar">_59075382{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_59075278{vn = ..., cns = ...}</span>, <span class="pl-avar">_59075424{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_59075306{vn = ..., cns = ...}</span>, <span class="pl-avar">_59075466{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_59075382{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _59075554{$P1_CODE_331} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd331</span>, <span class="pl-var">P1_CODE_RESULT_331</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">==</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_r_pat</span></span>]</span>, 
             <span class="pl-atom">','</span>], 
           [ <span class="pl-atom">process_input_for_check</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_l_pat</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_pat</span></span>]</span>, 
             <span class="pl-var">_relative_var</span>], 
           [ <span class="pl-atom">process_input_for_check</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_l_pat</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_r_pat</span></span>]</span>, 
             <span class="pl-var">_relative_var</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">E</span>, <span class="pl-atom">','</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-var">P1_CODE_332</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd331</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_332</span>, 
                [ <span class="pl-atom">process_input_for_check</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_l_pat</span></span>]</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_pat</span></span>]</span>, 
                  <span class="pl-var">_relative_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_l_pat</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_relative_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">process_input_for_check</span>, <span class="pl-var">H</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_332</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_333</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd331</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_333</span>, 
                [ <span class="pl-atom">process_input_for_check</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_l_pat</span></span>]</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_r_pat</span></span>]</span>, 
                  <span class="pl-var">_relative_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_l_pat</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">N</span></span>]</span>, <span class="pl-var">O</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_relative_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">process_input_for_check</span>, <span class="pl-var">M</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">P1_CODE_RESULT_333</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">F</span>, <span class="pl-var">P1_CODE_332</span>, <span class="pl-var">P1_CODE_333</span>, <span class="pl-var">P1_CODE_RESULT_331</span></span>)</span>)) , 
     _59076200{$P1_CODE_334} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd334</span>, <span class="pl-var">P1_CODE_RESULT_334</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">==</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_r_pat</span></span>]</span>, 
             <span class="pl-atom">','</span>], 
           [ <span class="pl-atom">process_input_for_check</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_l_pat</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_pat</span></span>]</span>, 
             <span class="pl-var">_relative_var</span>], 
           [ <span class="pl-atom">process_input_for_check</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_l_pat</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_r_pat</span></span>]</span>, 
             <span class="pl-var">_relative_var</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">Q</span>, <span class="pl-var">R</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">R</span>, <span class="pl-atom">','</span>, <span class="pl-var">S</span></span>)</span> , 
           <span class="pl-var">P1_CODE_335</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd334</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_335</span>, 
                [ <span class="pl-atom">process_input_for_check</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_l_pat</span></span>]</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_pat</span></span>]</span>, 
                  <span class="pl-var">_relative_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_l_pat</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">T</span></span>]</span>, <span class="pl-var">U</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">V</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">V</span>, <span class="pl-var">W</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">X</span><span class="pl-infix">=</span><span class="pl-var">_relative_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">process_input_for_check</span>, <span class="pl-var">U</span>, <span class="pl-var">W</span>, <span class="pl-var">X</span>, <span class="pl-var">P1_CODE_RESULT_335</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_336</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd334</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_336</span>, 
                [ <span class="pl-atom">process_input_for_check</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_l_pat</span></span>]</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_r_pat</span></span>]</span>, 
                  <span class="pl-var">_relative_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">Y</span><span class="pl-infix">=</span><span class="pl-var">_l_pat</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">Y</span></span>]</span>, <span class="pl-var">Z</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">A1</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">A1</span></span>]</span>, <span class="pl-var">B1</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">C1</span><span class="pl-infix">=</span><span class="pl-var">_relative_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">process_input_for_check</span>, <span class="pl-var">Z</span>, <span class="pl-var">B1</span>, <span class="pl-var">C1</span>, <span class="pl-var">P1_CODE_RESULT_336</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">S</span>, <span class="pl-var">P1_CODE_335</span>, <span class="pl-var">P1_CODE_336</span>, <span class="pl-var">P1_CODE_RESULT_334</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_59075554{$P1_CODE_331}</span>, <span class="pl-avar">_59076200{$P1_CODE_334}</span>, <span class="pl-avar">_59075334{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (process_input_for_check $l_pat $r_pat $relative_var)  
    (if 
      (== $l_pat ()) False 
      (check_pattern_match 
        (car-atom $l_pat) $r_pat $relative_var $l_pat $r_pat)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">process_input_for_check</span>, 
     <span class="pl-var">_l_pat5</span>,  <span class="pl-var">_r_pat5</span>, <span class="pl-var">_relative_var5</span>, <span class="pl-var">RetVal719</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_60240702{vn = ..., cns = ...}</span>, <span class="pl-avar">_60240834{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_60240730{vn = ..., cns = ...}</span>, <span class="pl-avar">_60240876{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_60240758{vn = ..., cns = ...}</span>, <span class="pl-avar">_60240918{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_60240834{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _60240992{$P1_CODE_355} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_355</span>, 
         [ <span class="pl-atom">check_pattern_match</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_l_pat</span></span>]</span>,    <span class="pl-var">_r_pat</span>, <span class="pl-var">_relative_var</span>, <span class="pl-var">_l_pat</span>, <span class="pl-var">_r_pat</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_l_pat</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_relative_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_l_pat</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span> , 
           <span class="pl-atom">s</span>( <span class="pl-atom">check_pattern_match</span>, 
             <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, 
             <span class="pl-var">P1_CODE_RESULT_355</span>))) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_60240992{$P1_CODE_355}</span>, <span class="pl-avar">_60240786{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (check_pattern_match $l_pat $r_pat $relative_var $ori_l_pat $ori_r_pat)  
    (if 
      (== $r_pat ()) 
      (process_input_for_check 
        (cdr-atom $ori_l_pat) $ori_r_pat $relative_var) 
      (if 
        (is_more_abstract $l_pat 
          (car-atom $r_pat) $relative_var) True 
        (check_pattern_match $l_pat 
          (cdr-atom $r_pat) $relative_var $ori_l_pat $ori_r_pat))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">check_pattern_match</span>, 
     <span class="pl-var">_l_pat9</span>,  <span class="pl-var">_r_pat9</span>, <span class="pl-var">_relative_var9</span>, <span class="pl-var">_ori_l_pat1</span>, <span class="pl-var">_ori_r_pat1</span>, <span class="pl-var">RetVal723</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_60656732{vn = ..., cns = ...}</span>, <span class="pl-avar">_60656920{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_60656760{vn = ..., cns = ...}</span>, <span class="pl-avar">_60656962{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_60656788{vn = ..., cns = ...}</span>, <span class="pl-avar">_60657004{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_60656816{vn = ..., cns = ...}</span>, <span class="pl-avar">_60657046{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_60656844{vn = ..., cns = ...}</span>, <span class="pl-avar">_60657088{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_60656962{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _60657162{$P1_CODE_359} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_359</span>, 
         [ <span class="pl-atom">process_input_for_check</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_ori_l_pat</span></span>]</span>, <span class="pl-var">_ori_r_pat</span>, <span class="pl-var">_relative_var</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_ori_l_pat</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_ori_r_pat</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_relative_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">process_input_for_check</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">P1_CODE_RESULT_359</span></span>)</span>)) , 
     _60657314{$P1_CODE_360} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd360</span>, <span class="pl-var">P1_CODE_RESULT_360</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">is_more_abstract</span>, 
             <span class="pl-var">_l_pat</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_r_pat</span></span>]</span>, 
             <span class="pl-var">_relative_var</span>], 
           <span class="pl-atom">'True'</span>, 
           [ <span class="pl-atom">check_pattern_match</span>, 
             <span class="pl-var">_l_pat</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_pat</span></span>]</span>, <span class="pl-var">_relative_var</span>, <span class="pl-var">_ori_l_pat</span>, 
             <span class="pl-var">_ori_r_pat</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_l_pat</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_relative_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">is_more_abstract</span>, <span class="pl-var">G</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span></span>)</span> , 
           <span class="pl-var">P1_CODE_361</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd360</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_361</span>, 
                [ <span class="pl-atom">check_pattern_match</span>, 
                  <span class="pl-var">_l_pat</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_pat</span></span>]</span>, <span class="pl-var">_relative_var</span>, <span class="pl-var">_ori_l_pat</span>, 
                  <span class="pl-var">_ori_r_pat</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_l_pat</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_relative_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_ori_l_pat</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_ori_r_pat</span></span> , 
                  <span class="pl-atom">me</span>( <span class="pl-atom">check_pattern_match</span>, 
                    <span class="pl-var">L</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, 
                    <span class="pl-var">Q</span>, <span class="pl-var">P1_CODE_RESULT_361</span>))) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">K</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_361</span>, <span class="pl-var">P1_CODE_RESULT_360</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_60657162{$P1_CODE_359}</span>, <span class="pl-avar">_60657314{$P1_CODE_360}</span>, <span class="pl-avar">_60656872{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; ------------------------------------------------------------------
%  ;; Function: support
%  ;;
%  ;; Description:
%  ;;   Computes the support value for a given pattern in relation to a
%  ;;   database. The function recursively evaluates the support for each
%  ;;   component (or "clouse") within the pattern.
%  ;;
%  ;; Parameters:
%  ;;   $pattern - The pattern for which support is calculated. It can 
%  ;;              consist of multiple sub-patterns obtained via get-clouses.
%  ;;   $db      - The database context against which the pattern support
%  ;;              is computed.
%  ;;
%  ;; Behavior:
%  ;;   1. Retrieves the list of sub-patterns (clouses) using get-clouses.
%  ;;   2. If the sub-pattern list is empty, returns a support value of 1,
%  ;;      representing a base or trivial support.
%  ;;   3. Otherwise, the function:
%  ;;         - Decomposes the sub-pattern list into the head and tail.
%  ;;         - Computes the support of the head using a separate
%  ;;           support evaluation function (sup).
%  ;;         - Recursively computes the support for the tail.
%  ;;         - Multiplies the results to generate the overall support.
%  ;;
%  ;; Returns:
%  ;;   A numeric value representing the cumulative support for the pattern.
%  ;; ------------------------------------------------------------------
/*
  (= (support $pattern $db)  
    (let $patterns 
      (get-clouses $pattern) 
      (if 
        (== $patterns ()) 1 
        (let* 
          ( ($head (car-atom $patterns)) 
            ($tail (cdr-atom $patterns)) 
            ($sup (sup $head $db))) 
          (* $sup 
            (support $tail $db))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">support</span>, <span class="pl-var">_pattern53</span>, <span class="pl-var">_db37</span>, <span class="pl-var">RetVal727</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_61468408{vn = ..., cns = ...}</span>, <span class="pl-avar">_61468512{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_61468436{vn = ..., cns = ...}</span>, <span class="pl-avar">_61468554{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_61468512{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-clouses'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_61468608{$_patterns}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_61468608{$_patterns}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _61468668{$P1_CODE_371} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Number'</span>, <span class="pl-var">P1_CODE_RESULT_371</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
             [ <span class="pl-var">_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
             [ <span class="pl-var">_sup</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">sup</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">*</span>, 
             <span class="pl-var">_sup</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">support</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">sup</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_sup</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_sup</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">support</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">H</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_371</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-int">1</span>, <span class="pl-avar">_61468668{$P1_CODE_371}</span>, <span class="pl-avar">_61468464{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Documentation for add-conjunct:
%  ;; 
%  ;; Description:
%  ;;   This function ensures that a given pattern starts with a comma.
%  ;;   - If the input pattern is empty, it simply returns an empty pattern.
%  ;;   - If the pattern is non-empty, the function checks its first element.
%  ;;   - If the first element is already a comma, the pattern is returned unchanged.
%  ;;   - Otherwise, it prepends a comma to the pattern and returns the new pattern.
%  ;;
%  ;; Parameters:
%  ;;   $pattern - The list or pattern to which a comma may need to be added.
%  ;;
%  ;; Returns:
%  ;;   A pattern that either remains unchanged (if it already starts with a comma or is empty)
%  ;;   or has a comma prepended if the first element is not a comma.
/*
  (= (add-conjunct $pattern)  
    (if 
      (== $pattern ()) () 
      (let $front_link 
        (car-atom $pattern) 
        (if 
          (== $front_link ,) $pattern 
          (cons-atom , $pattern)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'add-conjunct'</span>, <span class="pl-var">_pattern57</span>, <span class="pl-var">RetVal731</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_62007638{vn = ..., cns = ...}</span>, <span class="pl-avar">_62007714{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_62007714{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _62007794{$P1_CODE_375} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd375</span>, <span class="pl-var">P1_CODE_RESULT_375</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_front_link</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_pattern</span></span>]</span>, 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_front_link</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-var">_pattern</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_front_link</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_front_link</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">D</span>, <span class="pl-atom">','</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-var">P1_CODE_376</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd375</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_376</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_RESULT_376</span></span>)</span></span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">P1_CODE_376</span>, <span class="pl-var">P1_CODE_RESULT_375</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_62007794{$P1_CODE_375}</span>, <span class="pl-avar">_62007666{vn = ..., cns = ...}</span></span>)</span></span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/common-util.metta at 2025-10-16T14:06:44+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
