%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/blk-abstractness.metta at 2025-10-18T23:16:15+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

%  ; Function to replace a variable with @var throughout a pattern
%  ; Usage: (erase $pattern $var)
%  ; Example: (erase ((Man $x Eyob) (Student $x Newyork)) $x)
%  ; Result: ((Man @eyob Eyob) (Student @eyob Newyork))
/*
  (= (erase $pattern $var)  
    (replace-var $pattern $var @eyob))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">erase</span>, <span class="pl-var">_pattern89</span>, <span class="pl-var">_var41</span>, <span class="pl-var">RetVal955</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82705350{vn = ..., cns = ...}</span>, <span class="pl-avar">_82705454{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82705378{vn = ..., cns = ...}</span>, <span class="pl-avar">_82705496{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_82705454{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_82705496{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'replace-var'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'@eyob'</span>, <span class="pl-avar">_82705406{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Main replacement function using collapse and superpose
/*
  (= (replace-var $MeTTa_SP__expr_5 $var $replacement)  
    (collapse (replace-var-exp (superpose $MeTTa_SP__expr_5) $var $replacement)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'replace-var'</span>, <span class="pl-var">_expr21</span>, <span class="pl-var">_var45</span>, <span class="pl-var">_replacement1</span>, <span class="pl-var">RetVal959</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82832852{vn = ..., cns = ...}</span>, <span class="pl-avar">_82832984{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82832880{vn = ..., cns = ...}</span>, <span class="pl-avar">_82833026{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_82832908{vn = ..., cns = ...}</span>, <span class="pl-avar">_82833068{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       ( <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__expr_5</span>, <span class="pl-var">B</span></span>)</span>  ,
         <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
         <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_replacement</span></span> , 
         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'replace-var-exp'</span>, <span class="pl-var">B</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span>, <span class="pl-var">A</span></span>)</span>), 
       _82832936{vn = ..., cns = ...})</span>) ).


%  ; Replace variable in an expression 
/*
  (= (replace-var-exp $exp $var $replacement)  
    (let* 
      ( ( ($link $var1 $var2) $exp) 
        ($subvar1 (sub-var $var1 $var $replacement)) 
        ($subvar2 (sub-var $var2 $var $replacement))) 
      ($link $subvar1 $subvar2)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'replace-var-exp'</span>, <span class="pl-var">_exp9</span>, <span class="pl-var">_var49</span>, <span class="pl-var">_replacement5</span>, <span class="pl-var">RetVal963</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83046872{vn = ..., cns = ...}</span>, <span class="pl-avar">_83047004{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83046900{vn = ..., cns = ...}</span>, <span class="pl-avar">_83047046{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83046928{vn = ..., cns = ...}</span>, <span class="pl-avar">_83047088{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83047004{vn = ..., cns = ...}</span></span> , 
     <span class="pl-atom">unify_with_occurs_check</span>( <span class="pl-var">A</span>, [
       <span class="pl-var">_link</span>, <span class="pl-avar">_83047166{$_var1}</span>, <span class="pl-avar">_83047186{$_var2}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83047166{$_var1}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83047046{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83047088{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'sub-var'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_83047254{$_subvar1}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83047186{$_var2}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83047046{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83047088{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'sub-var'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_83047322{$_subvar2}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83047146{$_link}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83047254{$_subvar1}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83047322{$_subvar2}</span></span> , 
     <span class="pl-atom">u_assign</span>( <span class="pl-int">14</span>, 
       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">H</span>, <span class="pl-var">I</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
       _83046956{vn = ..., cns = ...})</span>) ).


%  ; Substitute variable in a single atom
/*
  (= (sub-var $atom $var $replacement)  
    (if 
      (== 
        (get-metatype $atom) Variable) 
      (if 
        (== $atom $var) $replacement $atom) $atom))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'sub-var'</span>, <span class="pl-var">_atom41</span>, <span class="pl-var">_var53</span>, <span class="pl-var">_replacement9</span>, <span class="pl-var">RetVal967</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83425306{vn = ..., cns = ...}</span>, <span class="pl-avar">_83425438{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83425334{vn = ..., cns = ...}</span>, <span class="pl-avar">_83425480{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83425362{vn = ..., cns = ...}</span>, <span class="pl-avar">_83425522{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83425438{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'Variable'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _83425610{$P1_CODE_543} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_543</span>, 
         [ <span class="pl-atom">if</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_atom</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">_replacement</span>, <span class="pl-var">_atom</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_atom</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_replacement</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_atom</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_543</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83425438{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_83425610{$P1_CODE_543}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-avar">_83425390{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Check if variable exists in a single expression
/*
  (= (var-exist-exp $exp $var)  
    (if 
      (checkPat $exp) 
      (let* 
        ( ($MeTTa_SP__tail_1 (cdr-atom $exp)) 
          ($ans (collapse (is-var-same (superpose $MeTTa_SP__tail_1) $var))) 
          ($len (size-atom $ans))) 
        (if 
          (== $len 0) False True)) False))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'var-exist-exp'</span>, <span class="pl-var">_exp13</span>, <span class="pl-var">_var57</span>, <span class="pl-var">RetVal971</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83836142{vn = ..., cns = ...}</span>, <span class="pl-avar">_83836246{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_83836170{vn = ..., cns = ...}</span>, <span class="pl-avar">_83836288{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_83836246{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">checkPat</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _83836354{$P1_CODE_547} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_547</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">MeTTa_SP__tail_1</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_exp</span></span>]</span>], 
             [ <span class="pl-var">_ans</span>, 
               [ <span class="pl-atom">collapse</span>, 
                 [ <span class="pl-atom">'is-var-same'</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__tail_1</span></span>]</span>, 
                   <span class="pl-var">_var</span>]]], 
             [ <span class="pl-var">_len</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">_ans</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_len</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'False'</span>, <span class="pl-atom">'True'</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_exp</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">MeTTa_SP__tail_1</span></span>)</span> , 
           <span class="pl-atom">findall_ne</span>( <span class="pl-var">D</span>, 
             ( <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__tail_1</span>, <span class="pl-var">E</span></span>)</span>  ,
               <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
               <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'is-var-same'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">D</span></span>)</span>), 
             <span class="pl-var">_ans</span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_ans</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">_len</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_len</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">H</span>, <span class="pl-int">0</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-atom">'False'</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_RESULT_547</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_83836354{$P1_CODE_547}</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_83836198{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Check if variable exists in the entire pattern
/*
  (= (is-var-exist $exp $var)  
    (if 
      (== $exp ()) False 
      (let $is_var_in_exp 
        (var-exist-exp 
          (car-atom $exp) $var) 
        (if $is_var_in_exp True 
          (is-var-exist 
            (cdr-atom $exp) $var)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-var">_exp17</span>, <span class="pl-var">_var61</span>, <span class="pl-var">RetVal975</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_84367136{vn = ..., cns = ...}</span>, <span class="pl-avar">_84367240{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_84367164{vn = ..., cns = ...}</span>, <span class="pl-avar">_84367282{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_84367240{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _84367356{$P1_CODE_551} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd551</span>, <span class="pl-var">P1_CODE_RESULT_551</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_is_var_in_exp</span>, 
           [ <span class="pl-atom">'var-exist-exp'</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_exp</span></span>]</span>, 
             <span class="pl-var">_var</span>], 
           [ <span class="pl-atom">if</span>, <span class="pl-var">_is_var_in_exp</span>, <span class="pl-atom">'True'</span>, 
             [ <span class="pl-atom">'is-var-exist'</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_exp</span></span>]</span>, 
               <span class="pl-var">_var</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_exp</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'var-exist-exp'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">_is_var_in_exp</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_is_var_in_exp</span></span> , 
           <span class="pl-var">P1_CODE_552</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd551</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_552</span>, 
                [ <span class="pl-atom">'is-var-exist'</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_exp</span></span>]</span>, 
                  <span class="pl-var">_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_exp</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_552</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">F</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_552</span>, <span class="pl-var">P1_CODE_RESULT_551</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_84367356{$P1_CODE_551}</span>, <span class="pl-avar">_84367192{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Get all variables from a pattern
%  ; Check if two patterns can be unified after treating var as constant
%  ; (= (can-unify $l_body $r_body $db)
%  ;    (let*( 
%  ;     ($conj-l (union-atom (,) $l_body))
%  ;     ($conj-r (union-atom (,) $r_body))
%  ;     ($value-l (collapse (match $db $conj-l $conj-l)))
%  ;     ($value-r (collapse (match $db) $conj-r $conj-l)))
%  ;     ($is-unify1 (== (subsctract-atom $value-l $value-r) ()))
%  ;     ($is-unify2 (== (subsctract-atom $value-r $value-l) ()))
%  ;     )
%  ;     (Or $is-unify1 $is-unify2)  ; Both conditions must be true for unification
%  ;    )
%  ; (= (can-unify $l_body $r_body)
%  ; (
%  ;     let* (
%  ;        ($- (!(bind! &left $l_body)) )
%  ;        ($__ (!(bind! &right $r_body)) )
%  ;        ($_ (println! (can un called with (&left) (&right))))
%  ;     )
%  ;     (unify &left &right True False)
%  ; )
%  ; )
%  ; Main unification function for atom bodies
/*
  (= (can-unify $l_body $r_body)  
    (if 
      (== 
        (size-atom $l_body) 
        (size-atom $r_body)) 
      (let* 
        ( ($left_empty (== (size-atom $l_body) 0)) ($right_empty (== (size-atom $r_body) 0))) 
        (if 
          (and $left_empty $right_empty) True 
          (if 
            (or $left_empty $right_empty) False 
            (let* 
              ( ($85035724 (println! (can-unify called with $l_body $r_body))) 
                ($l_head (car-atom $l_body)) 
                ($l_tail (cdr-atom $l_body)) 
                ($r_head (car-atom $r_body)) 
                ($r_tail (cdr-atom $r_body)) 
                ($head_unify (can-unify-expr $l_head $r_head))) 
              (if $head_unify 
                (can-unify $l_tail $r_tail) False))))) False))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">_l_body1</span>, <span class="pl-var">_r_body1</span>, <span class="pl-var">RetVal979</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_85040564{vn = ..., cns = ...}</span>, <span class="pl-avar">_85040668{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_85040592{vn = ..., cns = ...}</span>, <span class="pl-avar">_85040710{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_85040668{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_85040710{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     _85040818{$P1_CODE_559} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd559</span>, <span class="pl-var">P1_CODE_RESULT_559</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_left_empty</span>, 
               [ <span class="pl-atom">==</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">_l_body</span></span>]</span>, 
                 <span class="pl-int">0</span>]], 
             [ <span class="pl-var">_right_empty</span>, 
               [ <span class="pl-atom">==</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">_r_body</span></span>]</span>, 
                 <span class="pl-int">0</span>]]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">and</span>, <span class="pl-var">_left_empty</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-atom">'True'</span>, 
             [ <span class="pl-atom">if</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">or</span>, <span class="pl-var">_left_empty</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
               <span class="pl-atom">'False'</span>, 
               [ <span class="pl-atom">'let*'</span>, 
                 [ [ <span class="pl-var">F</span>, 
                     [ <span class="pl-atom">'println!'</span>, 
                       [ <span class="pl-atom">'can-unify'</span>, <span class="pl-atom">called</span>, <span class="pl-atom">with</span>, <span class="pl-var">_l_body</span>, 
                         <span class="pl-var">_r_body</span>]]], 
                   [ <span class="pl-var">_l_head</span>, 
                     <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_l_body</span></span>]</span>], 
                   [ <span class="pl-var">_l_tail</span>, 
                     <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_l_body</span></span>]</span>], 
                   [ <span class="pl-var">_r_head</span>, 
                     <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_r_body</span></span>]</span>], 
                   [ <span class="pl-var">_r_tail</span>, 
                     <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_body</span></span>]</span>], 
                   [ <span class="pl-var">_head_unify</span>, 
                     <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify-expr'</span>, <span class="pl-var">_l_head</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
                 [ <span class="pl-atom">if</span>, 
                   <span class="pl-var">_head_unify</span>, 
                   <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">_l_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                   <span class="pl-atom">'False'</span>]]]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_l_body</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">H</span>, <span class="pl-int">0</span>, <span class="pl-var">_left_empty</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_r_body</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">J</span>, <span class="pl-int">0</span>, <span class="pl-var">_right_empty</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_left_empty</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_right_empty</span></span> , 
           <span class="pl-var">P1_CODE_560</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd559</span></span>]</span>, <span class="pl-var">RetTypeNotCd560</span>, <span class="pl-var">P1_CODE_RESULT_560</span>, 
                [ <span class="pl-atom">if</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">or</span>, <span class="pl-var">_left_empty</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                  <span class="pl-atom">'False'</span>, 
                  [ <span class="pl-atom">'let*'</span>, 
                    [ [ <span class="pl-var">F</span>, 
                        [ <span class="pl-atom">'println!'</span>, 
                          [ <span class="pl-atom">'can-unify'</span>, <span class="pl-atom">called</span>, <span class="pl-atom">with</span>, <span class="pl-var">_l_body</span>, 
                            <span class="pl-var">_r_body</span>]]], 
                      [ <span class="pl-var">_l_head</span>, 
                        <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_l_body</span></span>]</span>], 
                      [ <span class="pl-var">_l_tail</span>, 
                        <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_l_body</span></span>]</span>], 
                      [ <span class="pl-var">_r_head</span>, 
                        <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_r_body</span></span>]</span>], 
                      [ <span class="pl-var">_r_tail</span>, 
                        <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_body</span></span>]</span>], 
                      [ <span class="pl-var">_head_unify</span>, 
                        <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify-expr'</span>, <span class="pl-var">_l_head</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
                    [ <span class="pl-atom">if</span>, 
                      <span class="pl-var">_head_unify</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">_l_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                      <span class="pl-atom">'False'</span>]]], 
                ( <span class="pl-atom">call_for_unit</span>( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">call_as_prolog</span>(<span class="pl-args"><span class="pl-var">_left_empty</span></span>)</span><span class="pl-infix">;</span><span class="pl-compound"><span class="pl-functor">call_as_prolog</span>(<span class="pl-args"><span class="pl-var">_right_empty</span></span>)</span></span>, 
                    <span class="pl-var">L</span>)  ,
                  <span class="pl-var">P1_CODE_561</span> =  
                       
                    <span class="pl-atom">as_p1</span>( 
                       <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd559</span></span>]</span>, 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>), 
                       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd560</span></span>]</span>, <span class="pl-var">RetTypeNotCd561</span>, <span class="pl-var">P1_CODE_RESULT_561</span>, 
                       [ <span class="pl-atom">'let*'</span>, 
                         [ [ <span class="pl-var">F</span>, 
                             [ <span class="pl-atom">'println!'</span>, 
                               [ <span class="pl-atom">'can-unify'</span>, <span class="pl-atom">called</span>, <span class="pl-atom">with</span>, <span class="pl-var">_l_body</span>, 
                                 <span class="pl-var">_r_body</span>]]], 
                           [ <span class="pl-var">_l_head</span>, 
                             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_l_body</span></span>]</span>], 
                           [ <span class="pl-var">_l_tail</span>, 
                             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_l_body</span></span>]</span>], 
                           [ <span class="pl-var">_r_head</span>, 
                             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_r_body</span></span>]</span>], 
                           [ <span class="pl-var">_r_tail</span>, 
                             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_r_body</span></span>]</span>], 
                           [ <span class="pl-var">_head_unify</span>, 
                             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify-expr'</span>, <span class="pl-var">_l_head</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
                         [ <span class="pl-atom">if</span>, 
                           <span class="pl-var">_head_unify</span>, 
                           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">_l_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                           <span class="pl-atom">'False'</span>]], 
                       ( <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_l_body</span></span>  ,
                         <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_r_body</span></span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-atom">called</span>, <span class="pl-atom">with</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span></span>)</span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">O</span>, <span class="pl-var">F</span></span>)</span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_l_body</span></span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">P</span>, <span class="pl-var">_l_head</span></span>)</span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_l_body</span></span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">Q</span>, <span class="pl-var">_l_tail</span></span>)</span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_r_body</span></span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">R</span>, <span class="pl-var">_r_head</span></span>)</span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-var">S</span><span class="pl-infix">=</span><span class="pl-var">_r_body</span></span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">S</span>, <span class="pl-var">_r_tail</span></span>)</span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_l_head</span></span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-var">U</span><span class="pl-infix">=</span><span class="pl-var">_r_head</span></span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'can-unify-expr'</span>, <span class="pl-var">T</span>, <span class="pl-var">U</span>, <span class="pl-var">_head_unify</span></span>)</span> , 
                         <span class="pl-compound pl-level-0"><span class="pl-var">V</span><span class="pl-infix">=</span><span class="pl-var">_head_unify</span></span> , 
                         <span class="pl-var">P1_CODE_562</span> =  
                              
                           <span class="pl-atom">as_p1</span>( 
                              <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd560</span></span>]</span>, 
                                <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd559</span></span>]</span>, 
                                  <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>)), 
                              <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd561</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_562</span>, 
                              <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">_l_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                              ( <span class="pl-compound pl-level-0"><span class="pl-var">W</span><span class="pl-infix">=</span><span class="pl-var">_l_tail</span></span>  ,
                                <span class="pl-compound pl-level-0"><span class="pl-var">X</span><span class="pl-infix">=</span><span class="pl-var">_r_tail</span></span> , 
                                <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">W</span>, <span class="pl-var">X</span>, <span class="pl-var">P1_CODE_RESULT_562</span></span>)</span>)) , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">V</span>, <span class="pl-var">P1_CODE_562</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_RESULT_561</span></span>)</span>)) , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">L</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_561</span>, <span class="pl-var">P1_CODE_RESULT_560</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">K</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_560</span>, <span class="pl-var">P1_CODE_RESULT_559</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_85040818{$P1_CODE_559}</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_85040620{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (can-unify-expr ($link1 $pridicate1 $conclusion) ($link2 $pridicate2 $conclusion2))  
    (if 
      (== $link1 $link2) 
      (let* 
        ( ($can_unify1 (can-unify-ground $pridicate1 $pridicate2)) ($can_unify2 (can-unify-ground $conclusion $conclusion2))) 
        (and $can_unify1 $can_unify2)) False))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'can-unify-expr'</span>, 
     <span class="pl-var">_link1__pridicate1__conclusion1</span>,  <span class="pl-var">_link2__pridicate2__conclusion21</span>, <span class="pl-var">RetVal983</span>) :- 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_link1__pridicate1__conclusion1</span>, [
       <span class="pl-var">_link1</span>, <span class="pl-avar">_86855206{$_pridicate1}</span>, <span class="pl-avar">_86855226{$_conclusion}</span>]) , 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_link2__pridicate2__conclusion21</span>, [
       <span class="pl-var">_link2</span>, <span class="pl-avar">_86855278{$_pridicate2}</span>, <span class="pl-avar">_86855298{$_conclusion2}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_86855186{$_link1}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_86855258{$_link2}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _86855364{$P1_CODE_575} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_575</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_can_unify1</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify-ground'</span>, <span class="pl-var">_pridicate1</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_can_unify2</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify-ground'</span>, <span class="pl-var">_conclusion</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">and</span>, <span class="pl-var">_can_unify1</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_pridicate1</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_pridicate2</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'can-unify-ground'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">_can_unify1</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_conclusion</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_conclusion2</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'can-unify-ground'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_can_unify2</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_575</span><span class="pl-infix">=</span><span class="pl-var">_can_unify1</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_575</span><span class="pl-infix">=</span><span class="pl-var">_can_unify2</span></span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_86855364{$P1_CODE_575}</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_86855134{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (can-unify-ground $ground1 $ground2)  
    (if 
      (== $ground1 $ground2) True 
      (if 
        (or 
          (== 
            (get-metatype $ground1) Variable) 
          (== 
            (get-metatype $ground2) Variable)) True False)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'can-unify-ground'</span>, <span class="pl-var">_ground11</span>, <span class="pl-var">_ground21</span>, <span class="pl-var">RetVal987</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87325638{vn = ..., cns = ...}</span>, <span class="pl-avar">_87325742{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87325666{vn = ..., cns = ...}</span>, <span class="pl-avar">_87325784{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_87325742{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_87325784{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _87325864{$P1_CODE_579} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_579</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">or</span>, 
             [ <span class="pl-atom">==</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_ground1</span></span>]</span>, 
               <span class="pl-atom">'Variable'</span>], 
             [ <span class="pl-atom">==</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_ground2</span></span>]</span>, 
               <span class="pl-atom">'Variable'</span>]], <span class="pl-atom">'True'</span>, <span class="pl-atom">'False'</span>], 
           ((&#13;&#10; 
            (<span class="pl-atom">call_for_unit</span>( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">'get-metatype'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">==</span> <span class="pl-atom">'Variable'</span></span><span class="pl-infix">;</span><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">'get-metatype'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">==</span> <span class="pl-atom">'Variable'</span></span></span>, 
               <span class="pl-var">D</span>)),
            (<span class="pl-compound pl-level-0"><span class="pl-atom">true</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">D</span>, <span class="pl-atom">'True'</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_RESULT_579</span></span>)</span></span>)  ))) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-atom">'True'</span>, <span class="pl-avar">_87325864{$P1_CODE_579}</span>, <span class="pl-avar">_87325694{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (validate-unification $_ $_)  True)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'validate-unification'</span>, <span class="pl-var">_left_body1</span>, <span class="pl-var">_right_body1</span>, <span class="pl-atom">'True'</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87661218{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87661246{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span></span>) ).


%  ; Main function: check if l_pat is more abstract than r_pat with respect to var
/*
  (= (is-blk-syntax-more-abstract $l_pat $r_pat $var)  
    (let* 
      ( ($l_has_var (is-var-exist $l_pat $var)) 
        ($r_has_var (is-var-exist $r_pat $var)) 
        ($both_have_var (and $l_has_var $r_has_var))) 
      (if 
        (not $both_have_var) False 
        (let* 
          ( ($l_body (erase $l_pat $var)) 
            ($r_body (erase $r_pat $var)) 
            ($can_unify_result (can-unify $l_body $r_body))) 
          (if $can_unify_result 
            (validate-unification $l_body $r_body) False)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'is-blk-syntax-more-abstract'</span>, 
     <span class="pl-var">_l_pat13</span>, <span class="pl-var">_r_pat13</span>, <span class="pl-var">_var65</span>, 
     <span class="pl-var">RetVal995</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87863306{vn = ..., cns = ...}</span>, <span class="pl-avar">_87863438{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87863334{vn = ..., cns = ...}</span>, <span class="pl-avar">_87863480{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_87863362{vn = ..., cns = ...}</span>, <span class="pl-avar">_87863522{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_87863438{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_87863522{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_87863590{$_l_has_var}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_87863480{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_87863522{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_87863644{$_r_has_var}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_87863670{$_both_have_var}</span><span class="pl-infix">=</span><span class="pl-avar">_87863590{$_l_has_var}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_87863670{$_both_have_var}</span><span class="pl-infix">=</span><span class="pl-avar">_87863644{$_r_has_var}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-prefix">\+</span><span class="pl-compound"><span class="pl-functor">eval_true</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span></span>)</span></span> , 
     _87863728{$P1_CODE_583} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd583</span>, <span class="pl-var">P1_CODE_RESULT_583</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_l_body</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">erase</span>, <span class="pl-var">_l_pat</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_r_body</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">erase</span>, <span class="pl-var">_r_pat</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_can_unify_result</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">_l_body</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-var">_can_unify_result</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'validate-unification'</span>, <span class="pl-var">_l_body</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-atom">'False'</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_l_pat</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">erase</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">_l_body</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">erase</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">_r_body</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_l_body</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_r_body</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">_can_unify_result</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_can_unify_result</span></span> , 
           <span class="pl-var">P1_CODE_584</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd583</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_584</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'validate-unification'</span>, <span class="pl-var">_l_body</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_l_body</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_r_body</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'validate-unification'</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">P1_CODE_RESULT_584</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_584</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_RESULT_583</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_87863728{$P1_CODE_583}</span>, <span class="pl-avar">_87863390{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (is-blk-more-abstract $l_blk $r_blk $var)  
    (let* 
      ( ($rps (powerset-without-empity $r_blk)) ($l_partitions (partitions $l_blk))) 
      (check-partitions $l_partitions $rps $var)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-blk-more-abstract'</span>, <span class="pl-var">_l_blk1</span>, <span class="pl-var">_r_blk1</span>, <span class="pl-var">_var69</span>, <span class="pl-var">RetVal999</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88632134{vn = ..., cns = ...}</span>, <span class="pl-avar">_88632266{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88632162{vn = ..., cns = ...}</span>, <span class="pl-avar">_88632308{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88632190{vn = ..., cns = ...}</span>, <span class="pl-avar">_88632350{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_88632308{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'powerset-without-empity'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_88632404{$_rps}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_88632266{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">partitions</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_88632444{$_l_partitions}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_88632444{$_l_partitions}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_88632404{$_rps}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_88632350{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'check-partitions'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_88632218{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (check-partitions $partitions $rps $var)  
    (if 
      (== $partitions ()) False 
      (let $lp 
        (car-atom $partitions) 
        (if 
          (check-subsets $lp $rps $var) True 
          (check-partitions 
            (cdr-atom $partitions) $rps $var)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'check-partitions'</span>, <span class="pl-var">_partitions1</span>, <span class="pl-var">_rps1</span>, <span class="pl-var">_var73</span>, <span class="pl-var">RetVal1003</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88859124{vn = ..., cns = ...}</span>, <span class="pl-avar">_88859256{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88859152{vn = ..., cns = ...}</span>, <span class="pl-avar">_88859298{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_88859180{vn = ..., cns = ...}</span>, <span class="pl-avar">_88859340{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_88859256{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _88859414{$P1_CODE_591} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd591</span>, <span class="pl-var">P1_CODE_RESULT_591</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_lp</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_partitions</span></span>]</span>, 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'check-subsets'</span>, <span class="pl-var">_lp</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-atom">'True'</span>, 
             [ <span class="pl-atom">'check-partitions'</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_partitions</span></span>]</span>, <span class="pl-var">_rps</span>, <span class="pl-var">_var</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_partitions</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_lp</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_lp</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_rps</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'check-subsets'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-var">P1_CODE_592</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd591</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_592</span>, 
                [ <span class="pl-atom">'check-partitions'</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_partitions</span></span>]</span>, <span class="pl-var">_rps</span>, <span class="pl-var">_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_partitions</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_rps</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'check-partitions'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_592</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_592</span>, <span class="pl-var">P1_CODE_RESULT_591</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_88859414{$P1_CODE_591}</span>, <span class="pl-avar">_88859208{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Try next partition
%  ;; Check each subset in rps for current partition lp (flat list)
/*
  (= (check-subsets $lp $subsets $var)  
    (if 
      (== $subsets ()) False 
      (let $rs 
        (car-atom $subsets) 
        (if 
          (check-all-blocks $lp $rs $var) True 
          (check-subsets $lp 
            (cdr-atom $subsets) $var)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'check-subsets'</span>, <span class="pl-var">_lp1</span>, <span class="pl-var">_subsets13</span>, <span class="pl-var">_var77</span>, <span class="pl-var">RetVal1007</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89419580{vn = ..., cns = ...}</span>, <span class="pl-avar">_89419712{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89419608{vn = ..., cns = ...}</span>, <span class="pl-avar">_89419754{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89419636{vn = ..., cns = ...}</span>, <span class="pl-avar">_89419796{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_89419754{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _89419870{$P1_CODE_599} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd599</span>, <span class="pl-var">P1_CODE_RESULT_599</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_rs</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_subsets</span></span>]</span>, 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'check-all-blocks'</span>, <span class="pl-var">_lp</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-atom">'True'</span>, 
             [ <span class="pl-atom">'check-subsets'</span>, 
               <span class="pl-var">_lp</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_subsets</span></span>]</span>, 
               <span class="pl-var">_var</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_subsets</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_rs</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_lp</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_rs</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'check-all-blocks'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-var">P1_CODE_600</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd599</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_600</span>, 
                [ <span class="pl-atom">'check-subsets'</span>, 
                  <span class="pl-var">_lp</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_subsets</span></span>]</span>, 
                  <span class="pl-var">_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_lp</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_subsets</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'check-subsets'</span>, <span class="pl-var">H</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_600</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_600</span>, <span class="pl-var">P1_CODE_RESULT_599</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_89419870{$P1_CODE_599}</span>, <span class="pl-avar">_89419664{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Try next subset
%  ;; Check if all blocks in partition match the current subset (flat list)
/*
  (= (check-all-blocks $blocks $rs $var)  
    (if 
      (== $blocks ()) True 
      (let $lb 
        (car-atom $blocks) 
        (if 
          (is-blk-syntax-more-abstract $lb $rs $var) 
          (check-all-blocks 
            (cdr-atom $blocks) $rs $var) False))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'check-all-blocks'</span>, <span class="pl-var">_blocks1</span>, <span class="pl-var">_rs1</span>, <span class="pl-var">_var81</span>, <span class="pl-var">RetVal1011</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89964032{vn = ..., cns = ...}</span>, <span class="pl-avar">_89964164{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89964060{vn = ..., cns = ...}</span>, <span class="pl-avar">_89964206{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_89964088{vn = ..., cns = ...}</span>, <span class="pl-avar">_89964248{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_89964164{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _89964322{$P1_CODE_607} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd607</span>, <span class="pl-var">P1_CODE_RESULT_607</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_lb</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_blocks</span></span>]</span>, 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-blk-syntax-more-abstract'</span>, <span class="pl-var">_lb</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             [ <span class="pl-atom">'check-all-blocks'</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_blocks</span></span>]</span>, <span class="pl-var">_rs</span>, <span class="pl-var">_var</span>], 
             <span class="pl-atom">'False'</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_blocks</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">_lb</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_lb</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_rs</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-blk-syntax-more-abstract'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-var">P1_CODE_608</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd607</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_608</span>, 
                [ <span class="pl-atom">'check-all-blocks'</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_blocks</span></span>]</span>, <span class="pl-var">_rs</span>, <span class="pl-var">_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_blocks</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_rs</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'check-all-blocks'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_608</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_608</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_RESULT_607</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'True'</span>, <span class="pl-avar">_89964322{$P1_CODE_607}</span>, <span class="pl-avar">_89964116{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; One block failed, return False
/*
  (= (is-membership $elem $list)  
    (if 
      (== $list ()) False 
      (let 
        ($head $tail) 
        (decons-atom $list) 
        (if 
          (== $head $elem) True 
          (is-membership $elem $tail)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">_elem1</span>, <span class="pl-var">_list77</span>, <span class="pl-var">RetVal1015</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_90526528{vn = ..., cns = ...}</span>, <span class="pl-avar">_90526632{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_90526556{vn = ..., cns = ...}</span>, <span class="pl-avar">_90526674{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_90526674{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _90526748{$P1_CODE_615} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd615</span>, <span class="pl-var">P1_CODE_RESULT_615</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>, <span class="pl-var">_tail</span></span>]</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">_list</span></span>]</span>, 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-atom">'True'</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">_elem</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_list</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">D</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_elem</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-var">P1_CODE_616</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd615</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_616</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">_elem</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_elem</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_616</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_616</span>, <span class="pl-var">P1_CODE_RESULT_615</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_90526748{$P1_CODE_615}</span>, <span class="pl-avar">_90526584{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; (: merge-list (-> Expression Expression Expression))
/*
  (= (merge-list $list1 $list2)  
    (let $union 
      (union-atom $list1 $list2) 
      (unique-list $union)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">_list15</span>, <span class="pl-var">_list25</span>, <span class="pl-var">RetVal1019</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_90996352{vn = ..., cns = ...}</span>, <span class="pl-avar">_90996456{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_90996380{vn = ..., cns = ...}</span>, <span class="pl-avar">_90996498{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_90996456{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_90996498{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_90996566{$_union}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_90996566{$_union}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'unique-list'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_90996408{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; (: unique-list (-> Expression Expression))
/*
  (= (unique-list $list)  
    (uniq $list ()))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'unique-list'</span>, <span class="pl-var">_list81</span>, <span class="pl-var">RetVal1023</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_91128408{vn = ..., cns = ...}</span>, <span class="pl-avar">_91128484{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_91128484{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-avar">_91128436{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; (: uniq (-> Expression Exprssion Expression))
/*
  (= (uniq $list1 $acc)  
    (if 
      (== $list1 ()) $acc 
      (let* 
        ( ( ($head $tail) (decons-atom $list1))) 
        (if 
          (is-membership $head $acc) 
          (uniq $tail $acc) 
          (let $NewAcc 
            (union-atom $acc 
              ($head)) 
            (uniq $tail $NewAcc))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">_list19</span>, <span class="pl-var">_acc9</span>, <span class="pl-var">RetVal1027</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_91288276{vn = ..., cns = ...}</span>, <span class="pl-avar">_91288380{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_91288304{vn = ..., cns = ...}</span>, <span class="pl-avar">_91288422{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_91288380{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_91288422{vn = ..., cns = ...}</span></span> , 
     _91288508{$P1_CODE_623} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd623</span>, <span class="pl-var">P1_CODE_RESULT_623</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ [    _head   ,   _tail   ],
               [ decons-atom,  _list1   ]]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             [ <span class="pl-atom">let</span>, 
               <span class="pl-var">NewAcc</span>, 
               [ <span class="pl-atom">'union-atom'</span>, 
                 <span class="pl-var">_acc</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>], 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_list1</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'decons-atom'</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-var">E</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_head</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span></span>)</span> , 
           <span class="pl-var">P1_CODE_624</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd623</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_624</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">P1_CODE_RESULT_624</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_625</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd623</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_625</span>, 
                [ <span class="pl-atom">let</span>, 
                  <span class="pl-var">NewAcc</span>, 
                  [ <span class="pl-atom">'union-atom'</span>, 
                    <span class="pl-var">_acc</span>, 
                    <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>], 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-var">K</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">_head</span></span>]</span>, <span class="pl-var">NewAcc</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">NewAcc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">P1_CODE_RESULT_625</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_624</span>, <span class="pl-var">P1_CODE_625</span>, <span class="pl-var">P1_CODE_RESULT_623</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_91288508{$P1_CODE_623}</span>, <span class="pl-avar">_91288332{vn = ..., cns = ...}</span></span>)</span></span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/blk-abstractness.metta at 2025-10-18T23:16:36+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
