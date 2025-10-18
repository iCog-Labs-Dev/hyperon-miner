%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/surprisingness/metta_log/emp-prob.metta at 2025-10-18T23:17:27+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern157</span>, <span class="pl-var">_db153</span>, <span class="pl-var">RetVal1271</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_123064522{vn = ..., cns = ...}</span>, <span class="pl-avar">_123064626{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_123064550{vn = ..., cns = ...}</span>, <span class="pl-avar">_123064668{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_123064626{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_123064668{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'universe-count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_123064736{$_ucount}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_123064668{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_123064626{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'sup-num'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_123064790{$_sup}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_123064790{$_sup}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_123064736{$_ucount}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">//</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_123064578{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
          ( ($123331794 (println! "Using subsample")) 
            ($intvar (subsample-py $db $subsize)) 
            ($emp_rslt (emp-prob $pattern $intvar)) 
            ($123331906 (println! ("pattern" $pattern "empirical probability: " $emp_rslt)))) $emp_rslt) 
        (emp-prob $pattern $db))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">emp_prob_subsmp</span>, 
     <span class="pl-var">_pattern161</span>, <span class="pl-var">_db157</span>, <span class="pl-var">_subsize29</span>, 
     <span class="pl-var">RetVal1275</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_123335004{vn = ..., cns = ...}</span>, <span class="pl-avar">_123335136{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_123335032{vn = ..., cns = ...}</span>, <span class="pl-avar">_123335178{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_123335060{vn = ..., cns = ...}</span>, <span class="pl-avar">_123335220{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_123335178{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_123335274{$_interdb}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_123335220{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_123335274{$_interdb}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     _123335340{$P1_CODE_807} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_807</span>, 
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
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_807</span><span class="pl-infix">=</span><span class="pl-var">_emp_rslt</span></span>)) , 
     _123335756{$P1_CODE_808} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_808</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P1_CODE_RESULT_808</span></span>)</span>)) , 
     <span class="pl-atom">s</span>( <span class="pl-atom">if</span>, 
       <span class="pl-var">D</span>, <span class="pl-avar">_123335340{$P1_CODE_807}</span>, <span class="pl-avar">_123335756{$P1_CODE_808}</span>, 
       _123335088{vn = ..., cns = ...})</span>) ).


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
     <span class="pl-var">_pattern165</span>,  <span class="pl-var">_db161</span>, <span class="pl-var">_n_resample9</span>, <span class="pl-var">_subsize33</span>, <span class="pl-var">RetVal1279</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_124123600{vn = ..., cns = ...}</span>, <span class="pl-avar">_124123760{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_124123628{vn = ..., cns = ...}</span>, <span class="pl-avar">_124123802{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_124123656{vn = ..., cns = ...}</span>, <span class="pl-avar">_124123844{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_124123684{vn = ..., cns = ...}</span>, <span class="pl-avar">_124123886{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_124123844{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _124123966{$P1_CODE_815} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_815</span>, 
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
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_815</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_124123966{$P1_CODE_815}</span>, <span class="pl-avar">_124123712{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
     <span class="pl-var">_pattern169</span>,  <span class="pl-var">_db165</span>, <span class="pl-var">_n_resample13</span>, <span class="pl-var">_subsize37</span>, <span class="pl-var">RetVal1283</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_124711174{vn = ..., cns = ...}</span>, <span class="pl-avar">_124711334{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_124711202{vn = ..., cns = ...}</span>, <span class="pl-avar">_124711376{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_124711230{vn = ..., cns = ...}</span>, <span class="pl-avar">_124711418{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_124711258{vn = ..., cns = ...}</span>, <span class="pl-avar">_124711460{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_124711376{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_124711514{$_interdb}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_124711460{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_124711514{$_interdb}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     _124711580{$P1_CODE_819} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_819</span>, 
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
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'avrg-tuple'</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_819</span></span>)</span>)) , 
     _124711814{$P1_CODE_820} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_820</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_820</span></span>)</span>)) , 
     <span class="pl-atom">s</span>( <span class="pl-atom">if</span>, 
       <span class="pl-var">D</span>, <span class="pl-avar">_124711580{$P1_CODE_819}</span>, <span class="pl-avar">_124711814{$P1_CODE_820}</span>, 
       _124711286{vn = ..., cns = ...})</span>) ).


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
   <span class="pl-atom">mc</span>( <span class="pl-atom">'emp-prob-pbs'</span>, 
     <span class="pl-var">_pattern173</span>,  <span class="pl-var">_db169</span>, <span class="pl-var">_db_ratio13</span>, <span class="pl-var">RetVal1287</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_125300796{vn = ..., cns = ...}</span>, <span class="pl-avar">_125300928{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_125300824{vn = ..., cns = ...}</span>, <span class="pl-avar">_125300970{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_125300852{vn = ..., cns = ...}</span>, <span class="pl-avar">_125301012{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_125300928{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">n_conjuncts</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-int">1</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _125301094{$P1_CODE_827} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_827</span>, 
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
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'emp-prob-pbs'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_827</span></span>)</span>)) , 
     _125301406{$P1_CODE_828} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_828</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">P1_CODE_RESULT_828</span></span>)</span>)) , 
     <span class="pl-atom">s</span>( <span class="pl-atom">if</span>, 
       <span class="pl-var">C</span>, <span class="pl-avar">_125301094{$P1_CODE_827}</span>, <span class="pl-avar">_125301406{$P1_CODE_828}</span>, 
       _125300880{vn = ..., cns = ...})</span>) ).


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
        (() (println! (prob to support is $support_estimate))) 
        ($db_size_unorm (db_size $db)) 
        (() (println! (db isze is $db_size_unorm))) 
        ($db_size (* $db_size_unorm $db_ratio)) 
        (() (println! (db-size with db ratio is $db_size)))) 
      (if 
        (< $db_size $support_estimate) 
        (let* 
          ( (() (println! ("herrrrrrrrrrrrrrr1111111111" ',pattern' $pattern db-size $db_size and support $support_estimate))) 
            ($subsize (subsmp-size $pattern $db_size $support_estimate)) 
            (() (println! (subsmp-size--- $subsize))) 
            (10 10) 
            ($emp_prob (emp_prob_bs $pattern $db 10 $subsize)) 
            (() (println! (emp prob bs is $emp_prob)))) $emp_prob) 
        (let* 
          ( (() (println! "herrrrrrrrrrrrrrr")) 
            ($real_prob (emp-prob $pattern $db)) 
            (() (println! (emp prob is $real_prob)))) $real_prob))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'emp-prob-pbs'</span>, 
     <span class="pl-var">_pattern177</span>,  <span class="pl-var">_db173</span>, <span class="pl-var">_prob_estimate9</span>, <span class="pl-var">_db_ratio17</span>, <span class="pl-var">RetVal1291</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_126017536{vn = ..., cns = ...}</span>, <span class="pl-avar">_126017696{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_126017564{vn = ..., cns = ...}</span>, <span class="pl-avar">_126017738{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_126017592{vn = ..., cns = ...}</span>, <span class="pl-avar">_126017780{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_126017620{vn = ..., cns = ...}</span>, <span class="pl-avar">_126017822{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126017696{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126017738{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126017780{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">prob_to_support</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_126017904{$_support_estimate}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126017904{$_support_estimate}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">prob</span>, <span class="pl-atom">to</span>, <span class="pl-atom">support</span>, <span class="pl-atom">is</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126017738{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">db_size</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_126018000{$_db_size_unorm}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126018000{$_db_size_unorm}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">db</span>, <span class="pl-atom">isze</span>, <span class="pl-atom">is</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126018000{$_db_size_unorm}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126017822{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span>, <span class="pl-avar">_126018108{$_db_size}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">12</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126018108{$_db_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'db-size'</span>, <span class="pl-atom">with</span>, <span class="pl-atom">db</span>, <span class="pl-atom">ratio</span>, <span class="pl-atom">is</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">12</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">14</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">14</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">15</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126018108{$_db_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">16</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_126017904{$_support_estimate}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">15</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">16</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">17</span></span>)</span></span>)</span> , 
     _126018232{$P1_CODE_835} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_835</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [], 
               [ <span class="pl-atom">'println!'</span>, 
                 [ <span class="pl-string">"herrrrrrrrrrrrrrr1111111111"</span>, <span class="pl-atom">',pattern'</span>, <span class="pl-var">_pattern</span>, <span class="pl-atom">'db-size'</span>, 
                   <span class="pl-var">_db_size</span>, <span class="pl-atom">and</span>, <span class="pl-atom">support</span>, 
                   <span class="pl-var">_support_estimate</span>]]], 
             [ <span class="pl-var">_subsize</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'subsmp-size'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ [], 
               [ <span class="pl-atom">'println!'</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'subsmp-size---'</span>, <span class="pl-var">_subsize</span></span>]</span>]], 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-int">10</span>, <span class="pl-int">10</span></span>]</span>, 
             [ <span class="pl-var">_emp_prob</span>, 
               [ <span class="pl-atom">emp_prob_bs</span>, <span class="pl-var">_pattern</span>, <span class="pl-var">_db</span>, <span class="pl-int">10</span>, 
                 <span class="pl-var">_subsize</span>]], 
             [ [], 
               [ <span class="pl-atom">'println!'</span>, 
                 [ <span class="pl-atom">emp</span>, <span class="pl-atom">prob</span>, <span class="pl-atom">bs</span>, <span class="pl-atom">is</span>, <span class="pl-var">_emp_prob</span>]]]], 
           <span class="pl-var">_emp_prob</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">S</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_db_size</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">U</span><span class="pl-infix">=</span><span class="pl-var">_support_estimate</span></span> , 
           <span class="pl-atom">u_assign</span>( <span class="pl-int">14</span>, 
             [ <span class="pl-string">"herrrrrrrrrrrrrrr1111111111"</span>, <span class="pl-atom">',pattern'</span>, <span class="pl-var">S</span>, <span class="pl-atom">'db-size'</span>, 
               <span class="pl-var">T</span>, <span class="pl-atom">and</span>, <span class="pl-atom">support</span>, <span class="pl-var">U</span>], 
             <span class="pl-var">V</span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">V</span>, <span class="pl-var">W</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">W</span>, []</span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">X</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Y</span><span class="pl-infix">=</span><span class="pl-var">_db_size</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Z</span><span class="pl-infix">=</span><span class="pl-var">_support_estimate</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'subsmp-size'</span>, <span class="pl-var">X</span>, <span class="pl-var">Y</span>, <span class="pl-var">Z</span>, <span class="pl-var">_subsize</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">A1</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'subsmp-size---'</span>, <span class="pl-var">A1</span>, <span class="pl-var">B1</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">B1</span>, <span class="pl-var">C1</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">C1</span>, []</span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D1</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E1</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F1</span><span class="pl-infix">=</span><span class="pl-int">10</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G1</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">emp_prob_bs</span>, <span class="pl-var">D1</span>, <span class="pl-var">E1</span>, <span class="pl-var">F1</span>, <span class="pl-var">G1</span>, <span class="pl-var">_emp_prob</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H1</span><span class="pl-infix">=</span><span class="pl-var">_emp_prob</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">emp</span>, <span class="pl-atom">prob</span>, <span class="pl-atom">bs</span>, <span class="pl-atom">is</span>, <span class="pl-var">H1</span>, <span class="pl-var">I1</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">I1</span>, <span class="pl-var">J1</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">J1</span>, []</span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_835</span><span class="pl-infix">=</span><span class="pl-var">_emp_prob</span></span>)) , 
     _126018970{$P1_CODE_836} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_836</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [ [ [ [ 
               [], 
               [ <span class="pl-atom">'println!'</span>, 
                 <span class="pl-string">"herrrrrrrrrrrrrrr"</span>]], 
             [ <span class="pl-var">_real_prob</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">_pattern</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ [], 
               [ <span class="pl-atom">'println!'</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">emp</span>, <span class="pl-atom">prob</span>|<span class="pl-ellipsis">...</span></span>]</span>]]], 
           <span class="pl-var">_real_prob</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-string">"herrrrrrrrrrrrrrr"</span>, <span class="pl-var">K1</span></span>)</span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">K1</span>, []</span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L1</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M1</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'emp-prob'</span>, <span class="pl-var">L1</span>, <span class="pl-var">M1</span>, <span class="pl-var">_real_prob</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N1</span><span class="pl-infix">=</span><span class="pl-var">_real_prob</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">emp</span>, <span class="pl-atom">prob</span>, <span class="pl-atom">is</span>, <span class="pl-var">N1</span>, <span class="pl-var">O1</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">O1</span>, <span class="pl-var">P1</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">P1</span>, []</span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_836</span><span class="pl-infix">=</span><span class="pl-var">_real_prob</span></span>)) , 
     <span class="pl-atom">s</span>( <span class="pl-atom">if</span>, 
       <span class="pl-var">R</span>, <span class="pl-avar">_126018232{$P1_CODE_835}</span>, <span class="pl-avar">_126018970{$P1_CODE_836}</span>, 
       _126017648{vn = ..., cns = ...})</span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/surprisingness/metta_log/emp-prob.metta at 2025-10-18T23:17:36+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
