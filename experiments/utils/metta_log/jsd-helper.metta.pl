%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/jsd-helper.metta at 2025-10-18T23:41:36+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

%  ;; Create Beta Distribution from TruthValue (mean, confidence)
%  ;; Equivalent to constructing boost::math::beta_distribution using mean and count.
/*
  (= (mk_distribution_jsd $tv)  
    (let* 
      ( ( ($_ $tv_mean $tv_conf) $tv) 
        ($count (confidence->count $tv_conf)) 
        ($pos_count (* $tv_mean $count)) 
        ($alpha (+ (prior-alpha) $pos_count)) 
        ($beta (+ (prior-beta) (- $count $pos_count)))) 
      (Beta $alpha $beta)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">mk_distribution_jsd</span>, <span class="pl-var">_tv13</span>, <span class="pl-var">RetVal823</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69477318{vn = ..., cns = ...}</span>, <span class="pl-avar">_69477394{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69477394{vn = ..., cns = ...}</span></span> , 
     <span class="pl-atom">unify_with_occurs_check</span>( <span class="pl-var">A</span>, [
       <span class="pl-anon">_</span>, <span class="pl-avar">_69477458{$_tv_mean}</span>, <span class="pl-avar">_69477478{$_tv_conf}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69477478{$_tv_conf}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'confidence-&gt;count'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_69477518{$_count}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69477458{$_tv_mean}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69477518{$_count}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_69477572{$_pos_count}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">mi</span>(<span class="pl-args"><span class="pl-atom">'prior-alpha'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69477572{$_pos_count}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_69477632{$_alpha}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">mi</span>(<span class="pl-args"><span class="pl-atom">'prior-beta'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69477518{$_count}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69477572{$_pos_count}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-avar">_69477720{$_beta}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69477632{$_alpha}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69477720{$_beta}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'Beta'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">11</span></span>)</span>, <span class="pl-avar">_69477346{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Main function: Compute Beta Distribution CDF sampled over N bins
%  ;; Returns list of CDF values over equally spaced x ∈ (0, 1])
/*
  (= (beta_cdf $beta_dist $bins)  
    (beta_cdf_loop $beta_dist $bins 0 ()))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">beta_cdf</span>, <span class="pl-var">_beta_dist1</span>, <span class="pl-var">_bins1</span>, <span class="pl-var">RetVal827</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69792768{vn = ..., cns = ...}</span>, <span class="pl-avar">_69792872{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69792796{vn = ..., cns = ...}</span>, <span class="pl-avar">_69792914{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69792872{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69792914{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">beta_cdf_loop</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-int">0</span>, [], <span class="pl-avar">_69792824{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Loop to simulate: for (x_idx = 0; x_idx < bins; x_idx++)
/*
  (= (beta_cdf_loop $beta_dist $bins $x_idx $cdf_list)  
    (if 
      (>= $x_idx $bins) 
      (reverse-list $cdf_list) 
      (let* 
        ( ($x (/ (+ $x_idx 1.0) $bins)) 
          ($x_clamped (min-atom (1.0 $x))) 
          ($r (boost_math_cdf $beta_dist $x_clamped)) 
          ($new_cdf_list (cons-atom $r $cdf_list)) 
          ($next_idx (+ $x_idx 1))) 
        (beta_cdf_loop $beta_dist $bins $next_idx $new_cdf_list))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">beta_cdf_loop</span>, 
     <span class="pl-var">_beta_dist5</span>, <span class="pl-var">_bins5</span>, <span class="pl-var">_x_idx1</span>, 
     <span class="pl-var">_cdf_list1</span>, <span class="pl-var">RetVal831</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70004258{vn = ..., cns = ...}</span>, <span class="pl-avar">_70004418{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70004286{vn = ..., cns = ...}</span>, <span class="pl-avar">_70004460{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70004314{vn = ..., cns = ...}</span>, <span class="pl-avar">_70004502{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70004342{vn = ..., cns = ...}</span>, <span class="pl-avar">_70004544{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70004502{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70004460{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;=</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _70004624{$P1_CODE_407} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_407</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'reverse-list'</span>, <span class="pl-var">_cdf_list</span></span>]</span>, 
         <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_cdf_list</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'reverse-list'</span>, <span class="pl-var">D</span>, <span class="pl-var">P1_CODE_RESULT_407</span></span>)</span></span>) , 
     _70004710{$P1_CODE_408} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_408</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_x</span>, 
               [ <span class="pl-atom">/</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">_x_idx</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 <span class="pl-var">_bins</span>]], 
             [ <span class="pl-var">_x_clamped</span>, 
               [ <span class="pl-atom">'min-atom'</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-float">1.0</span>, <span class="pl-var">_x</span></span>]</span>]], 
             [ <span class="pl-var">_r</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">boost_math_cdf</span>, <span class="pl-var">_beta_dist</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_new_cdf_list</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_r</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_next_idx</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">_x_idx</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">beta_cdf_loop</span>, <span class="pl-var">_beta_dist</span>, <span class="pl-var">_bins</span>, 
             <span class="pl-var">_next_idx</span>, <span class="pl-var">_new_cdf_list</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_x_idx</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">E</span>, <span class="pl-float">1.0</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_bins</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">/</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_x</span></span>)</span> , 
           <span class="pl-atom">eval_for1</span>( 
              <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
              <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'Expression'</span>, <span class="pl-atom">'Number'</span></span>]</span>, 
              <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-float">1.0</span>, <span class="pl-var">_x</span></span>]</span>, 
              <span class="pl-var">H</span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'min-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">_x_clamped</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_beta_dist</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_x_clamped</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">boost_math_cdf</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">_r</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_r</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_cdf_list</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">_new_cdf_list</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_x_idx</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">M</span>, <span class="pl-int">1</span>, <span class="pl-var">_next_idx</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_beta_dist</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_bins</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_next_idx</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_new_cdf_list</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">beta_cdf_loop</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">Q</span>, <span class="pl-var">P1_CODE_RESULT_408</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_70004624{$P1_CODE_407}</span>, <span class="pl-avar">_70004710{$P1_CODE_408}</span>, <span class="pl-avar">_70004370{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Adapter to extract (alpha, beta) from Beta distribution and evaluate CDF
/*
  (= (boost_math_cdf $beta_dist $x)  
    (let 
      (Beta $alpha $beta) $beta_dist 
      (boost-math-cdf $alpha $beta $x)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">boost_math_cdf</span>, <span class="pl-var">_beta_dist9</span>, <span class="pl-var">_x33</span>, <span class="pl-var">RetVal835</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70826476{vn = ..., cns = ...}</span>, <span class="pl-avar">_70826580{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70826504{vn = ..., cns = ...}</span>, <span class="pl-avar">_70826622{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70826580{vn = ..., cns = ...}</span></span> , 
     <span class="pl-atom">unify_with_occurs_check</span>( <span class="pl-var">A</span>, [
       <span class="pl-atom">'Beta'</span>, <span class="pl-avar">_70826686{$_alpha}</span>, <span class="pl-avar">_70826706{$_beta}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70826686{$_alpha}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70826706{$_beta}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_70826622{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'boost-math-cdf'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_70826532{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (boost-math-cdf $_ $_ $_)  0.232)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'boost-math-cdf'</span>, <span class="pl-var">_alpha13</span>, <span class="pl-var">_beta17</span>, <span class="pl-var">_x37</span>, <span class="pl-float">0.232</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70994026{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70994054{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_70994082{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span></span>) ).


%  ;; Compute KLD between two CDFs (assumes both lists are same size)
/*
  (= (kld $l_cdf $r_cdf)  
    (let* 
      ( (1.0e-32 1.0e-32) 
        (0 0) 
        (0.0 0.0) 
        (0.0 0.0) 
        (0.0 0.0) 
        ($l_size (size-atom $l_cdf)) 
        ($r_size (size-atom $r_cdf))) 
      (if 
        (== $l_size $r_size) 
        (kld_loop $l_cdf $r_cdf 1.0e-32 0 0.0 0.0 0.0) 
        (error "CDF lists must have the same size"))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">kld</span>, <span class="pl-var">_l_cdf1</span>, <span class="pl-var">_r_cdf1</span>, <span class="pl-var">RetVal843</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71217024{vn = ..., cns = ...}</span>, <span class="pl-avar">_71217128{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_71217052{vn = ..., cns = ...}</span>, <span class="pl-avar">_71217170{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71217128{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_71217254{$_l_size}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71217170{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_71217294{$_r_size}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71217254{$_l_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71217294{$_r_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     _71217360{$P1_CODE_415} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_415</span>, 
         [ <span class="pl-atom">kld_loop</span>, <span class="pl-var">_l_cdf</span>, <span class="pl-var">_r_cdf</span>, <span class="pl-float">1.0e-32</span>, <span class="pl-int">0</span>, 
           <span class="pl-float">0.0</span>, <span class="pl-float">0.0</span>, <span class="pl-float">0.0</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_l_cdf</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_r_cdf</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-float">1.0e-32</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-int">0</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-float">0.0</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-float">0.0</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-float">0.0</span></span> , 
           <span class="pl-atom">s</span>( <span class="pl-atom">kld_loop</span>, 
             <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, 
             <span class="pl-var">K</span>, <span class="pl-var">L</span>, 
             <span class="pl-var">P1_CODE_RESULT_415</span>))) , 
     _71217536{$P1_CODE_416} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_416</span>, 
         [ <span class="pl-atom">error</span>, 
           <span class="pl-string">"CDF lists must have the same size"</span>], 
         <span class="pl-compound pl-level-0"><span class="pl-atom">true</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">error</span>, <span class="pl-string">"CDF lists must have the same size"</span>, <span class="pl-var">P1_CODE_RESULT_416</span></span>)</span></span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_71217360{$P1_CODE_415}</span>, <span class="pl-avar">_71217536{$P1_CODE_416}</span>, <span class="pl-avar">_71217080{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Loop over pairs of CDF values to accumulate relative entropy
/*
  (= (kld_loop $l_cdf $r_cdf $epsilon $i $last_lv $last_rv $kldi)  
    (if 
      (== $l_cdf ()) $kldi 
      (let* 
        ( ($l_head (car-atom $l_cdf)) 
          ($r_head (car-atom $r_cdf)) 
          ($l_tail (cdr-atom $l_cdf)) 
          ($r_tail (cdr-atom $r_cdf)) 
          ($lp (- $l_head $last_lv)) 
          ($rp (- $r_head $last_rv)) 
          ($e (if (and (> $rp $epsilon) (> $lp $epsilon)) (* $lp (log2 (/ $lp $rp))) 0.0)) 
          ($new_kldi (+ $kldi $e)) 
          ($new_last_lv $l_head) 
          ($new_last_rv $r_head)) 
        (kld_loop $l_tail $r_tail $epsilon 
          (+ $i 1) $new_last_lv $new_last_rv $new_kldi))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">kld_loop</span>, 
     <span class="pl-var">_l_cdf5</span>, <span class="pl-var">_r_cdf5</span>, <span class="pl-var">_epsilon1</span>, <span class="pl-var">_i1</span>, 
        <span class="pl-var">_last_lv1</span>, <span class="pl-var">_last_rv1</span>, <span class="pl-var">_kldi1</span>, <span class="pl-var">RetVal847</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72175568{vn = ..., cns = ...}</span>, <span class="pl-avar">_72175812{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72175596{vn = ..., cns = ...}</span>, <span class="pl-avar">_72175854{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72175624{vn = ..., cns = ...}</span>, <span class="pl-avar">_72175896{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72175652{vn = ..., cns = ...}</span>, <span class="pl-avar">_72175938{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72175680{vn = ..., cns = ...}</span>, <span class="pl-avar">_72175980{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72175708{vn = ..., cns = ...}</span>, <span class="pl-avar">_72176022{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72175736{vn = ..., cns = ...}</span>, <span class="pl-avar">_72176064{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72175812{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72176064{vn = ..., cns = ...}</span></span> , 
     _72176150{$P1_CODE_423} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_423</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_l_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_l_cdf</span></span>]</span>], 
             [ <span class="pl-var">_r_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_r_cdf</span></span>]</span>], 
             [ <span class="pl-var">_l_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_l_cdf</span></span>]</span>], 
             [ <span class="pl-var">_r_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_cdf</span></span>]</span>], 
             [ <span class="pl-var">_lp</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_l_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_rp</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_r_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_e</span>, 
               [ <span class="pl-atom">if</span>, 
                 [ <span class="pl-atom">and</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-var">_rp</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-var">_lp</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                 [ <span class="pl-atom">*</span>, 
                   <span class="pl-var">_lp</span>, 
                   [ <span class="pl-atom">log2</span>, 
                     <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">/</span>, <span class="pl-var">_lp</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
                 <span class="pl-float">0.0</span>]], 
             [ <span class="pl-var">_new_kldi</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">_kldi</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_new_last_lv</span>, <span class="pl-var">_l_head</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_new_last_rv</span>, <span class="pl-var">_r_head</span></span>]</span>], 
           [ <span class="pl-atom">kld_loop</span>, <span class="pl-var">_l_tail</span>, <span class="pl-var">_r_tail</span>, 
             <span class="pl-var">_epsilon</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">_i</span>|<span class="pl-ellipsis">...</span></span>]</span>,      <span class="pl-var">_new_last_lv</span>, <span class="pl-var">_new_last_rv</span>, <span class="pl-var">_new_kldi</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_l_cdf</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_l_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_r_cdf</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">_r_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_l_cdf</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">F</span>, <span class="pl-var">_l_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_r_cdf</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">_r_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_l_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_last_lv</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">_lp</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_r_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_last_rv</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">_rp</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_rp</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_epsilon</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_lp</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_epsilon</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">N</span></span>)</span> , 
           <span class="pl-var">P1_CODE_424</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Number'</span>, <span class="pl-var">P1_CODE_RESULT_424</span>, 
                [ <span class="pl-atom">*</span>, 
                  <span class="pl-var">_lp</span>, 
                  [ <span class="pl-atom">log2</span>, 
                    <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">/</span>, <span class="pl-var">_lp</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_lp</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_lp</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">S</span><span class="pl-infix">=</span><span class="pl-var">_rp</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">/</span>, <span class="pl-var">R</span>, <span class="pl-var">S</span>, <span class="pl-var">T</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">log2</span>, <span class="pl-var">T</span>, <span class="pl-var">U</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">*</span>, <span class="pl-var">Q</span>, <span class="pl-var">U</span>, <span class="pl-var">P1_CODE_RESULT_424</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">N</span>, <span class="pl-var">P1_CODE_424</span>, <span class="pl-float">0.0</span>, <span class="pl-var">_e</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">V</span><span class="pl-infix">=</span><span class="pl-var">_kldi</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">W</span><span class="pl-infix">=</span><span class="pl-var">_e</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">V</span>, <span class="pl-var">W</span>, <span class="pl-var">_new_kldi</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">_new_last_lv</span><span class="pl-infix">=</span><span class="pl-var">_l_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">_new_last_rv</span><span class="pl-infix">=</span><span class="pl-var">_r_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">X</span><span class="pl-infix">=</span><span class="pl-var">_l_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Y</span><span class="pl-infix">=</span><span class="pl-var">_r_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Z</span><span class="pl-infix">=</span><span class="pl-var">_epsilon</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">A1</span><span class="pl-infix">=</span><span class="pl-var">_i</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">A1</span>, <span class="pl-int">1</span>, <span class="pl-var">B1</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">C1</span><span class="pl-infix">=</span><span class="pl-var">_new_last_lv</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D1</span><span class="pl-infix">=</span><span class="pl-var">_new_last_rv</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E1</span><span class="pl-infix">=</span><span class="pl-var">_new_kldi</span></span> , 
           <span class="pl-atom">me</span>( <span class="pl-atom">kld_loop</span>, 
             <span class="pl-var">X</span>, <span class="pl-var">Y</span>, <span class="pl-var">Z</span>, <span class="pl-var">B1</span>, 
             <span class="pl-var">C1</span>, <span class="pl-var">D1</span>, <span class="pl-var">E1</span>, 
             <span class="pl-var">P1_CODE_RESULT_423</span>))) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_72176150{$P1_CODE_423}</span>, <span class="pl-avar">_72175764{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Compute log2 for base-2 logarithm
/*
  (= (log2 $x)  
    (log-math 2 $x))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">log2</span>, <span class="pl-var">_x41</span>, <span class="pl-var">RetVal851</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73764158{vn = ..., cns = ...}</span>, <span class="pl-avar">_73764234{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73764234{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'log-math'</span>, <span class="pl-int">2</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_73764186{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Compute element-wise average of two CDF lists
/*
  (= (avrg_cdf $l_cdf $r_cdf)  
    (avrg_cdf_loop $l_cdf $r_cdf ()))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">avrg_cdf</span>, <span class="pl-var">_l_cdf9</span>, <span class="pl-var">_r_cdf9</span>, <span class="pl-var">RetVal855</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73873460{vn = ..., cns = ...}</span>, <span class="pl-avar">_73873564{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_73873488{vn = ..., cns = ...}</span>, <span class="pl-avar">_73873606{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73873564{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_73873606{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">avrg_cdf_loop</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_73873516{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (avrg_cdf_loop $l_cdf $r_cdf $result)  
    (if 
      (== $l_cdf ()) 
      (reverse-list $result) 
      (let* 
        ( ($l_head (car-atom $l_cdf)) 
          ($r_head (car-atom $r_cdf)) 
          ($l_tail (cdr-atom $l_cdf)) 
          ($r_tail (cdr-atom $r_cdf)) 
          ($avg_val (/ (+ $l_head $r_head) 2.0)) 
          ($new_result (cons-atom $avg_val $result))) 
        (avrg_cdf_loop $l_tail $r_tail $new_result))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">avrg_cdf_loop</span>, <span class="pl-var">_l_cdf13</span>, <span class="pl-var">_r_cdf13</span>, <span class="pl-var">_result1</span>, <span class="pl-var">RetVal859</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74098628{vn = ..., cns = ...}</span>, <span class="pl-avar">_74098760{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74098656{vn = ..., cns = ...}</span>, <span class="pl-avar">_74098802{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74098684{vn = ..., cns = ...}</span>, <span class="pl-avar">_74098844{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74098760{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _74098918{$P1_CODE_431} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_431</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'reverse-list'</span>, <span class="pl-var">_result</span></span>]</span>, 
         <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_result</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'reverse-list'</span>, <span class="pl-var">C</span>, <span class="pl-var">P1_CODE_RESULT_431</span></span>)</span></span>) , 
     _74099004{$P1_CODE_432} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_432</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_l_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_l_cdf</span></span>]</span>], 
             [ <span class="pl-var">_r_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_r_cdf</span></span>]</span>], 
             [ <span class="pl-var">_l_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_l_cdf</span></span>]</span>], 
             [ <span class="pl-var">_r_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_cdf</span></span>]</span>], 
             [ <span class="pl-var">_avg_val</span>, 
               [ <span class="pl-atom">/</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">_l_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 <span class="pl-float">2.0</span>]], 
             [ <span class="pl-var">_new_result</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_avg_val</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">avrg_cdf_loop</span>, <span class="pl-var">_l_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_l_cdf</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_l_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_r_cdf</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">_r_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_l_cdf</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">F</span>, <span class="pl-var">_l_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_r_cdf</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">_r_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_l_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_r_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">/</span>, <span class="pl-var">J</span>, <span class="pl-float">2.0</span>, <span class="pl-var">_avg_val</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_avg_val</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_result</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">_new_result</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_l_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_r_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_new_result</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">avrg_cdf_loop</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P1_CODE_RESULT_432</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_74098918{$P1_CODE_431}</span>, <span class="pl-avar">_74099004{$P1_CODE_432}</span>, <span class="pl-avar">_74098712{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Compute average of two numbers
/*
  (= (avrg $a $b)  
    (/ 
      (+ $a $b) 2.0))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">avrg</span>, <span class="pl-var">_a9</span>, <span class="pl-var">_b9</span>, <span class="pl-var">RetVal863</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74871088{vn = ..., cns = ...}</span>, <span class="pl-avar">_74871192{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74871116{vn = ..., cns = ...}</span>, <span class="pl-avar">_74871234{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74871192{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74871234{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">/</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-float">2.0</span>, <span class="pl-avar">_74871144{vn = ..., cns = ...}</span></span>)</span></span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/jsd-helper.metta at 2025-10-18T23:41:45+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
