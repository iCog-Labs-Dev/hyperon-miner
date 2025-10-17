%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/surp-utils.metta at 2025-10-17T09:14:20+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

%  ;;;;;;;;;;;;;;;;;;;;
%  ;; Surprisingness ;;
%  ;;;;;;;;;;;;;;;;;;;;
%  ; (=(add-subpatterns () $space) ())
%  ; (=(add-subpatterns $partition $space)(
%  ;     let* ((($head $tail) (decons-atom $partition))
%  ;            ($subpattern (mk-body $head))
%  ;            ($dummy (add-subpatterns $tail $space))
%  ;             )
%  ;             (cons-atom $subpattern $dummy)
%  ; ))
/*
  (= (add-subpatterns $MeTTa_SP__partition_1 $_)  
    (collapse (mk-body (superpose $MeTTa_SP__partition_1))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'add-subpatterns'</span>, <span class="pl-var">_partition1</span>, <span class="pl-var">_space5</span>, <span class="pl-var">RetVal787</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66863134{vn = ..., cns = ...}</span>, <span class="pl-avar">_66863238{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_66863162{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__partition_1</span>, <span class="pl-var">B</span></span>)</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'mk-body'</span>, <span class="pl-var">B</span>, <span class="pl-var">A</span></span>)</span></span>, 
       _66863190{vn = ..., cns = ...})</span>) ).


/*
  (= (get-subpatterns $pattern $space)  
    (let $parts 
      (partitions_without_pattern (get-clouses $pattern)) 
      (add-subpatterns $parts $space)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-subpatterns'</span>, <span class="pl-var">_pattern61</span>, <span class="pl-var">_space9</span>, <span class="pl-var">RetVal791</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67009234{vn = ..., cns = ...}</span>, <span class="pl-avar">_67009338{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67009262{vn = ..., cns = ...}</span>, <span class="pl-avar">_67009380{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67009338{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-clouses'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">partitions_without_pattern</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_67009448{$_parts}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67009448{$_parts}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67009380{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'add-subpatterns'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_67009290{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (mk-unique ())  )
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'mk-unique'</span>, <span class="pl-var">Nil69</span>, []</span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_67141708{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span></span>) ).


/*
  (= (mk-unique $vars)  
    (let 
      ($head $_) 
      (decons-atom $vars) 
      (let $dummy 
        (mk-unique (remove-element $head $vars)) 
        (cons-atom $head $dummy))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'mk-unique'</span>, <span class="pl-var">_vars1</span>, <span class="pl-var">RetVal799</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67248044{vn = ..., cns = ...}</span>, <span class="pl-avar">_67248120{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67248120{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_67248192{$_head}</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67248192{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67248120{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'remove-element'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'mk-unique'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_67248260{$_dummy}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67248192{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67248260{$_dummy}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_67248072{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (get-unique-vars $pattern)  
    (let $vars 
      (get-variables $pattern) 
      (mk-unique $vars)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-unique-vars'</span>, <span class="pl-var">_pattern65</span>, <span class="pl-var">RetVal803</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67404094{vn = ..., cns = ...}</span>, <span class="pl-avar">_67404170{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67404170{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-variables'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_67404224{$_vars}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67404224{$_vars}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'mk-unique'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_67404122{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (joint-variables-init $pattern $partion)  
    (let $vars 
      (get-unique-vars $pattern) 
      (joint-variables $vars $partion)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'joint-variables-init'</span>, <span class="pl-var">_pattern69</span>, <span class="pl-var">_partion9</span>, <span class="pl-var">RetVal807</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67528210{vn = ..., cns = ...}</span>, <span class="pl-avar">_67528314{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67528238{vn = ..., cns = ...}</span>, <span class="pl-avar">_67528356{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67528314{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-unique-vars'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_67528410{$_vars}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67528410{$_vars}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67528356{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'joint-variables'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_67528266{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (emp_tv_mem $pattern_list $db)  
    (if 
      (== $pattern_list ()) () 
      (let* 
        ( ( ($head $tail) (decons-atom $pattern_list)) 
          ($new_head (remove-parenthesis $head)) 
          ($emp_value (unify ($link $x $y) $new_head (emp-tv $new_head $db) (chain (cons-atom , $new_head) $ptrn (emp-tv $ptrn $db)))) 
          ($dummy (emp_tv_mem $tail $db))) 
        (cons-atom $emp_value $dummy))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">emp_tv_mem</span>, <span class="pl-var">_pattern_list1</span>, <span class="pl-var">_db41</span>, <span class="pl-var">RetVal811</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67758620{vn = ..., cns = ...}</span>, <span class="pl-avar">_67758724{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67758648{vn = ..., cns = ...}</span>, <span class="pl-avar">_67758766{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67758724{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _67758846{$P1_CODE_423} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_423</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [     _head    ,    _tail    ],
               [  decons-atom ,_pattern_list]], 
             [ <span class="pl-var">_new_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'remove-parenthesis'</span>, <span class="pl-var">_head</span></span>]</span>], 
             [ <span class="pl-var">_emp_value</span>, 
               [ <span class="pl-atom">unify</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_link</span>, <span class="pl-var">_x</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 <span class="pl-var">_new_head</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">_new_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 [ <span class="pl-atom">chain</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                   <span class="pl-var">_ptrn</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">_ptrn</span>|<span class="pl-ellipsis">...</span></span>]</span>]]], 
             [ <span class="pl-var">_dummy</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">emp_tv_mem</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_emp_value</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_pattern_list</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'remove-parenthesis'</span>, <span class="pl-var">E</span>, <span class="pl-var">_new_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_new_head</span></span> , 
           <span class="pl-var">P1_CODE_424</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_424</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">_new_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_new_head</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_424</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_425</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_425</span>, 
                [ <span class="pl-atom">chain</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                  <span class="pl-var">_ptrn</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">_ptrn</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_new_head</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-atom">','</span>, <span class="pl-var">I</span>, <span class="pl-var">_ptrn</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_ptrn</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'emp-tv'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_425</span></span>)</span>)) , 
           <span class="pl-atom">s</span>( <span class="pl-atom">unify</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_link</span>, <span class="pl-var">_x</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">F</span>, <span class="pl-var">P1_CODE_424</span>, 
             <span class="pl-var">P1_CODE_425</span>, <span class="pl-var">_emp_value</span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">emp_tv_mem</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">_dummy</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_emp_value</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_dummy</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P1_CODE_RESULT_423</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_67758846{$P1_CODE_423}</span>, <span class="pl-avar">_67758676{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Orchestrating the overall process to calculate the average truth value
%  ;  * This function calculates the average truth value from a list of truth values.
%   ;  *
%   ;  * Steps followed in the calculation:
%   ;  *
%   ;  * 1. Extract Beta distributions from the given truth values.
%   ;  * 2. Calculate the mean for each Beta distribution.
%   ;  * 3. Calculate the variances for each Beta distribution.
%   ;  * 4. Calculate the overall average mean from the individual means.
%   ;  * 5. Calculate the relative variances using the individual means, variances, and the overall average mean.
%   ;  * 6. Combine the original variances with the relative variances.
%   ;  * 7. Calculate the average variance from the combined variances.
%   ;  * 8. Create the final truth value using the average mean and variance.
%   ;  * 9. Return the final truth value.
/*
  (= (avrg_tv $tv)  
    (let* 
      ( ($tv_list (mk_distribution_list $tv)) 
        ($size (tuple-count $tv_list)) 
        ($mean (let $sum (mean_accumulater $tv_list 0) (// $sum $size))) 
        ($re_variance (let $var_sum (var_accumulater $tv_list 0 $mean) (// $var_sum $size))) 
        ($FinalAnswer (mk_stv $mean $re_variance))) $FinalAnswer))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">avrg_tv</span>, <span class="pl-var">_tv1</span>, <span class="pl-var">RetVal815</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68710138{vn = ..., cns = ...}</span>, <span class="pl-avar">_68710214{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710214{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">mk_distribution_list</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_68710268{$_tv_list}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710268{$_tv_list}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'tuple-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_68710308{$_size}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710268{$_tv_list}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">mean_accumulater</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-avar">_68710356{$_sum}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710356{$_sum}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710308{$_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_68710410{$_mean}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710268{$_tv_list}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710410{$_mean}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">var_accumulater</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_68710466{$_var_sum}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710466{$_var_sum}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710308{$_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-avar">_68710520{$_re_variance}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710410{$_mean}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68710520{$_re_variance}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">mk_stv</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-avar">_68710574{$FinalAnswer}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_68710166{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_68710574{$FinalAnswer}</span></span></span>) ).


/*
  (= (is_equivalent ($link1 $x1 $y1) ($link2 $x2 $y2) $var)  
    (if 
      (== $link1 $link2) 
      (or 
        (and 
          (== $x1 $x2) 
          (== $x2 $var)) 
        (and 
          (== $y1 $y2) 
          (== $y2 $var))) False))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">is_equivalent</span>, 
     <span class="pl-var">_link1__x1__y15</span>, <span class="pl-var">_link2__x2__y25</span>, <span class="pl-var">_var21</span>, 
     <span class="pl-var">RetVal819</span>) :- 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_link1__x1__y15</span>, [
       <span class="pl-var">_link1</span>, <span class="pl-avar">_69051322{$_x1}</span>, <span class="pl-avar">_69051342{$_y1}</span>]) , 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_link2__x2__y25</span>, [
       <span class="pl-var">_link2</span>, <span class="pl-avar">_69051394{$_x2}</span>, <span class="pl-avar">_69051414{$_y2}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69051222{vn = ..., cns = ...}</span>, <span class="pl-avar">_69051442{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69051302{$_link1}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69051374{$_link2}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _69051522{$P1_CODE_435} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_435</span>, 
         [ <span class="pl-atom">or</span>, 
           [ <span class="pl-atom">and</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_x1</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_x2</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
           [ <span class="pl-atom">and</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_y1</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_y2</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         <span class="pl-atom">call_for_unit</span>(   ((&#13;&#10; 
                                                        (<span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">_x1</span><span class="pl-infix">==</span><span class="pl-var">_x2</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-var">_x2</span><span class="pl-infix">==</span><span class="pl-var">_var</span></span></span>);
                                                        (<span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">_y1</span><span class="pl-infix">==</span><span class="pl-var">_y2</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-var">_y2</span><span class="pl-infix">==</span><span class="pl-var">_var</span></span></span>)  )), 
           <span class="pl-var">P1_CODE_RESULT_435</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_69051522{$P1_CODE_435}</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_69051250{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (is_equivalent ($link1 $x1) ($link2 $x2) $var)  
    (if 
      (== $link1 $link2) 
      (and 
        (== $x1 $x2) 
        (== $x2 $var)) False))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">is_equivalent</span>, <span class="pl-var">_link1__x11</span>, <span class="pl-var">_link2__x21</span>, <span class="pl-var">_var25</span>, <span class="pl-var">RetVal823</span></span>)</span> :- 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_link1__x11</span>, [
       <span class="pl-var">_link1</span>, 
       _69476252{$_x1}]) , 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_link2__x21</span>, [
       <span class="pl-var">_link2</span>, 
       _69476304{$_x2}]) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69476152{vn = ..., cns = ...}</span>, <span class="pl-avar">_69476332{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69476232{$_link1}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69476284{$_link2}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _69476412{$P1_CODE_439} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Bool'</span>, <span class="pl-var">P1_CODE_RESULT_439</span>, 
         [ <span class="pl-atom">and</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_x1</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_x2</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_x1</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_x2</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">P1_CODE_RESULT_439</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_x2</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_RESULT_439</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_69476412{$P1_CODE_439}</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_69476180{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (dst_from_interval $emin $emax $emp)  
    (if 
      (< $emax $emp) 
      (- $emp $emax) 
      (if 
        (< $emp $emin) 
        (- $emin $emp) 0.0)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">dst_from_interval</span>, <span class="pl-var">_emin1</span>, <span class="pl-var">_emax1</span>, <span class="pl-var">_emp1</span>, <span class="pl-var">RetVal827</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69847774{vn = ..., cns = ...}</span>, <span class="pl-avar">_69847906{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69847802{vn = ..., cns = ...}</span>, <span class="pl-avar">_69847948{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69847830{vn = ..., cns = ...}</span>, <span class="pl-avar">_69847990{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69847948{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69847990{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _69848070{$P1_CODE_443} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Number'</span>, <span class="pl-var">P1_CODE_RESULT_443</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_emp</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_emp</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_emax</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">P1_CODE_RESULT_443</span></span>)</span>)) , 
     _69848176{$P1_CODE_444} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd444</span>, <span class="pl-var">P1_CODE_RESULT_444</span>, 
         [ <span class="pl-atom">if</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-var">_emp</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_emin</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
           <span class="pl-float">0.0</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_emp</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_emin</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-var">P1_CODE_445</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd444</span></span>]</span>, <span class="pl-atom">'Number'</span>, <span class="pl-var">P1_CODE_RESULT_445</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_emin</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_emin</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_emp</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">P1_CODE_RESULT_445</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_445</span>, <span class="pl-float">0.0</span>, <span class="pl-var">P1_CODE_RESULT_444</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_69848070{$P1_CODE_443}</span>, <span class="pl-avar">_69848176{$P1_CODE_444}</span>, <span class="pl-avar">_69847858{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;$emp < $emin ---- $emax < $emp 
%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/surp-utils.metta at 2025-10-17T09:14:27+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
