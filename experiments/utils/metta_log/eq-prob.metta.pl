%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/eq-prob.metta at 2025-10-16T14:07:19+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

/*
  (= (connected-subpatterns-with-var $partition $var)  
    (filter-blocks-with-var $partition $var ()))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'connected-subpatterns-with-var'</span>, <span class="pl-var">_partition1</span>, <span class="pl-var">_var77</span>, <span class="pl-var">RetVal903</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_81791434{vn = ..., cns = ...}</span>, <span class="pl-avar">_81791538{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_81791462{vn = ..., cns = ...}</span>, <span class="pl-avar">_81791580{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_81791538{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_81791580{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'filter-blocks-with-var'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_81791490{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Helper function to filter blocks recursively
/*
  (= (filter-blocks-with-var $partition $var $acc)  
    (if 
      (== $partition ()) $acc 
      (let* 
        ( ($current_block (car-atom $partition)) 
          ($remaining_blocks (cdr-atom $partition)) 
          ($connected_sub (connected-subpattern-with-var $current_block $var))) 
        (if 
          (== $connected_sub ()) 
          (filter-blocks-with-var $remaining_blocks $var $acc) 
          (let $new_acc 
            (union-atom $acc 
              ($connected_sub)) 
            (filter-blocks-with-var $remaining_blocks $var $new_acc))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'filter-blocks-with-var'</span>, 
     <span class="pl-var">_partition5</span>, <span class="pl-var">_var81</span>, <span class="pl-var">_acc13</span>, <span class="pl-var">RetVal907</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82003408{vn = ..., cns = ...}</span>, <span class="pl-avar">_82003540{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82003436{vn = ..., cns = ...}</span>, <span class="pl-avar">_82003582{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82003464{vn = ..., cns = ...}</span>, <span class="pl-avar">_82003624{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_82003540{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_82003624{vn = ..., cns = ...}</span></span> , 
     _82003710{$P1_CODE_563} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd563</span>, <span class="pl-var">P1_CODE_RESULT_563</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_current_block</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_partition</span></span>]</span>], 
             [ <span class="pl-var">_remaining_blocks</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_partition</span></span>]</span>], 
             [ <span class="pl-var">_connected_sub</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'connected-subpattern-with-var'</span>, <span class="pl-var">_current_block</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_connected_sub</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'filter-blocks-with-var'</span>, <span class="pl-var">_remaining_blocks</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             [ <span class="pl-atom">let</span>, 
               <span class="pl-var">_new_acc</span>, 
               [ <span class="pl-atom">'union-atom'</span>, 
                 <span class="pl-var">_acc</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_connected_sub</span></span>]</span>], 
               [ <span class="pl-atom">'filter-blocks-with-var'</span>, <span class="pl-var">_remaining_blocks</span>, <span class="pl-var">_var</span>, 
                 <span class="pl-var">_new_acc</span>]]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_current_block</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">_remaining_blocks</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_current_block</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'connected-subpattern-with-var'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_connected_sub</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_connected_sub</span></span> , 
           <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">H</span>, [], <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-var">P1_CODE_564</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd563</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_564</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'filter-blocks-with-var'</span>, <span class="pl-var">_remaining_blocks</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_remaining_blocks</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'filter-blocks-with-var'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_564</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_565</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd563</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_565</span>, 
                [ <span class="pl-atom">let</span>, 
                  <span class="pl-var">_new_acc</span>, 
                  [ <span class="pl-atom">'union-atom'</span>, 
                    <span class="pl-var">_acc</span>, 
                    <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_connected_sub</span></span>]</span>], 
                  [ <span class="pl-atom">'filter-blocks-with-var'</span>, <span class="pl-var">_remaining_blocks</span>, <span class="pl-var">_var</span>, 
                    <span class="pl-var">_new_acc</span>]], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">M</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_connected_sub</span></span>]</span>, <span class="pl-var">_new_acc</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_remaining_blocks</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_new_acc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'filter-blocks-with-var'</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">P1_CODE_RESULT_565</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_564</span>, <span class="pl-var">P1_CODE_565</span>, <span class="pl-var">P1_CODE_RESULT_563</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_82003710{$P1_CODE_563}</span>, <span class="pl-avar">_82003492{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (connected-subpattern-with-var $block $var)  
    (if 
      (not (is-var-exist $block $var)) () $block))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'connected-subpattern-with-var'</span>, <span class="pl-var">_block1</span>, <span class="pl-var">_var85</span>, <span class="pl-var">RetVal911</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82925466{vn = ..., cns = ...}</span>, <span class="pl-avar">_82925570{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82925494{vn = ..., cns = ...}</span>, <span class="pl-avar">_82925612{vn = ..., cns = ...}</span></span>)</span> , 
     ( <span class="pl-atom">\+</span> ( 
        eval_true( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">A</span><span class="pl-infix">=</span><span class="pl-var">_block</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span></span>)) ) , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_82925570{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_82925522{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (extract $exp $var)  
    (if 
      (var-exist-exp $exp $var) $exp 
      (empty)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">extract</span>, <span class="pl-var">_exp21</span>, <span class="pl-var">_var89</span>, <span class="pl-var">RetVal915</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83094332{vn = ..., cns = ...}</span>, <span class="pl-avar">_83094436{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83094360{vn = ..., cns = ...}</span>, <span class="pl-avar">_83094478{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83094436{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83094478{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'var-exist-exp'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83094436{vn = ..., cns = ...}</span></span> , 
     _83094570{$P1_CODE_575} =  
          
       <span class="pl-compound pl-level-0"><span class="pl-functor">as_p1</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-anon">_</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">empty</span></span>]</span>, <span class="pl-atom">fail</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_83094570{$P1_CODE_575}</span>, <span class="pl-avar">_83094388{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (find-component-with-var $MeTTa_SP__components_1 $var)  
    (collapse (extract (superpose $MeTTa_SP__components_1) $var)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'find-component-with-var'</span>, <span class="pl-var">_components1</span>, <span class="pl-var">_var93</span>, <span class="pl-var">RetVal919</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83270446{vn = ..., cns = ...}</span>, <span class="pl-avar">_83270550{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83270474{vn = ..., cns = ...}</span>, <span class="pl-avar">_83270592{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       ( <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__components_1</span>, <span class="pl-var">B</span></span>)</span>  ,
         <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
         <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">extract</span>, <span class="pl-var">B</span>, <span class="pl-var">C</span>, <span class="pl-var">A</span></span>)</span>), 
       _83270502{vn = ..., cns = ...})</span>) ).


%  ;; =============================================================================
%  ;; Function: sort-by-abstraction
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Sorts a list of patterns based on abstraction level using is-blk-more-abstract
%  ;;   More abstract patterns come first in the sorted result
%  ;;
%  ;; Type Signature:
%  ;;   (-> Expression Expression Expression)
%  ;;
%  ;; Parameters:
%  ;;   $patterns - List of patterns to sort
%  ;;   $var - Variable to use for abstraction comparison
%  ;;
%  ;; Returns:
%  ;;   Sorted list where more abstract patterns appear first
%  ;;
%  ;; Example:
%  ;;   (sort-by-abstraction '(pattern1 pattern2 pattern3) $x)
%  ;; =============================================================================
%  ; (: sort-by-abstraction (-> Expression Expression Expression))
/*
  (= (sort-by-abstraction $patterns $var)  
    (if 
      (== $patterns ()) () 
      (if 
        (== 
          (cdr-atom $patterns) ()) $patterns 
        (let* 
          ( ($pivot (car-atom $patterns)) 
            ($rest (cdr-atom $patterns)) 
            ($more_abstract (filter-more-abstract $rest $pivot $var)) 
            ($less_abstract (filter-less-abstract $rest $pivot $var)) 
            ($sorted_less (sort-by-abstraction $less_abstract $var)) 
            ($sorted_more (sort-by-abstraction $more_abstract $var)) 
            ($with_pivot (cons-atom $pivot $sorted_less))) 
          (concat-atom $sorted_more $with_pivot)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'sort-by-abstraction'</span>, <span class="pl-var">_patterns1</span>, <span class="pl-var">_var97</span>, <span class="pl-var">RetVal923</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83570324{vn = ..., cns = ...}</span>, <span class="pl-avar">_83570428{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83570352{vn = ..., cns = ...}</span>, <span class="pl-avar">_83570470{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83570428{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _83570550{$P1_CODE_579} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd579</span>, <span class="pl-var">P1_CODE_RESULT_579</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">==</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>, 
             []], 
           <span class="pl-var">_patterns</span>, 
           [ <span class="pl-atom">'let*'</span>, 
             [ [ <span class="pl-var">_pivot</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
               [ <span class="pl-var">_rest</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
               [ <span class="pl-var">_more_abstract</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'filter-more-abstract'</span>, <span class="pl-var">_rest</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
               [ <span class="pl-var">_less_abstract</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'filter-less-abstract'</span>, <span class="pl-var">_rest</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
               [ <span class="pl-var">_sorted_less</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'sort-by-abstraction'</span>, <span class="pl-var">_less_abstract</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
               [ <span class="pl-var">_sorted_more</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'sort-by-abstraction'</span>, <span class="pl-var">_more_abstract</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
               [ <span class="pl-var">_with_pivot</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_pivot</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'concat-atom'</span>, <span class="pl-var">_sorted_more</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">D</span>, [], <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
           <span class="pl-var">P1_CODE_580</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd579</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_580</span>, 
                [ <span class="pl-atom">'let*'</span>, 
                  [ [ <span class="pl-var">_pivot</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
                    [ <span class="pl-var">_rest</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
                    [ <span class="pl-var">_more_abstract</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'filter-more-abstract'</span>, <span class="pl-var">_rest</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                    [ <span class="pl-var">_less_abstract</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'filter-less-abstract'</span>, <span class="pl-var">_rest</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                    [ <span class="pl-var">_sorted_less</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'sort-by-abstraction'</span>, <span class="pl-var">_less_abstract</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                    [ <span class="pl-var">_sorted_more</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'sort-by-abstraction'</span>, <span class="pl-var">_more_abstract</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                    [ <span class="pl-var">_with_pivot</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_pivot</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'concat-atom'</span>, <span class="pl-var">_sorted_more</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">_pivot</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">_rest</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_rest</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_pivot</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'filter-more-abstract'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">_more_abstract</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_rest</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_pivot</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'filter-less-abstract'</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">_less_abstract</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_less_abstract</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'sort-by-abstraction'</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">_sorted_less</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_more_abstract</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'sort-by-abstraction'</span>, <span class="pl-var">Q</span>, <span class="pl-var">R</span>, <span class="pl-var">_sorted_more</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">S</span><span class="pl-infix">=</span><span class="pl-var">_pivot</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_sorted_less</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">S</span>, <span class="pl-var">T</span>, <span class="pl-var">_with_pivot</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">U</span><span class="pl-infix">=</span><span class="pl-var">_sorted_more</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">V</span><span class="pl-infix">=</span><span class="pl-var">_with_pivot</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'concat-atom'</span>, <span class="pl-var">U</span>, <span class="pl-var">V</span>, <span class="pl-var">P1_CODE_RESULT_580</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">P1_CODE_580</span>, <span class="pl-var">P1_CODE_RESULT_579</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_83570550{$P1_CODE_579}</span>, <span class="pl-avar">_83570380{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: filter-more-abstract
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Filters patterns that are more abstract than the pivot
%  ;;
%  ;; Parameters:
%  ;;   $patterns - List of patterns to filter
%  ;;   $pivot - Pivot pattern for comparison
%  ;;   $var - Variable for abstraction comparison
%  ;;
%  ;; Returns:
%  ;;   List of patterns more abstract than pivot
%  ;; =============================================================================
%  ; (: filter-more-abstract (-> Expression Expression Expression Expression))
/*
  (= (filter-more-abstract $patterns $pivot $var)  
    (if 
      (== $patterns ()) () 
      (let* 
        ( ($head (car-atom $patterns)) 
          ($84842786 (println! (head $head pivot $pivot var $var))) 
          ($is_head_abstract (is-blk-more-abstract $head $pivot $var)) 
          ($_ (println! (is-blk-abs $is_head_abstract))) 
          ($CopyHead (car-atom $patterns)) 
          ($CopyHead (car-atom $patterns)) 
          ($tail (cdr-atom $patterns)) 
          ($rest_filtered (filter-more-abstract $tail $pivot $var)) 
          ($some_var (is-blk-more-abstract $head $pivot $var))) 
        (if $some_var 
          (cons-atom $CopyHead $rest_filtered) $rest_filtered))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'filter-more-abstract'</span>, 
     <span class="pl-var">_patterns5</span>, <span class="pl-var">_pivot1</span>, <span class="pl-var">_var101</span>, 
     <span class="pl-var">RetVal927</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_84846852{vn = ..., cns = ...}</span>, <span class="pl-avar">_84846984{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_84846880{vn = ..., cns = ...}</span>, <span class="pl-avar">_84847026{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_84846908{vn = ..., cns = ...}</span>, <span class="pl-avar">_84847068{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_84846984{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _84847148{$P1_CODE_587} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd587</span>, <span class="pl-var">P1_CODE_RESULT_587</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
             [ <span class="pl-var">C</span>, 
               [ <span class="pl-atom">'println!'</span>, 
                 [ <span class="pl-atom">head</span>, <span class="pl-var">_head</span>, <span class="pl-atom">pivot</span>, 
                   <span class="pl-var">_pivot</span>, <span class="pl-atom">var</span>, <span class="pl-var">_var</span>]]], 
             [ <span class="pl-var">_is_head_abstract</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-blk-more-abstract'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">__</span>, 
               [ <span class="pl-atom">'println!'</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-blk-abs'</span>, <span class="pl-var">_is_head_abstract</span></span>]</span>]], 
             [ <span class="pl-var">CopyHead</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
             [ <span class="pl-var">CopyHead</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
             [ <span class="pl-var">_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
             [ <span class="pl-var">_rest_filtered</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'filter-more-abstract'</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_some_var</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-blk-more-abstract'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-var">_some_var</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">CopyHead</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-var">_rest_filtered</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_pivot</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">head</span>, <span class="pl-var">E</span>, <span class="pl-atom">pivot</span>, <span class="pl-var">F</span>, <span class="pl-atom">var</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">H</span>, <span class="pl-var">C</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_pivot</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-blk-more-abstract'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">_is_head_abstract</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_is_head_abstract</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'is-blk-abs'</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">M</span>, <span class="pl-var">__</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">N</span>, <span class="pl-var">CopyHead</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">O</span>, <span class="pl-var">CopyHead</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">P</span>, <span class="pl-var">_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_pivot</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">S</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'filter-more-abstract'</span>, <span class="pl-var">Q</span>, <span class="pl-var">R</span>, <span class="pl-var">S</span>, <span class="pl-var">_rest_filtered</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">U</span><span class="pl-infix">=</span><span class="pl-var">_pivot</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">V</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-blk-more-abstract'</span>, <span class="pl-var">T</span>, <span class="pl-var">U</span>, <span class="pl-var">V</span>, <span class="pl-var">_some_var</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">W</span><span class="pl-infix">=</span><span class="pl-var">_some_var</span></span> , 
           <span class="pl-var">P1_CODE_588</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd587</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_588</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">CopyHead</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">X</span><span class="pl-infix">=</span><span class="pl-var">CopyHead</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">Y</span><span class="pl-infix">=</span><span class="pl-var">_rest_filtered</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">X</span>, <span class="pl-var">Y</span>, <span class="pl-var">P1_CODE_RESULT_588</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Z</span><span class="pl-infix">=</span><span class="pl-var">_rest_filtered</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">W</span>, <span class="pl-var">P1_CODE_588</span>, <span class="pl-var">Z</span>, <span class="pl-var">P1_CODE_RESULT_587</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_84847148{$P1_CODE_587}</span>, <span class="pl-avar">_84846936{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: filter-less-abstract
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Filters patterns that are less abstract than the pivot
%  ;;
%  ;; Parameters:
%  ;;   $patterns - List of patterns to filter
%  ;;   $pivot - Pivot pattern for comparison
%  ;;   $var - Variable for abstraction comparison
%  ;;
%  ;; Returns:
%  ;;   List of patterns less abstract than pivot
%  ;; =============================================================================
%  ; (: filter-less-abstract (-> Expression Expression Expression Expression))
/*
  (= (filter-less-abstract $patterns $pivot $var)  
    (if 
      (== $patterns ()) () 
      (let* 
        ( ($head (car-atom $patterns)) 
          ($CopyHead (car-atom $patterns)) 
          ($tail (cdr-atom $patterns)) 
          ($rest_filtered (filter-less-abstract $tail $pivot $var))) 
        (if 
          (is-blk-more-abstract $head $pivot $var) $rest_filtered 
          (cons-atom $CopyHead $rest_filtered)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'filter-less-abstract'</span>, 
     <span class="pl-var">_patterns9</span>, <span class="pl-var">_pivot5</span>, <span class="pl-var">_var105</span>, 
     <span class="pl-var">RetVal931</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_86121100{vn = ..., cns = ...}</span>, <span class="pl-avar">_86121232{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_86121128{vn = ..., cns = ...}</span>, <span class="pl-avar">_86121274{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_86121156{vn = ..., cns = ...}</span>, <span class="pl-avar">_86121316{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_86121232{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _86121396{$P1_CODE_595} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd595</span>, <span class="pl-var">P1_CODE_RESULT_595</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
             [ <span class="pl-var">CopyHead</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
             [ <span class="pl-var">_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_patterns</span></span>]</span>], 
             [ <span class="pl-var">_rest_filtered</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'filter-less-abstract'</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-blk-more-abstract'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-var">_rest_filtered</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">CopyHead</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">CopyHead</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_patterns</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_pivot</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'filter-less-abstract'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">_rest_filtered</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_pivot</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-blk-more-abstract'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_rest_filtered</span></span> , 
           <span class="pl-var">P1_CODE_596</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd595</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_596</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">CopyHead</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">CopyHead</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_rest_filtered</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P1_CODE_RESULT_596</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">P1_CODE_596</span>, <span class="pl-var">P1_CODE_RESULT_595</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_86121396{$P1_CODE_595}</span>, <span class="pl-avar">_86121184{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: eq-prob
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Calculates the probability of a variable taking the same value across
%  ;;   all blocks/subpatterns where that variable appears in a partition
%  ;;
%  ;; Type Signature:
%  ;;   (-> Expression Expression Expression Number)
%  ;;
%  ;; Parameters:
%  ;;   $partition - List of blocks/subpatterns 
%  ;;   $pattern - The main pattern containing variables
%  ;;   $db - Database/corpus to search in
%  ;;
%  ;; Returns:
%  ;;   Probability value as a number
%  ;;
%  ;; Algorithm:
%  ;;   1. For each joint variable in the pattern and partition
%  ;;   2. Get connected subpatterns containing that variable
%  ;;   3. Sort by abstraction level (most abstract first)
%  ;;   4. For each block after the first, find most specialized abstract block
%  ;;   5. Calculate probability based on value counts
%  ;; =============================================================================
%  ; (: eq-prob (-> Expression Expression Expression Number))
/*
  (= (eq-prob $partition $pattern $db)  
    (let $joint_vars 
      (joint-variables $pattern $partition) 
      (calculate-prob-for-vars $joint_vars $partition $db 1.0)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'eq-prob'</span>, <span class="pl-var">_partition9</span>, <span class="pl-var">_pattern81</span>, <span class="pl-var">_db41</span>, <span class="pl-var">RetVal935</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_86868762{vn = ..., cns = ...}</span>, <span class="pl-avar">_86868894{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_86868790{vn = ..., cns = ...}</span>, <span class="pl-avar">_86868936{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_86868818{vn = ..., cns = ...}</span>, <span class="pl-avar">_86868978{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_86868936{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_86868894{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'joint-variables'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_86869046{$_joint_vars}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_86869046{$_joint_vars}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_86868894{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_86868978{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'calculate-prob-for-vars'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-float">1.0</span>, <span class="pl-avar">_86868846{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: calculate-prob-for-vars
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Iterates through variables and calculates cumulative probability
%  ;;
%  ;; Parameters:
%  ;;   $vars - List of joint variables
%  ;;   $partition - Partition to analyze
%  ;;   $db - Database
%  ;;   $p - Current probability accumulator
%  ;;
%  ;; Returns:
%  ;;   Final probability after processing all variables
%  ;; =============================================================================
%  ; (: calculate-prob-for-vars (-> Expression Expression Expression Number Number))
/*
  (= (calculate-prob-for-vars $vars $partition $db $p)  
    (if 
      (== $vars ()) $p 
      (let* 
        ( ($head (car-atom $vars)) 
          ($tail (cdr-atom $vars)) 
          ($var_partition (connected-subpatterns-with-var $partition $head)) 
          ($sorted_partition (sort-by-abstraction $var_partition $head)) 
          ($new_p (process-blocks $sorted_partition $head $db $p 1))) 
        (calculate-prob-for-vars $tail $partition $db $new_p))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'calculate-prob-for-vars'</span>, 
     <span class="pl-var">_vars1</span>, <span class="pl-var">_partition13</span>, <span class="pl-var">_db45</span>, <span class="pl-var">_p1</span>, 
     <span class="pl-var">RetVal939</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87129820{vn = ..., cns = ...}</span>, <span class="pl-avar">_87129980{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87129848{vn = ..., cns = ...}</span>, <span class="pl-avar">_87130022{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87129876{vn = ..., cns = ...}</span>, <span class="pl-avar">_87130064{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87129904{vn = ..., cns = ...}</span>, <span class="pl-avar">_87130106{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_87129980{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_87130106{vn = ..., cns = ...}</span></span> , 
     _87130192{$P1_CODE_603} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_603</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_vars</span></span>]</span>], 
             [ <span class="pl-var">_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_vars</span></span>]</span>], 
             [ <span class="pl-var">_var_partition</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'connected-subpatterns-with-var'</span>, <span class="pl-var">_partition</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_sorted_partition</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'sort-by-abstraction'</span>, <span class="pl-var">_var_partition</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_new_p</span>, 
               [ <span class="pl-atom">'process-blocks'</span>,          <span class="pl-var">_sorted_partition</span>, <span class="pl-var">_head</span>, <span class="pl-var">_db</span>, <span class="pl-var">_p</span>, <span class="pl-int">1</span>]]], 
           [ <span class="pl-atom">'calculate-prob-for-vars'</span>,      <span class="pl-var">_tail</span>, <span class="pl-var">_partition</span>, <span class="pl-var">_db</span>, <span class="pl-var">_new_p</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_vars</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_vars</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'connected-subpatterns-with-var'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_var_partition</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_var_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'sort-by-abstraction'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">_sorted_partition</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_sorted_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_p</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'process-blocks'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-int">1</span>, <span class="pl-var">_new_p</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_new_p</span></span> , 
           <span class="pl-atom">me</span>( <span class="pl-atom">'calculate-prob-for-vars'</span>, 
             <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">Q</span>, 
             <span class="pl-var">P1_CODE_RESULT_603</span>))) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_87130192{$P1_CODE_603}</span>, <span class="pl-avar">_87129932{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: process-blocks
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Processes blocks in sorted partition starting from index j=1
%  ;;   (skipping the first block as per the C++ algorithm)
%  ;;
%  ;; Parameters:
%  ;;   $sorted-partition - Partition sorted by abstraction
%  ;;   $var - Current variable being processed
%  ;;   $db - Database
%  ;;   $p - Current probability
%  ;;   $j - Current block index (starts at 1)
%  ;;
%  ;; Returns:
%  ;;   Updated probability after processing all blocks
%  ;; =============================================================================
%  ; (: process-blocks (-> Expression Expression Expression Number Number Number))
/*
  (= (process-blocks $sorted_partition $var $db $p $j)  
    (let $partition_size 
      (size-atom $sorted_partition) 
      (if 
        (>= $j $partition_size) $p 
        (let* 
          ( ($j_blk (index-atom $sorted_partition $j)) 
            ($i (find-most-specialized-abstract $sorted_partition $j_blk $var (- $j 1))) 
            ($c (if (>= $i 0) (let $i_blk (index-atom $sorted_partition $i) (value-count $i_blk $var $db)) (let $U (collapse (get-atoms $db)) (size-atom $U)))) 
            ($j_blk_count (value-count $j_blk $var $db)) 
            ($new_p (/ $p $c))) 
          (process-blocks $sorted_partition $var $db $new_p 
            (+ $j 1))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'process-blocks'</span>, 
     <span class="pl-var">_sorted_partition1</span>, <span class="pl-var">_var109</span>, <span class="pl-var">_db49</span>, <span class="pl-var">_p5</span>, 
     <span class="pl-var">_j1</span>, <span class="pl-var">RetVal943</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88079396{vn = ..., cns = ...}</span>, <span class="pl-avar">_88079584{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88079424{vn = ..., cns = ...}</span>, <span class="pl-avar">_88079626{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88079452{vn = ..., cns = ...}</span>, <span class="pl-avar">_88079668{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88079480{vn = ..., cns = ...}</span>, <span class="pl-avar">_88079710{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88079508{vn = ..., cns = ...}</span>, <span class="pl-avar">_88079752{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_88079584{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_88079806{$_partition_size}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_88079752{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_88079806{$_partition_size}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;=</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_88079710{vn = ..., cns = ...}</span></span> , 
     _88079884{$P1_CODE_607} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_607</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_j_blk</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'index-atom'</span>, <span class="pl-var">_sorted_partition</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_i</span>, 
               [ <span class="pl-atom">'find-most-specialized-abstract'</span>, 
                 <span class="pl-var">_sorted_partition</span>, <span class="pl-var">_j_blk</span>, <span class="pl-var">_var</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_j</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
             [ <span class="pl-var">_c</span>, 
               [ <span class="pl-atom">if</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">&gt;=</span>, <span class="pl-var">_i</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 [ <span class="pl-atom">let</span>, 
                   <span class="pl-var">_i_blk</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'index-atom'</span>, <span class="pl-var">_sorted_partition</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'value-count'</span>, <span class="pl-var">_i_blk</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                 [ <span class="pl-atom">let</span>, 
                   <span class="pl-var">U</span>, 
                   [ <span class="pl-atom">collapse</span>, 
                     <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">_db</span></span>]</span>], 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">U</span></span>]</span>]]], 
             [ <span class="pl-var">_j_blk_count</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'value-count'</span>, <span class="pl-var">_j_blk</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_new_p</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">/</span>, <span class="pl-var">_p</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">'process-blocks'</span>, 
             <span class="pl-var">_sorted_partition</span>, <span class="pl-var">_var</span>, <span class="pl-var">_db</span>, <span class="pl-var">_new_p</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">_j</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_sorted_partition</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_j</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'index-atom'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_j_blk</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_sorted_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_j_blk</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_j</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">K</span>, <span class="pl-int">1</span>, <span class="pl-var">L</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'find-most-specialized-abstract'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">L</span>, <span class="pl-var">_i</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_i</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;=</span>, <span class="pl-var">M</span>, <span class="pl-int">0</span>, <span class="pl-var">N</span></span>)</span> , 
           <span class="pl-var">P1_CODE_608</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_608</span>, 
                [ <span class="pl-atom">let</span>, 
                  <span class="pl-var">_i_blk</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'index-atom'</span>, <span class="pl-var">_sorted_partition</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'value-count'</span>, <span class="pl-var">_i_blk</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_sorted_partition</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_i</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'index-atom'</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">_i_blk</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_i_blk</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">S</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'value-count'</span>, <span class="pl-var">Q</span>, <span class="pl-var">R</span>, <span class="pl-var">S</span>, <span class="pl-var">P1_CODE_RESULT_608</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_609</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Integer'</span>, <span class="pl-var">P1_CODE_RESULT_609</span>, 
                [ <span class="pl-atom">let</span>, 
                  <span class="pl-var">U</span>, 
                  [ <span class="pl-atom">collapse</span>, 
                    <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">_db</span></span>]</span>], 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">U</span></span>]</span>], 
                ( <span class="pl-atom">findall_ne</span>( <span class="pl-var">T</span>, 
                    <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">U</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">U</span>, <span class="pl-var">T</span></span>)</span></span>, 
                    <span class="pl-var">U</span>)  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">V</span><span class="pl-infix">=</span><span class="pl-var">U</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">V</span>, <span class="pl-var">P1_CODE_RESULT_609</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">N</span>, <span class="pl-var">P1_CODE_608</span>, <span class="pl-var">P1_CODE_609</span>, <span class="pl-var">_c</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">W</span><span class="pl-infix">=</span><span class="pl-var">_j_blk</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">X</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Y</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'value-count'</span>, <span class="pl-var">W</span>, <span class="pl-var">X</span>, <span class="pl-var">Y</span>, <span class="pl-var">_j_blk_count</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Z</span><span class="pl-infix">=</span><span class="pl-var">_p</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">A1</span><span class="pl-infix">=</span><span class="pl-var">_c</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">/</span>, <span class="pl-var">Z</span>, <span class="pl-var">A1</span>, <span class="pl-var">_new_p</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">B1</span><span class="pl-infix">=</span><span class="pl-var">_sorted_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">C1</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D1</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E1</span><span class="pl-infix">=</span><span class="pl-var">_new_p</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F1</span><span class="pl-infix">=</span><span class="pl-var">_j</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">F1</span>, <span class="pl-int">1</span>, <span class="pl-var">G1</span></span>)</span> , 
           <span class="pl-atom">me</span>( <span class="pl-atom">'process-blocks'</span>, 
             <span class="pl-var">B1</span>, <span class="pl-var">C1</span>, <span class="pl-var">D1</span>, <span class="pl-var">E1</span>, 
             <span class="pl-var">G1</span>, <span class="pl-var">P1_CODE_RESULT_607</span>))) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_88079884{$P1_CODE_607}</span>, <span class="pl-avar">_88079536{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (value-count $blk $_ $db)  
    (let* 
      ( ($conj_blk (union-atom (,) $blk)) 
        ($ground_value (collapse (match $db $conj_blk $conj_blk))) 
        ($ground_value (unique-atom $ground_value))) 
      (size-atom $ground_value)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'value-count'</span>, <span class="pl-var">_blk5</span>, <span class="pl-var">_var113</span>, <span class="pl-var">_db53</span>, <span class="pl-var">RetVal947</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89475684{vn = ..., cns = ...}</span>, <span class="pl-avar">_89475816{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89475712{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89475740{vn = ..., cns = ...}</span>, <span class="pl-avar">_89475872{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">','</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_89475816{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_89475946{$_conj_blk}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">C</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">metta_atom_iter</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span></span></span>, 
       _89476004{$_ground_value}) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_89476004{$_ground_value}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'unique-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_89476004{$_ground_value}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_89476004{$_ground_value}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_89475768{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: find-most-specialized-abstract
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Finds the most specialized block that is more abstract than j_blk
%  ;;   Goes backward from j_blk to find first i_blk that is more abstract
%  ;;
%  ;; Parameters:
%  ;;   $partition - Sorted partition
%  ;;   $j-blk - Current block to compare against
%  ;;   $var - Variable for abstraction comparison
%  ;;   $i - Current index to check (starts at j-1)
%  ;;
%  ;; Returns:
%  ;;   Index of most specialized abstract block, or -1 if none found
%  ;; =============================================================================
%  ; (: find-most-specialized-abstract (-> Expression Expression Expression Number Number))
/*
  (= (find-most-specialized-abstract $partition $j_blk $var $i)  
    (if 
      (< $i 0) -1 
      (let $i_blk 
        (index-atom $partition $i) 
        (if 
          (is-blk-more-abstract $i_blk $j_blk $var) $i 
          (find-most-specialized-abstract $partition $j_blk $var 
            (- $i 1))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'find-most-specialized-abstract'</span>, 
     <span class="pl-var">_partition17</span>, <span class="pl-var">_j_blk1</span>, <span class="pl-var">_var117</span>, <span class="pl-var">_i1</span>, 
     <span class="pl-var">RetVal951</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89765764{vn = ..., cns = ...}</span>, <span class="pl-avar">_89765924{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89765792{vn = ..., cns = ...}</span>, <span class="pl-avar">_89765966{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89765820{vn = ..., cns = ...}</span>, <span class="pl-avar">_89766008{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89765848{vn = ..., cns = ...}</span>, <span class="pl-avar">_89766050{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_89766050{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _89766124{$P1_CODE_619} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd619</span>, <span class="pl-var">P1_CODE_RESULT_619</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_i_blk</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'index-atom'</span>, <span class="pl-var">_partition</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-blk-more-abstract'</span>, <span class="pl-var">_i_blk</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-var">_i</span>, 
             [ <span class="pl-atom">'find-most-specialized-abstract'</span>, 
               <span class="pl-var">_partition</span>, <span class="pl-var">_j_blk</span>, <span class="pl-var">_var</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_i</span>|<span class="pl-ellipsis">...</span></span>]</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_i</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'index-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span>, <span class="pl-var">_i_blk</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_i_blk</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_j_blk</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-blk-more-abstract'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_i</span></span> , 
           <span class="pl-var">P1_CODE_620</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd619</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_620</span>, 
                [ <span class="pl-atom">'find-most-specialized-abstract'</span>, 
                  <span class="pl-var">_partition</span>, <span class="pl-var">_j_blk</span>, <span class="pl-var">_var</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_i</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_j_blk</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_i</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">M</span>, <span class="pl-int">1</span>, <span class="pl-var">N</span></span>)</span> , 
                  <span class="pl-atom">me</span>( <span class="pl-atom">'find-most-specialized-abstract'</span>, 
                    <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">N</span>, 
                    <span class="pl-var">P1_CODE_RESULT_620</span>))) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_620</span>, <span class="pl-var">P1_CODE_RESULT_619</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-int">-1</span>, <span class="pl-avar">_89766124{$P1_CODE_619}</span>, <span class="pl-avar">_89765876{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Helper Functions
%  ;; =============================================================================
%  ;; =============================================================================
%  ;; Function: get-var
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Extracts all variables from a flattened pattern expression
%  ;;   A flattened pattern is a list of patterns like ((Pattern $x $y) (Pattern $z Jon))
%  ;;
%  ;; Type Signature:
%  ;;   (-> Expression Expression)
%  ;;
%  ;; Parameters:
%  ;;   $pattern - Flattened pattern (list of individual patterns)
%  ;;
%  ;; Returns:
%  ;;   List of unique variables found in the pattern
%  ;;
%  ;; Example:
%  ;;   (get-var '((Pattern $x $y) (Pattern $z Jon))) → ($x $y $z)
%  ;; =============================================================================
/*
  (= (get-var $pattern)  
    (unique-list (extract-vars-from-pattern $pattern ())))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-var'</span>, <span class="pl-var">_pattern85</span>, <span class="pl-var">RetVal955</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_90381168{vn = ..., cns = ...}</span>, <span class="pl-avar">_90381244{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_90381244{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'extract-vars-from-pattern'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'unique-list'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_90381196{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Helper function to recursively extract variables from pattern
/*
  (= (extract-vars-from-pattern $pattern $acc)  
    (if 
      (== $pattern ()) $acc 
      (if 
        (== 
          (car-atom $pattern) ,) 
        (let* 
          ( ($pattern_wout_and (cdr-atom $pattern)) 
            ($current_expr (car-atom $pattern_wout_and)) 
            ($remaining (cdr-atom $pattern_wout_and)) 
            ($expr_vars (extract-vars-from-expr $current_expr)) 
            ($new_acc (merge-list $acc $expr_vars))) 
          (extract-vars-from-pattern $remaining $new_acc)) 
        (let* 
          ( ($current_expr (car-atom $pattern)) 
            ($remaining (cdr-atom $pattern)) 
            ($expr_vars (extract-vars-from-expr $current_expr)) 
            ($new_acc (merge-list $acc $expr_vars))) 
          (extract-vars-from-pattern $remaining $new_acc)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'extract-vars-from-pattern'</span>, <span class="pl-var">_pattern89</span>, <span class="pl-var">_acc17</span>, <span class="pl-var">RetVal959</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_90632602{vn = ..., cns = ...}</span>, <span class="pl-avar">_90632706{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_90632630{vn = ..., cns = ...}</span>, <span class="pl-avar">_90632748{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_90632706{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_90632748{vn = ..., cns = ...}</span></span> , 
     _90632834{$P1_CODE_627} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd627</span>, <span class="pl-var">P1_CODE_RESULT_627</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">==</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_pattern</span></span>]</span>, 
             <span class="pl-atom">','</span>], 
           [ <span class="pl-atom">'let*'</span>, 
             [ [ <span class="pl-var">_pattern_wout_and</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_pattern</span></span>]</span>], 
               [ <span class="pl-var">_current_expr</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_pattern_wout_and</span></span>]</span>], 
               [ <span class="pl-var">_remaining</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_pattern_wout_and</span></span>]</span>], 
               [ <span class="pl-var">_expr_vars</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'extract-vars-from-expr'</span>, <span class="pl-var">_current_expr</span></span>]</span>], 
               [ <span class="pl-var">_new_acc</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">_acc</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'extract-vars-from-pattern'</span>, <span class="pl-var">_remaining</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
           [ <span class="pl-atom">'let*'</span>, 
             [ [ <span class="pl-var">_current_expr</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_pattern</span></span>]</span>], 
               [ <span class="pl-var">_remaining</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_pattern</span></span>]</span>], 
               [ <span class="pl-var">_expr_vars</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'extract-vars-from-expr'</span>, <span class="pl-var">_current_expr</span></span>]</span>], 
               [ <span class="pl-var">_new_acc</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">_acc</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'extract-vars-from-pattern'</span>, <span class="pl-var">_remaining</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">E</span>, <span class="pl-atom">','</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-var">P1_CODE_628</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd627</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_628</span>, 
                [ <span class="pl-atom">'let*'</span>, 
                  [ [ <span class="pl-var">_pattern_wout_and</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_pattern</span></span>]</span>], 
                    [ <span class="pl-var">_current_expr</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_pattern_wout_and</span></span>]</span>], 
                    [ <span class="pl-var">_remaining</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_pattern_wout_and</span></span>]</span>], 
                    [ <span class="pl-var">_expr_vars</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'extract-vars-from-expr'</span>, <span class="pl-var">_current_expr</span></span>]</span>], 
                    [ <span class="pl-var">_new_acc</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">_acc</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'extract-vars-from-pattern'</span>, <span class="pl-var">_remaining</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">_pattern_wout_and</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_pattern_wout_and</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">_current_expr</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_pattern_wout_and</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">I</span>, <span class="pl-var">_remaining</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_current_expr</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'extract-vars-from-expr'</span>, <span class="pl-var">J</span>, <span class="pl-var">_expr_vars</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_expr_vars</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">_new_acc</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_remaining</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_new_acc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'extract-vars-from-pattern'</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">P1_CODE_RESULT_628</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_629</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd627</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_629</span>, 
                [ <span class="pl-atom">'let*'</span>, 
                  [ [ <span class="pl-var">_current_expr</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_pattern</span></span>]</span>], 
                    [ <span class="pl-var">_remaining</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_pattern</span></span>]</span>], 
                    [ <span class="pl-var">_expr_vars</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'extract-vars-from-expr'</span>, <span class="pl-var">_current_expr</span></span>]</span>], 
                    [ <span class="pl-var">_new_acc</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">_acc</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'extract-vars-from-pattern'</span>, <span class="pl-var">_remaining</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">O</span>, <span class="pl-var">_current_expr</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_pattern</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">P</span>, <span class="pl-var">_remaining</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_current_expr</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'extract-vars-from-expr'</span>, <span class="pl-var">Q</span>, <span class="pl-var">_expr_vars</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">S</span><span class="pl-infix">=</span><span class="pl-var">_expr_vars</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">R</span>, <span class="pl-var">S</span>, <span class="pl-var">_new_acc</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_remaining</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">U</span><span class="pl-infix">=</span><span class="pl-var">_new_acc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'extract-vars-from-pattern'</span>, <span class="pl-var">T</span>, <span class="pl-var">U</span>, <span class="pl-var">P1_CODE_RESULT_629</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">F</span>, <span class="pl-var">P1_CODE_628</span>, <span class="pl-var">P1_CODE_629</span>, <span class="pl-var">P1_CODE_RESULT_627</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_90632834{$P1_CODE_627}</span>, <span class="pl-avar">_90632658{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Extract variables from a single expression
%  ; (: extract-vars-from-expr (-> Expression Expression))
/*
  (= (extract-vars-from-expr $expr)  
    (if 
      (== $expr ()) () 
      (let* 
        ( ($head (car-atom $expr)) 
          ($tail (cdr-atom $expr)) 
          ($head_vars (if (== (get-metatype $head) Variable) ($head) ())) 
          ($tail_vars (extract-vars-from-expr $tail))) 
        (merge-list $head_vars $tail_vars))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'extract-vars-from-expr'</span>, <span class="pl-var">_expr25</span>, <span class="pl-var">RetVal963</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_91935948{vn = ..., cns = ...}</span>, <span class="pl-avar">_91936024{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_91936024{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _91936104{$P1_CODE_639} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_639</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_head</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_expr</span></span>]</span>], 
             [ <span class="pl-var">_tail</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_expr</span></span>]</span>], 
             [ <span class="pl-var">_head_vars</span>, 
               [ <span class="pl-atom">if</span>, 
                 [ <span class="pl-atom">==</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_head</span></span>]</span>, 
                   <span class="pl-atom">'Variable'</span>], 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>, 
                 []]], 
             [ <span class="pl-var">_tail_vars</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'extract-vars-from-expr'</span>, <span class="pl-var">_tail</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">_head_vars</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_expr</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_head</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_expr</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_tail</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">F</span>, <span class="pl-atom">'Variable'</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-var">P1_CODE_640</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, 
                <span class="pl-var">RetTypeNotCd640</span>, 
                <span class="pl-var">P1_CODE_RESULT_640</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>, 
                <span class="pl-atom">eval_for1</span>( 
                   <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-compound"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-ellipsis">...</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span></span>)</span>, 
                   <span class="pl-var">RetTypeNotCd640</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>, 
                   <span class="pl-var">P1_CODE_RESULT_640</span>)) , 
           <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_640</span>, [], <span class="pl-var">_head_vars</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'extract-vars-from-expr'</span>, <span class="pl-var">H</span>, <span class="pl-var">_tail_vars</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_head_vars</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_tail_vars</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">P1_CODE_RESULT_639</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_91936104{$P1_CODE_639}</span>, <span class="pl-avar">_91935976{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: joint-variables
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Finds variables that appear in multiple blocks of a partition
%  ;;   A joint variable must exist in at least 2 different blocks
%  ;;
%  ;; Type Signature:
%  ;;   (-> Expression Expression Expression)
%  ;;
%  ;; Parameters:
%  ;;   $pattern - Flattened pattern to get variables from
%  ;;   $partition - List of blocks (each block is a list of patterns)
%  ;;
%  ;; Returns:
%  ;;   List of variables that appear in multiple blocks
%  ;;
%  ;; Example:
%  ;;   Pattern: ((Pattern $x $y) (Pattern $x Jon))  
%  ;;   Partition: ( ((Pattern $x Jon))  ((Pattern $x $y)) )  
%  ;;   Result: ($x $y) - because they appear in both blocks, $z only in first block
%  ;; =============================================================================
%  ; (: joint-variables (-> Expression Expression Expression))
/*
  (= (joint-variables $pattern $partition)  
    (let $pattern_vars 
      (get-var $pattern) 
      (filter-joint-vars $pattern_vars $partition)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'joint-variables'</span>, <span class="pl-var">_pattern93</span>, <span class="pl-var">_partition21</span>, <span class="pl-var">RetVal967</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_92570448{vn = ..., cns = ...}</span>, <span class="pl-avar">_92570552{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_92570476{vn = ..., cns = ...}</span>, <span class="pl-avar">_92570594{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_92570552{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-var'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_92570648{$_pattern_vars}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_92570648{$_pattern_vars}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_92570594{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'filter-joint-vars'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_92570504{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Filter variables that appear in multiple blocks
%  ; (: filter-joint-vars (-> Expression Expression Expression))
/*
  (= (filter-joint-vars $vars $partition)  
    (if 
      (== $vars ()) () 
      (let* 
        ( ($var (car-atom $vars)) 
          ($remaining_vars (cdr-atom $vars)) 
          ($rest_joint (filter-joint-vars $remaining_vars $partition))) 
        (if 
          (is-joint-var $var $partition) 
          (cons-atom $var $rest_joint) $rest_joint))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'filter-joint-vars'</span>, <span class="pl-var">_vars5</span>, <span class="pl-var">_partition25</span>, <span class="pl-var">RetVal971</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_92763840{vn = ..., cns = ...}</span>, <span class="pl-avar">_92763944{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_92763868{vn = ..., cns = ...}</span>, <span class="pl-avar">_92763986{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_92763944{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _92764066{$P1_CODE_647} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd647</span>, <span class="pl-var">P1_CODE_RESULT_647</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_var</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_vars</span></span>]</span>], 
             [ <span class="pl-var">_remaining_vars</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_vars</span></span>]</span>], 
             [ <span class="pl-var">_rest_joint</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'filter-joint-vars'</span>, <span class="pl-var">_remaining_vars</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-joint-var'</span>, <span class="pl-var">_var</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_var</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-var">_rest_joint</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_vars</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_var</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_vars</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_remaining_vars</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_remaining_vars</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'filter-joint-vars'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">_rest_joint</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'is-joint-var'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-var">P1_CODE_648</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd647</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_648</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_var</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_rest_joint</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_648</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_rest_joint</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_648</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_647</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_92764066{$P1_CODE_647}</span>, <span class="pl-avar">_92763896{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Check if a variable appears in multiple blocks of partition
/*
  (= (is-joint-var $var $partition)  
    (let $block_count 
      (count-blocks-with-var $var $partition 0) 
      (> $block_count 1)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-joint-var'</span>, <span class="pl-var">_var121</span>, <span class="pl-var">_partition29</span>, <span class="pl-var">RetVal975</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_93347418{vn = ..., cns = ...}</span>, <span class="pl-avar">_93347522{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_93347446{vn = ..., cns = ...}</span>, <span class="pl-avar">_93347564{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_93347522{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_93347564{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'count-blocks-with-var'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-avar">_93347640{$_block_count}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_93347640{$_block_count}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&gt;</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-int">1</span>, <span class="pl-avar">_93347474{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Count how many blocks contain the variable
/*
  (= (count-blocks-with-var $var $partition $count)  
    (if 
      (== $partition ()) $count 
      (let* 
        ( ($current_block (car-atom $partition)) 
          ($93604228 (println! $current_block)) 
          ($remaining_blocks (cdr-atom $partition)) 
          ($_ (println! $remaining_blocks)) 
          ($var_in_block (is-var-exist $current_block $var)) 
          ($__ (println! $var_in_block)) 
          ($new_count (if $var_in_block (+ $count 1) $count))) 
        (count-blocks-with-var $var $remaining_blocks $new_count))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'count-blocks-with-var'</span>, 
     <span class="pl-var">_var125</span>, <span class="pl-var">_partition33</span>, <span class="pl-var">_count1</span>, 
     <span class="pl-var">RetVal979</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_93607820{vn = ..., cns = ...}</span>, <span class="pl-avar">_93607952{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_93607848{vn = ..., cns = ...}</span>, <span class="pl-avar">_93607994{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_93607876{vn = ..., cns = ...}</span>, <span class="pl-avar">_93608036{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_93607994{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_93608036{vn = ..., cns = ...}</span></span> , 
     _93608122{$P1_CODE_655} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_655</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_current_block</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_partition</span></span>]</span>], 
             [ <span class="pl-var">D</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'println!'</span>, <span class="pl-var">_current_block</span></span>]</span>], 
             [ <span class="pl-var">_remaining_blocks</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_partition</span></span>]</span>], 
             [ <span class="pl-var">__</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'println!'</span>, <span class="pl-var">_remaining_blocks</span></span>]</span>], 
             [ <span class="pl-var">_var_in_block</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-var">_current_block</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">___</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'println!'</span>, <span class="pl-var">_var_in_block</span></span>]</span>], 
             [ <span class="pl-var">_new_count</span>, 
               [ <span class="pl-atom">if</span>, 
                 <span class="pl-var">_var_in_block</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">_count</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                 <span class="pl-var">_count</span>]]], 
           [ <span class="pl-atom">'count-blocks-with-var'</span>,      <span class="pl-var">_var</span>, <span class="pl-var">_remaining_blocks</span>, <span class="pl-var">_new_count</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">E</span>, <span class="pl-var">_current_block</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_current_block</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">F</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">_remaining_blocks</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_remaining_blocks</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">H</span>, <span class="pl-var">__</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_current_block</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">_var_in_block</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var_in_block</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">K</span>, <span class="pl-var">___</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_var_in_block</span></span> , 
           <span class="pl-var">P1_CODE_656</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Number'</span>, <span class="pl-var">P1_CODE_RESULT_656</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">_count</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_count</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-atom">true</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span></span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_count</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_656</span>, <span class="pl-var">N</span>, <span class="pl-var">_new_count</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_remaining_blocks</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_new_count</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'count-blocks-with-var'</span>, <span class="pl-var">O</span>, <span class="pl-var">P</span>, <span class="pl-var">Q</span>, <span class="pl-var">P1_CODE_RESULT_655</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_93608122{$P1_CODE_655}</span>, <span class="pl-avar">_93607904{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Get all variables from entire partition (updated implementation)
/*
  (= (get-all-partition-variables $partition)  
    (if 
      (== $partition ()) () 
      (let* 
        ( ($block (car-atom $partition)) 
          ($remaining (cdr-atom $partition)) 
          ($block_vars (get-var $block)) 
          ($remaining_vars (get-all-partition-variables $remaining))) 
        (merge-list $block_vars $remaining_vars))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-all-partition-variables'</span>, <span class="pl-var">_partition37</span>, <span class="pl-var">RetVal983</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_94551718{vn = ..., cns = ...}</span>, <span class="pl-avar">_94551794{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_94551794{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _94551874{$P1_CODE_663} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_663</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_block</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_partition</span></span>]</span>], 
             [ <span class="pl-var">_remaining</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_partition</span></span>]</span>], 
             [ <span class="pl-var">_block_vars</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-var'</span>, <span class="pl-var">_block</span></span>]</span>], 
             [ <span class="pl-var">_remaining_vars</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-all-partition-variables'</span>, <span class="pl-var">_remaining</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">_block_vars</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_block</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_partition</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_remaining</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_block</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-var'</span>, <span class="pl-var">E</span>, <span class="pl-var">_block_vars</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_remaining</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-all-partition-variables'</span>, <span class="pl-var">F</span>, <span class="pl-var">_remaining_vars</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_block_vars</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_remaining_vars</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_663</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_94551874{$P1_CODE_663}</span>, <span class="pl-avar">_94551746{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; Find intersection of two variable lists
/*
  (= (intersection-vars $vars1 $vars2)  
    (if 
      (== $vars1 ()) () 
      (let* 
        ( ($var (car-atom $vars1)) 
          ($remaining (cdr-atom $vars1)) 
          ($rest_intersection (intersection-vars $remaining $vars2))) 
        (if 
          (is-membership $var $vars2) 
          (cons-atom $var $rest_intersection) $rest_intersection))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'intersection-vars'</span>, <span class="pl-var">_vars11</span>, <span class="pl-var">_vars21</span>, <span class="pl-var">RetVal987</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_95068936{vn = ..., cns = ...}</span>, <span class="pl-avar">_95069040{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_95068964{vn = ..., cns = ...}</span>, <span class="pl-avar">_95069082{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_95069040{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     _95069162{$P1_CODE_667} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd667</span>, <span class="pl-var">P1_CODE_RESULT_667</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_var</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_vars1</span></span>]</span>], 
             [ <span class="pl-var">_remaining</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_vars1</span></span>]</span>], 
             [ <span class="pl-var">_rest_intersection</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'intersection-vars'</span>, <span class="pl-var">_remaining</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">_var</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_var</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-var">_rest_intersection</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_vars1</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_var</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_vars1</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">_remaining</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_remaining</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_vars2</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'intersection-vars'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">_rest_intersection</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_vars2</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-var">P1_CODE_668</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd667</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_668</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_var</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_rest_intersection</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_668</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_rest_intersection</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_668</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_667</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, [], <span class="pl-avar">_95069162{$P1_CODE_667}</span>, <span class="pl-avar">_95068992{vn = ..., cns = ...}</span></span>)</span></span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/eq-prob.metta at 2025-10-16T14:07:46+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
