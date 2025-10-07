%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/surprisingness/metta_log/emp-prob.metta at 2025-10-03T12:03:53+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).



<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call_11</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">time</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-atom">top_call_11</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">ExecRes</span></span>)</span>.




top_call :-
    time(top_call_11).




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call_12</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">time</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-atom">top_call_12</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">ExecRes</span></span>)</span>.




top_call :-
    time(top_call_12).




( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">top_call_14</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-anon">_</span></span>)</span></span>) ).




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">time</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-atom">top_call_14</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">ExecRes</span></span>)</span>.




top_call :-
    time(top_call_14).




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call_15</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">time</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-atom">top_call_15</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">ExecRes</span></span>)</span>.




top_call :-
    time(top_call_15).


%  ; ;;types
%  ; (: emp-prob (-> Pattern SpaceType Number))
%  ; (: emp_prob_subsmp (-> Pattern SpaceType Number Number))
%  ; ; (: emp_prob_helper (-> Pattern SpaceType Number Number (List Number)))'
%  ;  (: emp_prob_helper (-> Pattern SpaceType Number Number Any))
%  ; (: emp_prob_bs (-> Pattern SpaceType Number Number Number))
%  ; (: emp-prob-pbs (-> Pattern SpaceType Number Number))
%  ; (: emp-prob-pbs (-> Pattern SpaceType Number Number Number))
%  ;;; File Dependency Documentation:
%  ;;;
%  ;;; Overview:
%  ;;; This document outlines the file dependencies required by this module.
%  ;;;
%  ;;; Dependencies:
%  ;;; 1. Main Module Registration:
%  ;;;    - Registers the core module from the '../../experiments' directory.
%  ;;;
%  ;;; 2. Imported Modules:
%  ;;;    - experiments:rules:emp-tv:
%  ;;;         Loads the empirical TV-related rules.
%  ;;;    - experiments:utils:common-utils:
%  ;;;         Provides common utility functions used across experiments.
%  ;;;    - experiments:utils:emp-tv-bs:
%  ;;;         Contains utilities specific to empirical TV batch operations.
%  ;;;    - experiments:utils:bs-utils:
%  ;;;         Supplies additional utilities for batch statistics.
%  ;; =============================================================================
%  ;; Function: emp-prob
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Computes the empirical probability of a pattern in a Corpus
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: Pattern to evaluate
%  ;;   - $db: Corpus to search
%  ;;
%  ;; Computation:
%  ;;   1. universe-count: Get total relevant items
%  ;;   2. sup-num: Get pattern occurrences(support)
%  ;;   3. Return (support / universe-count)
%  ;;
%  ;; Returns:
%  ;;   - Empirical probability as float
%  ;; =============================================================================
/*
  (= (emp-prob $pattern $db)  
    (let* 
      ( ($ucount (universe-count $pattern $db)) ($sup (sup-num $db $pattern))) 
      (// $sup $ucount)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern101</span>, <span class="pl-var">_db109</span>, <span class="pl-var">RetVal835</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73842126{vn = ..., cns = ...}</span>, <span class="pl-avar">_73842230{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73842154{vn = ..., cns = ...}</span>, <span class="pl-avar">_73842272{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73842230{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73842272{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'universe-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_73842340{$_ucount}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73842272{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73842230{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'sup-num'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_73842394{$_sup}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73842394{$_sup}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73842340{$_ucount}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_73842182{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: emp_prob_subsmp
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Computes empirical probability with optional subsampling
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: Pattern to evaluate
%  ;;   - $db: Corpus to search
%  ;;   - $subsize: Subsample size threshold
%  ;;
%  ;; Behavior:
%  ;;   - Uses subsample if $subsize < db_size
%  ;;   - Uses full db otherwise
%  ;;
%  ;; Returns:
%  ;;   - Empirical probability from appropriate sample
%  ;; =============================================================================
/*
  (= (emp_prob_subsmp $pattern $db $subsize)  
    (let* 
      ( ($interdb (db_size $db))) 
      (if 
        (< $subsize $interdb) 
        (let* 
          ( ($74190864 (println! "Using subsample")) 
            ($intvar (subsample-py $db $subsize)) 
            ($emp_rslt (emp-prob $pattern $intvar)) 
            ($74190976 (println! ("pattern" $pattern "empirical probability: " $emp_rslt)))) $emp_rslt) 
        (emp-prob $pattern $db))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">emp_prob_subsmp</span>, <span class="pl-var">_pattern105</span>, <span class="pl-var">_db113</span>, <span class="pl-var">_subsize29</span>, <span class="pl-var">RetVal839</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74194074{vn = ..., cns = ...}</span>, <span class="pl-avar">_74194206{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74194102{vn = ..., cns = ...}</span>, <span class="pl-avar">_74194248{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74194130{vn = ..., cns = ...}</span>, <span class="pl-avar">_74194290{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74194248{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_74194344{$_interdb}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74194290{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74194344{$_interdb}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     _74194410{$P1_CODE_427} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_427</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">E</span>, 
               [ <span class="pl-atom">'println!'</span>, 
                 <span class="pl-string">"Using subsample"</span>]], 
             [ <span class="pl-var">_intvar</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'subsample-py'</span>, <span class="pl-var">_db</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_emp_rslt</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">F</span>, 
               [ <span class="pl-atom">'println!'</span>, 
                 [ <span class="pl-string">"pattern"</span>,            <span class="pl-var">_pattern</span>, <span class="pl-string">"empirical probability: "</span>, <span class="pl-var">_emp_rslt</span>]]]], 
           <span class="pl-var">_emp_rslt</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-string">"Using subsample"</span>, <span class="pl-var">E</span></span>)</span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'subsample-py'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">_intvar</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_intvar</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">_emp_rslt</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_emp_rslt</span></span> , 
           <span class="pl-atom">u_assign</span>( <span class="pl-int">14</span>, 
             [ <span class="pl-string">"pattern"</span>, <span class="pl-var">K</span>, <span class="pl-string">"empirical probability: "</span>, <span class="pl-var">L</span>], 
             <span class="pl-var">M</span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">M</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_427</span><span class="pl-infix">=</span><span class="pl-var">_emp_rslt</span></span>)) , 
     _74194826{$P1_CODE_428} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_428</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P1_CODE_RESULT_428</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_74194410{$P1_CODE_427}</span>, <span class="pl-avar">_74194826{$P1_CODE_428}</span>, <span class="pl-avar">_74194158{vn = ..., cns = ...}</span></span>)</span></span>) ).




( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">top_call_16</span>:- <span class="pl-atom">do_metta_runtime</span>( <span class="pl-var">A</span>, 
                                                ( <span class="pl-compound pl-level-0"><span class="pl-var">B</span><span class="pl-infix">=</span><span class="pl-anon">_</span></span>  ,
                                                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'Inheritance'</span>, <span class="pl-var">B</span>, <span class="pl-atom">human</span>, <span class="pl-var">C</span></span>)</span> , 
                                                  <span class="pl-compound pl-level-0"><span class="pl-functor">get_value</span>(<span class="pl-args"><span class="pl-atom">'&amp;kb'</span>, <span class="pl-var">D</span></span>)</span> , 
                                                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">emp_prob_subsmp</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span>, <span class="pl-int">10</span>, <span class="pl-var">A</span></span>)</span>))</span>) ).




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">time</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-atom">top_call_16</span>:- <span class="pl-atom">do_metta_runtime</span><span class="pl-functor">( <span class="pl-var">ExecRes</span>, </span>
                                             ( <span class="pl-compound pl-level-0"><span class="pl-var">A</span><span class="pl-infix">=</span><span class="pl-anon">_</span></span>  ,
                                               <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'Inheritance'</span>, <span class="pl-var">A</span>, <span class="pl-atom">human</span>, <span class="pl-var">B</span></span>)</span> , 
                                               <span class="pl-compound pl-level-0"><span class="pl-functor">get_value</span>(<span class="pl-args"><span class="pl-atom">'&amp;kb'</span>, <span class="pl-var">C</span></span>)</span> , 
                                               <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">emp_prob_subsmp</span>, <span class="pl-var">B</span>, <span class="pl-var">C</span>, <span class="pl-int">10</span>, <span class="pl-var">ExecRes</span></span>)</span>)).




top_call :-
    time(top_call_16).


==>arg_type_n(==,2,1,var).
==>arg_type_n(==,2,2,var).
==>arg_type_n('size-atom',1,1,non_eval('Expression')).
==>arg_type_n('index-atom',2,1,non_eval('Expression')).
%  ; !(subsample-py &kb 10)
%  ; !(copy-db (new-space) ((Inheritance Human JOb) (Inheritance Nati Bonny)))
%  ; !(generet-random-subsample &kb 5)
%  ; !(random-element &kb)
%  ;; =============================================================================
%  ;; Function: emp_prob_helper
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Generates multiple empirical probability samples through recursion
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: Pattern to evaluate
%  ;;   - $db: Corpus to search
%  ;;   - $n_resample: Number of samples to generate
%  ;;   - $subsize: Subsample size
%  ;;
%  ;; Behavior:
%  ;;   - Recursively builds list of probability samples
%  ;;   - Base case: returns () when $n_resample=0
%  ;;
%  ;; Returns:
%  ;;   - List of probability values
%  ;; =============================================================================
/*
  (= (emp_prob_helper $pattern $db $n_resample $subsize)  
    (if 
      (== $n_resample 0) () 
      (let* 
        ( ($head_emp (emp_prob_subsmp $pattern $db $subsize)) ($tail_emp (emp_prob_helper $pattern $db (- $n_resample 1) $subsize))) 
        (cons-atom $head_emp $tail_emp))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">emp_prob_helper</span>, 
     <span class="pl-var">_pattern109</span>,  <span class="pl-var">_db117</span>, <span class="pl-var">_n_resample9</span>, <span class="pl-var">_subsize33</span>, <span class="pl-var">RetVal843</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82486404{vn = ..., cns = ...}</span>, <span class="pl-avar">_82486564{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82486432{vn = ..., cns = ...}</span>, <span class="pl-avar">_82486606{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82486460{vn = ..., cns = ...}</span>, <span class="pl-avar">_82486648{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82486488{vn = ..., cns = ...}</span>, <span class="pl-avar">_82486690{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_82486648{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _82486770{$P1_CODE_435} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_435</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_head_emp</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">emp_prob_subsmp</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_tail_emp</span>, 
               [ <span class="pl-atom">emp_prob_helper</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_n_resample</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 <span class="pl-var">_subsize</span>]]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_head_emp</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">emp_prob_subsmp</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">_head_emp</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_n_resample</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">H</span>, <span class="pl-int">1</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">emp_prob_helper</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">_tail_emp</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_head_emp</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_tail_emp</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_435</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_82486770{$P1_CODE_435}</span>, <span class="pl-avar">_82486516{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: emp_prob_bs
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Computes bootstrapped empirical probability
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: Pattern to evaluate
%  ;;   - $db: Corpus to search
%  ;;   - $n_resample: Bootstrap iterations
%  ;;   - $subsize: Subsample size
%  ;;
%  ;; Behavior:
%  ;;   - Uses emp_prob_helper for subsampling when $subsize < db_size
%  ;;   - Uses full db empirical probability otherwise
%  ;;
%  ;; Returns:
%  ;;   - Averaged probability estimate
%  ;; =============================================================================
/*
  (= (emp_prob_bs $pattern $db $n_resample $subsize)  
    (let* 
      ( ($interdb (db_size $db))) 
      (if 
        (< $subsize $interdb) 
        (let* 
          ( ($intervar (emp_prob_helper $pattern $db $n_resample $subsize))) 
          (avrg-tuple $intervar)) 
        (emp-prob $pattern $db))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">emp_prob_bs</span>, 
     <span class="pl-var">_pattern113</span>,  <span class="pl-var">_db121</span>, <span class="pl-var">_n_resample13</span>, <span class="pl-var">_subsize37</span>, <span class="pl-var">RetVal847</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83115786{vn = ..., cns = ...}</span>, <span class="pl-avar">_83115946{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83115814{vn = ..., cns = ...}</span>, <span class="pl-avar">_83115988{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83115842{vn = ..., cns = ...}</span>, <span class="pl-avar">_83116030{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83115870{vn = ..., cns = ...}</span>, <span class="pl-avar">_83116072{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83115988{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_83116126{$_interdb}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83116072{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83116126{$_interdb}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     _83116192{$P1_CODE_439} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_439</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_intervar</span>, 
               [ <span class="pl-atom">emp_prob_helper</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>, 
                 <span class="pl-var">_n_resample</span>, <span class="pl-var">_subsize</span>]]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'avrg-tuple'</span>, <span class="pl-var">_intervar</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_n_resample</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">emp_prob_helper</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">_intervar</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_intervar</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'avrg-tuple'</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_439</span></span>)</span>)) , 
     _83116426{$P1_CODE_440} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_440</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_440</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_83116192{$P1_CODE_439}</span>, <span class="pl-avar">_83116426{$P1_CODE_440}</span>, <span class="pl-avar">_83115898{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: emp-prob-pbs (Overload 1)
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Estimates probability with joint independent correction
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: Multi-conjunct pattern
%  ;;   - $db: Corpus to search
%  ;;   - $db_ratio: Probability adjustment factor
%  ;;
%  ;; Behavior:
%  ;;   - Uses ji_prob_est_interval for multi-conjunct patterns
%  ;;   - Falls back to emp-prob for single conjuncts
%  ;;
%  ;; Returns:
%  ;;   - Adjusted empirical probability
%  ;; =============================================================================
/*
  (= (emp-prob-pbs $pattern $db $db_ratio)  
    (if 
      (< 1 
        (n_conjuncts $pattern)) 
      (let 
        ($emin $emax) 
        (ji_prob_est_interval $pattern $db $db_ratio) 
        (emp-prob-pbs $pattern $db $emax $db_ratio)) 
      (emp-prob $pattern $db)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'emp-prob-pbs'</span>, <span class="pl-var">_pattern117</span>, <span class="pl-var">_db125</span>, <span class="pl-var">_db_ratio13</span>, <span class="pl-var">RetVal851</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83714352{vn = ..., cns = ...}</span>, <span class="pl-avar">_83714484{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83714380{vn = ..., cns = ...}</span>, <span class="pl-avar">_83714526{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83714408{vn = ..., cns = ...}</span>, <span class="pl-avar">_83714568{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83714484{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">n_conjuncts</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-int">1</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _83714650{$P1_CODE_447} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_447</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_emin</span>, <span class="pl-var">_emax</span></span>]</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">ji_prob_est_interval</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
           [ <span class="pl-atom">'emp-prob-pbs'</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>, <span class="pl-var">_emax</span>, 
             <span class="pl-var">_db_ratio</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_db_ratio</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">ji_prob_est_interval</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">G</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_emin</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_emax</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_db_ratio</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'emp-prob-pbs'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_447</span></span>)</span>)) , 
     _83714962{$P1_CODE_448} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_448</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">P1_CODE_RESULT_448</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_83714650{$P1_CODE_447}</span>, <span class="pl-avar">_83714962{$P1_CODE_448}</span>, <span class="pl-avar">_83714436{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: emp-prob-pbs (Overload 2)
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Computes probability with bootstrap sampling when needed
%  ;;
%  ;; Parameters:
%  ;;   - $pattern: Pattern to evaluate
%  ;;   - $db: Corpus to search
%  ;;   - $prob-estimate: Initial probability estimate 
%  ;;   - $db-ratio: Corpus scaling factor
%  ;;
%  ;; Computation Flow:
%  ;;   1. Convert prob-estimate to expected support
%  ;;   2. Compare scaled db_size with support estimate
%  ;;   3. Use bootstrap sampling if db_size < estimate
%  ;;   4. Use standard emp-prob otherwise
%  ;;
%  ;; Returns:
%  ;;   - Context-appropriate probability estimate
%  ;; =============================================================================
/*
  (= (emp-prob-pbs $pattern $db $prob_estimate $db_ratio)  
    (let* 
      ( ($support_estimate (prob_to_support $pattern $db $prob_estimate)) 
        ($db_size_unorm (db_size $db)) 
        ($db_size (* $db_size_unorm $db_ratio))) 
      (if 
        (< $db_size $support_estimate) 
        (let* 
          ( ($subsize (subsmp-size $pattern $db_size $support_estimate)) 
            (10 10) 
            ($emp_prob (emp_prob_bs $pattern $db 10 $subsize))) $emp_prob) 
        (let* 
          ( ($real_prob (emp-prob $pattern $db))) $real_prob))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'emp-prob-pbs'</span>, 
     <span class="pl-var">_pattern121</span>,  <span class="pl-var">_db129</span>, <span class="pl-var">_prob_estimate9</span>, <span class="pl-var">_db_ratio17</span>, <span class="pl-var">RetVal855</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_84361696{vn = ..., cns = ...}</span>, <span class="pl-avar">_84361856{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_84361724{vn = ..., cns = ...}</span>, <span class="pl-avar">_84361898{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_84361752{vn = ..., cns = ...}</span>, <span class="pl-avar">_84361940{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_84361780{vn = ..., cns = ...}</span>, <span class="pl-avar">_84361982{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_84361856{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_84361898{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_84361940{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">prob_to_support</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_84362064{$_support_estimate}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_84361898{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_84362104{$_db_size_unorm}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_84362104{$_db_size_unorm}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_84361982{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_84362158{$_db_size}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_84362158{$_db_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_84362064{$_support_estimate}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span></span>)</span> , 
     _84362224{$P1_CODE_455} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_455</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_subsize</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'subsmp-size'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-int">10</span>, <span class="pl-int">10</span></span>]</span>, 
             [ <span class="pl-var">_emp_prob</span>, 
               [ <span class="pl-atom">emp_prob_bs</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>, <span class="pl-int">10</span>, 
                 <span class="pl-var">_subsize</span>]]], 
           <span class="pl-var">_emp_prob</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_db_size</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_support_estimate</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'subsmp-size'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">_subsize</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-int">10</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">emp_prob_bs</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">_emp_prob</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_455</span><span class="pl-infix">=</span><span class="pl-var">_emp_prob</span></span>)) , 
     _84362554{$P1_CODE_456} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_456</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_real_prob</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           <span class="pl-var">_real_prob</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">Q</span>, <span class="pl-var">R</span>, <span class="pl-var">_real_prob</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_456</span><span class="pl-infix">=</span><span class="pl-var">_real_prob</span></span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-avar">_84362224{$P1_CODE_455}</span>, <span class="pl-avar">_84362554{$P1_CODE_456}</span>, <span class="pl-avar">_84361808{vn = ..., cns = ...}</span></span>)</span></span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/surprisingness/metta_log/emp-prob.metta at 2025-10-03T12:05:06+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
