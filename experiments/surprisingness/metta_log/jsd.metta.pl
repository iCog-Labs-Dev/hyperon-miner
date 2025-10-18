%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/surprisingness/metta_log/jsd.metta at 2025-10-18T23:41:45+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

%  ;types
%  ; (: do-jsd (-> TruthValue TruthValue Number))
%  ;; =============================================================================
%  ;; Function: do-jsd
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Computes a modified Jensen-Shannon Divergence (JSD) between two probability 
%  ;;   distributions. This is a symmetric measure of similarity between distributions 
%  ;;   with custom logarithmic scaling.
%  ;;
%  ;; Parameters:
%  ;;   - $empirical_distribution: Observed distribution (TruthValue type)
%  ;;   - $estimated_distribution: Predicted distribution (TruthValue type)
%  ;;
%  ;; Internal Computation:
%  ;;   1. Extract strength components from both distributions
%  ;;   2. Calculate midpoint distribution average
%  ;;   3. Compute logarithmic ratios (base 10):
%  ;;      a. log(empirical/midpoint)
%  ;;      b. log(estimated/midpoint)
%  ;;   4. Calculate entropy contributions:
%  ;;      a. (empirical_strength * log_ratio_empirical) / 2
%  ;;      b. (estimated_strength * log_ratio_estimated) / 2
%  ;;   5. Sum contributions and take square root
%  ;;
%  ;; Returns:
%  ;;   - Non-negative float representing distribution divergence
%  ;; =============================================================================
%  ;; Jensen-Shannon Divergence (JSD) function
%  ;; Converts C++ jsd function to MeTTa
/*
  (= (do-jsd $l_tv $r_tv)  
    (let* 
      ( (() (println! "=========== JSD SURP ==========")) 
        (10 10) 
        ($l_bd (mk_distribution_jsd $l_tv)) 
        ($r_bd (mk_distribution_jsd $r_tv)) 
        ($l_cdf (beta_cdf $l_bd 10)) 
        ($r_cdf (beta_cdf $r_bd 10)) 
        ($m_cdf (avrg_cdf $l_cdf $r_cdf)) 
        ($ld (kld $l_cdf $m_cdf)) 
        ($rd (kld $r_cdf $m_cdf)) 
        ($avg (avrg $ld $rd))) 
      (sqrt-math $avg)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'do-jsd'</span>, <span class="pl-var">_l_tv1</span>, <span class="pl-var">_r_tv1</span>, <span class="pl-var">RetVal867</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_75204890{vn = ..., cns = ...}</span>, <span class="pl-avar">_75204994{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_75204918{vn = ..., cns = ...}</span>, <span class="pl-avar">_75205036{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-string">"=========== JSD SURP =========="</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75204994{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">mk_distribution_jsd</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_75205126{$_l_bd}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205036{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">mk_distribution_jsd</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_75205166{$_r_bd}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205126{$_l_bd}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-int">10</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">beta_cdf</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_75205220{$_l_cdf}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205166{$_r_bd}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-int">10</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">beta_cdf</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_75205274{$_r_cdf}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205220{$_l_cdf}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205274{$_r_cdf}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">avrg_cdf</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-avar">_75205328{$_m_cdf}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205220{$_l_cdf}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205328{$_m_cdf}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">kld</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-avar">_75205382{$_ld}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205274{$_r_cdf}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">12</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205328{$_m_cdf}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">kld</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">12</span></span>)</span>, <span class="pl-avar">_75205436{$_rd}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205382{$_ld}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">14</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205436{$_rd}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">avrg</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">14</span></span>)</span>, <span class="pl-avar">_75205490{$_avg}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">15</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75205490{$_avg}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'sqrt-math'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">15</span></span>)</span>, <span class="pl-avar">_75204946{vn = ..., cns = ...}</span></span>)</span></span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/surprisingness/metta_log/jsd.metta at 2025-10-18T23:41:46+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
