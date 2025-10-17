%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/partition-metta.metta at 2025-10-17T09:14:13+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

%  ;;Checks if **all elements** of $lst are in $used
/*
  (= (all-in $lst $used)  
    (let $inter 
      (intersection-atom $lst $used) 
      (if 
        (== 
          (size-atom $inter) 
          (size-atom $lst)) True False)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'all-in'</span>, <span class="pl-var">_lst1</span>, <span class="pl-var">_used1</span>, <span class="pl-var">RetVal735</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_62487210{vn = ..., cns = ...}</span>, <span class="pl-avar">_62487314{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_62487238{vn = ..., cns = ...}</span>, <span class="pl-avar">_62487356{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">intersection</span>(<span class="pl-args"><span class="pl-avar">_62487314{vn = ..., cns = ...}</span>, <span class="pl-avar">_62487356{vn = ..., cns = ...}</span>, <span class="pl-avar">_62487398{$_inter}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_62487398{$_inter}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_62487314{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-atom">'True'</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_62487266{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Example:  (powerset (a b)) → (() (b) (a) (a b))
/*
  (= (powerset $lst)  
    (if 
      (== $lst ()) 
      (()) 
      (let* 
        ( ( ($head $tail) (decons-atom $lst)) 
          ($ps_tail (powerset $tail)) 
          ($with_head (map-atom $ps_tail $s (cons-atom $head $s)))) 
        (union-atom $ps_tail $with_head))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">powerset</span>, <span class="pl-var">_lst5</span>, <span class="pl-var">RetVal739</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_62741804{vn = ..., cns = ...}</span>, <span class="pl-avar">_62741880{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_62741880{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _62741954{$P1_CODE_383} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, 
         <span class="pl-var">RetTypeNotCd383</span>, 
         <span class="pl-var">P1_CODE_RESULT_383</span>, 
         [ 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args">[]</span>]</span>, 
         <span class="pl-atom">eval_for1</span>( 
            <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
            <span class="pl-var">RetTypeNotCd383</span>, 
            [ 
            <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args">[]</span>]</span>, 
            <span class="pl-var">P1_CODE_RESULT_383</span>)) , 
     _62742032{$P1_CODE_384} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_384</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom,   _lst    ]], 
             [ <span class="pl-var">_ps_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">powerset</span>, <span class="pl-var">_tail</span></span>]</span>], 
             [ <span class="pl-var">_with_head</span>, 
               [ <span class="pl-atom">'map-atom'</span>, <span class="pl-var">_ps_tail</span>, <span class="pl-var">_s</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>]]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">_ps_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_lst</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">powerset</span>, <span class="pl-var">E</span>, <span class="pl-var">_ps_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_ps_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_s</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_s</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'map-atom'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">J</span>, <span class="pl-var">_with_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_ps_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_with_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_384</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_62741954{$P1_CODE_383}</span>, <span class="pl-avar">_62742032{$P1_CODE_384}</span>, <span class="pl-avar">_62741832{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;;Checks if **any element** of $lst is in $used
/*
  (= (any-in $lst $used)  
    (let $inter 
      (intersection-atom $lst $used) 
      (if 
        (== 
          (size-atom $inter) 0) False True)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'any-in'</span>, <span class="pl-var">_lst9</span>, <span class="pl-var">_used5</span>, <span class="pl-var">RetVal743</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63299504{vn = ..., cns = ...}</span>, <span class="pl-avar">_63299608{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63299532{vn = ..., cns = ...}</span>, <span class="pl-avar">_63299650{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">intersection</span>(<span class="pl-args"><span class="pl-avar">_63299608{vn = ..., cns = ...}</span>, <span class="pl-avar">_63299650{vn = ..., cns = ...}</span>, <span class="pl-avar">_63299692{$_inter}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63299692{$_inter}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-atom">'True'</span>, <span class="pl-avar">_63299560{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;the subset can't be an empty set or the orginal set itself
/*
  (= (valid-subset $subset $original)  
    (and 
      (not (== $subset ())) 
      (not (== $subset $original))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'valid-subset'</span>, <span class="pl-var">_subset1</span>, <span class="pl-var">_original1</span>, <span class="pl-var">RetVal747</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63494158{vn = ..., cns = ...}</span>, <span class="pl-avar">_63494262{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63494186{vn = ..., cns = ...}</span>, <span class="pl-avar">_63494304{vn = ..., cns = ...}</span></span>)</span> , 
     ( <span class="pl-atom">\+</span> ( 
        eval_true( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">A</span><span class="pl-infix">=</span><span class="pl-var">_subset</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=~</span> <span class="pl-ellipsis">...</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span></span>)) ) , 
     ( <span class="pl-atom">\+</span> ( 
        eval_true( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">B</span><span class="pl-infix">=</span><span class="pl-var">_subset</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span></span>)) )</span>) ).


%  ;;This function explores all combinations of valid, 
%  ;;disjoint subsets that together cover the original list exactly once. It ensures:
%  ;;No repetition.
%  ;;No subset is empty or equal to the full set.
%  ;;Each partition is complete (checked by all-in in partitions-helper).
%  ; Collect partitions by trying each valid subset
/*
  (= (partitions-collect $subsets $original $current $used)  
    (if 
      (== $subsets ()) () 
      (let 
        ($subset $rest) 
        (decons-atom $subsets) 
        (if 
          (and 
            (valid-subset $subset $original) 
            (not (any-in $subset $used))) 
          (let* 
            ( ($first (partitions-helper $subsets $original (cons-atom $subset $current) (union-atom $used $subset))) ($second (partitions-collect $rest $original $current $used))) 
            (union-atom $first $second)) 
          (partitions-collect $rest $original $current $used)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'partitions-collect'</span>, 
     <span class="pl-var">_subsets1</span>,  <span class="pl-var">_original5</span>, <span class="pl-var">_current1</span>, <span class="pl-var">_used9</span>, <span class="pl-var">RetVal751</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63812646{vn = ..., cns = ...}</span>, <span class="pl-avar">_63812806{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63812674{vn = ..., cns = ...}</span>, <span class="pl-avar">_63812848{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63812702{vn = ..., cns = ...}</span>, <span class="pl-avar">_63812890{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63812730{vn = ..., cns = ...}</span>, <span class="pl-avar">_63812932{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63812806{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _63813012{$P1_CODE_391} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd391</span>, <span class="pl-var">P1_CODE_RESULT_391</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_subset</span>, <span class="pl-var">_rest</span></span>]</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">_subsets</span></span>]</span>, 
           [ <span class="pl-atom">if</span>, 
             [ <span class="pl-atom">and</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'valid-subset'</span>, <span class="pl-var">_subset</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
               [ <span class="pl-atom">not</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'any-in'</span>, <span class="pl-var">_subset</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
             [ <span class="pl-atom">'let*'</span>, 
               [ [ <span class="pl-var">_first</span>, 
                   [ <span class="pl-atom">'partitions-helper'</span>, <span class="pl-var">_subsets</span>, <span class="pl-var">_original</span>, 
                     <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_subset</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                     <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">_used</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
                 [ <span class="pl-var">_second</span>, 
                   [ <span class="pl-atom">'partitions-collect'</span>,              <span class="pl-var">_rest</span>, <span class="pl-var">_original</span>, <span class="pl-var">_current</span>, <span class="pl-var">_used</span>]]], 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">_first</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-atom">'partitions-collect'</span>,        <span class="pl-var">_rest</span>, <span class="pl-var">_original</span>, <span class="pl-var">_current</span>, <span class="pl-var">_used</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_subsets</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_subset</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_subset</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_original</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'valid-subset'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           ( <span class="pl-atom">\+</span> ( 
              eval_true( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_subset</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span></span>)) ) , 
           <span class="pl-var">P1_CODE_392</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd391</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_392</span>, 
                [ <span class="pl-atom">'let*'</span>, 
                  [ [ <span class="pl-var">_first</span>, 
                      [ <span class="pl-atom">'partitions-helper'</span>, <span class="pl-var">_subsets</span>, <span class="pl-var">_original</span>, 
                        <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_subset</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                        <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">_used</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
                    [ <span class="pl-var">_second</span>, 
                      [ <span class="pl-atom">'partitions-collect'</span>,           <span class="pl-var">_rest</span>, <span class="pl-var">_original</span>, <span class="pl-var">_current</span>, <span class="pl-var">_used</span>]]], 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">_first</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_subsets</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_original</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_subset</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_current</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_used</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_subset</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">Q</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'partitions-helper'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">N</span>, <span class="pl-var">Q</span>, <span class="pl-var">_first</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_rest</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">S</span><span class="pl-infix">=</span><span class="pl-var">_original</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_current</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">U</span><span class="pl-infix">=</span><span class="pl-var">_used</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'partitions-collect'</span>, <span class="pl-var">R</span>, <span class="pl-var">S</span>, <span class="pl-var">T</span>, <span class="pl-var">U</span>, <span class="pl-var">_second</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">V</span><span class="pl-infix">=</span><span class="pl-var">_first</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">W</span><span class="pl-infix">=</span><span class="pl-var">_second</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">V</span>, <span class="pl-var">W</span>, <span class="pl-var">P1_CODE_RESULT_392</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_393</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd391</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_393</span>, 
                [ <span class="pl-atom">'partitions-collect'</span>,     <span class="pl-var">_rest</span>, <span class="pl-var">_original</span>, <span class="pl-var">_current</span>, <span class="pl-var">_used</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">X</span><span class="pl-infix">=</span><span class="pl-var">_rest</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">Y</span><span class="pl-infix">=</span><span class="pl-var">_original</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">Z</span><span class="pl-infix">=</span><span class="pl-var">_current</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">A1</span><span class="pl-infix">=</span><span class="pl-var">_used</span></span> , 
                  <span class="pl-atom">me</span>( <span class="pl-atom">'partitions-collect'</span>, 
                    <span class="pl-var">X</span>, <span class="pl-var">Y</span>, <span class="pl-var">Z</span>, <span class="pl-var">A1</span>, 
                    <span class="pl-var">P1_CODE_RESULT_393</span>))) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_392</span>, <span class="pl-var">P1_CODE_393</span>, <span class="pl-var">P1_CODE_RESULT_391</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_63813012{$P1_CODE_391}</span>, <span class="pl-avar">_63812758{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Recursive helper
/*
  (= (partitions-helper $subsets $original $current $used)  
    (if 
      (all-in $original $used) 
      ($current) 
      (partitions-collect 
        (cdr-atom $subsets) $original $current $used)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'partitions-helper'</span>, 
     <span class="pl-var">_subsets5</span>,  <span class="pl-var">_original9</span>, <span class="pl-var">_current5</span>, <span class="pl-var">_used13</span>, <span class="pl-var">RetVal755</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64987496{vn = ..., cns = ...}</span>, <span class="pl-avar">_64987656{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64987524{vn = ..., cns = ...}</span>, <span class="pl-avar">_64987698{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64987552{vn = ..., cns = ...}</span>, <span class="pl-avar">_64987740{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64987580{vn = ..., cns = ...}</span>, <span class="pl-avar">_64987782{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64987698{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64987782{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'all-in'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _64987862{$P1_CODE_403} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd403</span>, <span class="pl-var">P1_CODE_RESULT_403</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_current</span></span>]</span>, 
         <span class="pl-atom">eval_for1</span>( 
            <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
            <span class="pl-var">RetTypeNotCd403</span>, 
            <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_current</span></span>]</span>, 
            <span class="pl-var">P1_CODE_RESULT_403</span>)) , 
     _64987946{$P1_CODE_404} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_404</span>, 
         [ <span class="pl-atom">'partitions-collect'</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_subsets</span></span>]</span>,    <span class="pl-var">_original</span>, <span class="pl-var">_current</span>, <span class="pl-var">_used</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_subsets</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_original</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_current</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_used</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'partitions-collect'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_404</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_64987862{$P1_CODE_403}</span>, <span class="pl-avar">_64987946{$P1_CODE_404}</span>, <span class="pl-avar">_64987608{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Main: Generate all partitions
/*
  (= (partitions $subsets $original)  
    (partitions-collect $subsets $original () ()))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">partitions</span>, <span class="pl-var">_subsets9</span>, <span class="pl-var">_original13</span>, <span class="pl-var">RetVal759</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65380568{vn = ..., cns = ...}</span>, <span class="pl-avar">_65380672{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65380596{vn = ..., cns = ...}</span>, <span class="pl-avar">_65380714{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65380672{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65380714{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'partitions-collect'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], [], <span class="pl-avar">_65380624{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; ==============================================================================
%  ;; Function: partitions
%  ;; Purpose: Computes all valid **partitions** of a given list (set pattern)
%  ;;
%  ;; Parameters:
%  ;;   $original  - The original list to be partitioned
%  ;;
%  ;; How it works:
%  ;; 1. Computes the powerset of the original list:
%  ;;    (powerset $original)
%  ;;    - Generates all possible subsets of the list, including empty and full
%  ;;    - This forms the pool of candidates from which partitions will be constructed
%  ;;
%  ;; 2. Filters and selects subsets to build partitions:
%  ;;    - Uses only those subsets which are:
%  ;;        a. Non-empty
%  ;;        b. Not equal to the full original set
%  ;;        c. Disjoint from subsets already used
%  ;;    - Avoids duplicate element usage across subsets
%  ;;
%  ;; 3. Recursively assembles valid partitions:
%  ;;    (partitions-helper ...) and (partitions-collect ...)
%  ;;    - Tracks current partition in progress and used elements
%  ;;    - Recursion continues until all elements of the original list are covered
%  ;;
%  ;; 4. Ensures full coverage:
%  ;;    (all-in $original $used)
%  ;;    - Final partitions are those where all original elements are included exactly once
%  ;;
%  ;; Key Helper Functions:
%  ;;   - powerset: Generates all subsets
%  ;;   - valid-subset: Filters out empty and full-set subsets
%  ;;   - all-in / any-in: Check coverage and overlaps
%  ;;   - partitions-collect: Core function to explore subset combinations
%  ;;
%  ;; Return Value:
%  ;;   Returns a list of valid partitions, where each partition is a list of 
%  ;;   disjoint, non-empty subsets that together cover the original list.
%  ;;
%  ;; Typical Usage:
%  ;;   Used in probability estimation, pattern decomposition, or symbolic reasoning
%  ;;   tasks where exhaustive enumeration of all disjoint covers is required.
%  ;; ==============================================================================
/*
  (= (partitions $original)  
    (partitions 
      (powerset $original) $original))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">partitions</span>, <span class="pl-var">_original17</span>, <span class="pl-var">RetVal763</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65522740{vn = ..., cns = ...}</span>, <span class="pl-avar">_65522816{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65522816{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">powerset</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65522816{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">partitions</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_65522768{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;!(partitions ((Inheritance $x man) (Inheritance $x sodaDrinker) (Inheritance $x ugly)))
%  ;; ===========================================================================
%  ;; FUNCTION: powerset-without-empity
%  ;;
%  ;; DESCRIPTION:
%  ;;   Generates all non-empty subsets of the given list.
%  ;;
%  ;; PARAMETERS:
%  ;;   • $list — A list of elements to compute the subsets from.
%  ;;
%  ;; RETURNS:
%  ;;   A flat list of lists, each representing a non-empty subset of $list.
%  ;;
%  ;; EXAMPLE:
%  ;;   (powerset-without-empity '(a b c))
%  ;;   ⇒ ((a) (b) (c) (a b) (a c) (b c) (a b c))
%  ;; ===========================================================================
/*
  (= (powerset-without-empity $list)  
    (let $MeTTa_SP__subset_1 
      (powerset $list) 
      (collapse (subtraction (superpose $MeTTa_SP__subset_1) (superpose (()))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'powerset-without-empity'</span>, <span class="pl-var">_list57</span>, <span class="pl-var">RetVal767</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65658226{vn = ..., cns = ...}</span>, <span class="pl-avar">_65658302{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65658302{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">powerset</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_65658356{$MeTTa_SP__subset_1}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">B</span>, 
       ( <span class="pl-var">P1_CODE_411</span> =  
              
           <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_411</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__subset_1</span></span>]</span>, 
             <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__subset_1</span>, <span class="pl-var">P1_CODE_RESULT_411</span></span>)</span>)  ,
         <span class="pl-var">P1_CODE_412</span> =  
              
           <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, 
             <span class="pl-anon">_</span>, 
             [], 
             [ <span class="pl-atom">superpose</span>, 
               [ 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args">[]</span>]</span>], 
             <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span>) , 
         <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">subtraction</span>, <span class="pl-var">P1_CODE_411</span>, <span class="pl-var">P1_CODE_412</span>, <span class="pl-var">B</span></span>)</span>), 
       _65658254{vn = ..., cns = ...})</span>) ).


/*
  (= (concat-atom $list1 $list2)  
    (if 
      (== $list1 ()) $list2 
      (let* 
        ( ($head (car-atom $list1)) ($tail (concat-atom (cdr-atom $list1) $list2))) 
        (cons-atom $head $tail))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'concat-atom'</span>, <span class="pl-var">_list11</span>, <span class="pl-var">_list21</span>, <span class="pl-var">RetVal771</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65965448{vn = ..., cns = ...}</span>, <span class="pl-avar">_65965552{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65965476{vn = ..., cns = ...}</span>, <span class="pl-avar">_65965594{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65965552{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65965594{vn = ..., cns = ...}</span></span> , 
     _65965680{$P1_CODE_419} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_419</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_list1</span></span>]</span>], 
             [ <span class="pl-var">_tail</span>, 
               [ <span class="pl-atom">'concat-atom'</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_list1</span></span>]</span>, 
                 <span class="pl-var">_list2</span>]]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_list1</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_list1</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_list2</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'concat-atom'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_419</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_65965680{$P1_CODE_419}</span>, <span class="pl-avar">_65965504{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (generet-partition-without-pattern $lst)  
    (partitions (get-clauses $lst)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'generet-partition-without-pattern'</span>, <span class="pl-var">_lst13</span>, <span class="pl-var">RetVal775</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66370494{vn = ..., cns = ...}</span>, <span class="pl-avar">_66370570{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_66370570{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-clauses'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">partitions</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_66370522{vn = ..., cns = ...}</span></span>)</span></span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/partition-metta.metta at 2025-10-17T09:14:20+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
