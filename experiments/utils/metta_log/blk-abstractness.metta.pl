%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/blk-abstractness.metta at 2025-10-16T14:06:54+03:00
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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">erase</span>, <span class="pl-var">_pattern77</span>, <span class="pl-var">_var33</span>, <span class="pl-var">RetVal787</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67594412{vn = ..., cns = ...}</span>, <span class="pl-avar">_67594516{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67594440{vn = ..., cns = ...}</span>, <span class="pl-avar">_67594558{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67594516{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67594558{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'replace-var'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'@eyob'</span>, <span class="pl-avar">_67594468{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Main replacement function using collapse and superpose
/*
  (= (replace-var $MeTTa_SP__expr_5 $var $replacement)  
    (collapse (replace-var-exp (superpose $MeTTa_SP__expr_5) $var $replacement)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'replace-var'</span>, <span class="pl-var">_expr21</span>, <span class="pl-var">_var37</span>, <span class="pl-var">_replacement1</span>, <span class="pl-var">RetVal791</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67721914{vn = ..., cns = ...}</span>, <span class="pl-avar">_67722046{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67721942{vn = ..., cns = ...}</span>, <span class="pl-avar">_67722088{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67721970{vn = ..., cns = ...}</span>, <span class="pl-avar">_67722130{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       ( <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">superpose</span>, <span class="pl-var">MeTTa_SP__expr_5</span>, <span class="pl-var">B</span></span>)</span>  ,
         <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
         <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_replacement</span></span> , 
         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'replace-var-exp'</span>, <span class="pl-var">B</span>, <span class="pl-var">C</span>, <span class="pl-var">D</span>, <span class="pl-var">A</span></span>)</span>), 
       _67721998{vn = ..., cns = ...})</span>) ).


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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'replace-var-exp'</span>, <span class="pl-var">_exp9</span>, <span class="pl-var">_var41</span>, <span class="pl-var">_replacement5</span>, <span class="pl-var">RetVal795</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67935934{vn = ..., cns = ...}</span>, <span class="pl-avar">_67936066{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67935962{vn = ..., cns = ...}</span>, <span class="pl-avar">_67936108{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_67935990{vn = ..., cns = ...}</span>, <span class="pl-avar">_67936150{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67936066{vn = ..., cns = ...}</span></span> , 
     <span class="pl-atom">unify_with_occurs_check</span>( <span class="pl-var">A</span>, [
       <span class="pl-var">_link</span>, <span class="pl-avar">_67936228{$_var1}</span>, <span class="pl-avar">_67936248{$_var2}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67936228{$_var1}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67936108{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67936150{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'sub-var'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_67936316{$_subvar1}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67936248{$_var2}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67936108{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67936150{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'sub-var'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-avar">_67936384{$_subvar2}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67936208{$_link}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67936316{$_subvar1}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_67936384{$_subvar2}</span></span> , 
     <span class="pl-atom">u_assign</span>( <span class="pl-int">14</span>, 
       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-var">H</span>, <span class="pl-var">I</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
       _67936018{vn = ..., cns = ...})</span>) ).


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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'sub-var'</span>, <span class="pl-var">_atom41</span>, <span class="pl-var">_var45</span>, <span class="pl-var">_replacement9</span>, <span class="pl-var">RetVal799</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68314368{vn = ..., cns = ...}</span>, <span class="pl-avar">_68314500{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68314396{vn = ..., cns = ...}</span>, <span class="pl-avar">_68314542{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68314424{vn = ..., cns = ...}</span>, <span class="pl-avar">_68314584{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68314500{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'Variable'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _68314672{$P1_CODE_431} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_431</span>, 
         [ <span class="pl-atom">if</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">_atom</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">_replacement</span>, <span class="pl-var">_atom</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_atom</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_replacement</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_atom</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_431</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68314500{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_68314672{$P1_CODE_431}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-avar">_68314452{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'var-exist-exp'</span>, <span class="pl-var">_exp13</span>, <span class="pl-var">_var49</span>, <span class="pl-var">RetVal803</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68725204{vn = ..., cns = ...}</span>, <span class="pl-avar">_68725308{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_68725232{vn = ..., cns = ...}</span>, <span class="pl-avar">_68725350{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_68725308{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">checkPat</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _68725416{$P1_CODE_435} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_435</span>, 
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
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-atom">'False'</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_RESULT_435</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_68725416{$P1_CODE_435}</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_68725260{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; Check if variable exists in the entire pattern
/*
  (= (is-var-exist $exp $var)  
    (let $_ 
      (println! (is-var-exist called with exp $exp var $var)) 
      (if 
        (== $exp ()) False 
        (let $is_var_in_exp 
          (var-exist-exp 
            (car-atom $exp) $var) 
          (if $is_var_in_exp True 
            (is-var-exist 
              (cdr-atom $exp) $var))))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-var">_exp17</span>, <span class="pl-var">_var53</span>, <span class="pl-var">RetVal807</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69265736{vn = ..., cns = ...}</span>, <span class="pl-avar">_69265840{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69265764{vn = ..., cns = ...}</span>, <span class="pl-avar">_69265882{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69265840{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69265882{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-atom">called</span>, <span class="pl-atom">with</span>, <span class="pl-atom">exp</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-atom">var</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69265840{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     _69266016{$P1_CODE_439} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd439</span>, <span class="pl-var">P1_CODE_RESULT_439</span>, 
         [ <span class="pl-atom">let</span>, 
           <span class="pl-var">_is_var_in_exp</span>, 
           [ <span class="pl-atom">'var-exist-exp'</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">_exp</span></span>]</span>, 
             <span class="pl-var">_var</span>], 
           [ <span class="pl-atom">if</span>, <span class="pl-var">_is_var_in_exp</span>, <span class="pl-atom">'True'</span>, 
             [ <span class="pl-atom">'is-var-exist'</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_exp</span></span>]</span>, 
               <span class="pl-var">_var</span>]]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_exp</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-var">F</span>, <span class="pl-var">G</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'var-exist-exp'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">_is_var_in_exp</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_is_var_in_exp</span></span> , 
           <span class="pl-var">P1_CODE_440</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd439</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_440</span>, 
                [ <span class="pl-atom">'is-var-exist'</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_exp</span></span>]</span>, 
                  <span class="pl-var">_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_exp</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-var">K</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_440</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_440</span>, <span class="pl-var">P1_CODE_RESULT_439</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_69266016{$P1_CODE_439}</span>, <span class="pl-avar">_69265792{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
              ( ($69988238 (println! (can-unify called with $l_body $r_body))) 
                ($l_head (car-atom $l_body)) 
                ($l_tail (cdr-atom $l_body)) 
                ($r_head (car-atom $r_body)) 
                ($r_tail (cdr-atom $r_body)) 
                ($head_unify (can-unify-expr $l_head $r_head))) 
              (if $head_unify 
                (can-unify $l_tail $r_tail) False))))) False))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">_l_body1</span>, <span class="pl-var">_r_body1</span>, <span class="pl-var">RetVal811</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69993078{vn = ..., cns = ...}</span>, <span class="pl-avar">_69993182{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_69993106{vn = ..., cns = ...}</span>, <span class="pl-avar">_69993224{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69993182{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_69993224{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     _69993332{$P1_CODE_447} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd447</span>, <span class="pl-var">P1_CODE_RESULT_447</span>, 
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
           <span class="pl-var">P1_CODE_448</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd447</span></span>]</span>, <span class="pl-var">RetTypeNotCd448</span>, <span class="pl-var">P1_CODE_RESULT_448</span>, 
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
                  <span class="pl-var">P1_CODE_449</span> =  
                       
                    <span class="pl-atom">as_p1</span>( 
                       <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd447</span></span>]</span>, 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>), 
                       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd448</span></span>]</span>, <span class="pl-var">RetTypeNotCd449</span>, <span class="pl-var">P1_CODE_RESULT_449</span>, 
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
                         <span class="pl-var">P1_CODE_450</span> =  
                              
                           <span class="pl-atom">as_p1</span>( 
                              <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd448</span></span>]</span>, 
                                <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd447</span></span>]</span>, 
                                  <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>)), 
                              <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd449</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_450</span>, 
                              <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">_l_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                              ( <span class="pl-compound pl-level-0"><span class="pl-var">W</span><span class="pl-infix">=</span><span class="pl-var">_l_tail</span></span>  ,
                                <span class="pl-compound pl-level-0"><span class="pl-var">X</span><span class="pl-infix">=</span><span class="pl-var">_r_tail</span></span> , 
                                <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">W</span>, <span class="pl-var">X</span>, <span class="pl-var">P1_CODE_RESULT_450</span></span>)</span>)) , 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">V</span>, <span class="pl-var">P1_CODE_450</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_RESULT_449</span></span>)</span>)) , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">L</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_449</span>, <span class="pl-var">P1_CODE_RESULT_448</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">K</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_448</span>, <span class="pl-var">P1_CODE_RESULT_447</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_69993332{$P1_CODE_447}</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_69993134{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
     <span class="pl-var">_link1__pridicate1__conclusion1</span>,  <span class="pl-var">_link2__pridicate2__conclusion21</span>, <span class="pl-var">RetVal815</span>) :- 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_link1__pridicate1__conclusion1</span>, [
       <span class="pl-var">_link1</span>, <span class="pl-avar">_71807720{$_pridicate1}</span>, <span class="pl-avar">_71807740{$_conclusion}</span>]) , 
     <span class="pl-atom">eval_and_unify</span>( <span class="pl-var">_link2__pridicate2__conclusion21</span>, [
       <span class="pl-var">_link2</span>, <span class="pl-avar">_71807792{$_pridicate2}</span>, <span class="pl-avar">_71807812{$_conclusion2}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71807700{$_link1}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_71807772{$_link2}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _71807878{$P1_CODE_463} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_463</span>, 
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
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_463</span><span class="pl-infix">=</span><span class="pl-var">_can_unify1</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P1_CODE_RESULT_463</span><span class="pl-infix">=</span><span class="pl-var">_can_unify2</span></span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_71807878{$P1_CODE_463}</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_71807648{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'can-unify-ground'</span>, <span class="pl-var">_ground11</span>, <span class="pl-var">_ground21</span>, <span class="pl-var">RetVal819</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72278152{vn = ..., cns = ...}</span>, <span class="pl-avar">_72278256{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72278180{vn = ..., cns = ...}</span>, <span class="pl-avar">_72278298{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72278256{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72278298{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     _72278378{$P1_CODE_467} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-anon">_</span>, <span class="pl-var">P1_CODE_RESULT_467</span>, 
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
            (<span class="pl-compound pl-level-0"><span class="pl-atom">true</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">D</span>, <span class="pl-atom">'True'</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_RESULT_467</span></span>)</span></span>)  ))) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-atom">'True'</span>, <span class="pl-avar">_72278378{$P1_CODE_467}</span>, <span class="pl-avar">_72278208{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (validate-unification $_ $_)  True)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'validate-unification'</span>, <span class="pl-var">_left_body1</span>, <span class="pl-var">_right_body1</span>, <span class="pl-atom">'True'</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72613732{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72613760{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span></span>) ).


%  ; Main function: check if l_pat is more abstract than r_pat with respect to var
/*
  (= (is-blk-syntax-more-abstract $l_pat $r_pat $var)  
    (let* 
      ( ($l_has_var (is-var-exist $l_pat $var)) 
        ($r_has_var (is-var-exist $r_pat $var)) 
        ($_ (println! (is-blk-syntax-more-abstract called with l_pat $l_pat r_pat $r_pat var $var l_has_var $l_has_var r_has_var $r_has_var))) 
        ($both_have_var (and $l_has_var $r_has_var))) 
      (if 
        (not $both_have_var) False 
        (let* 
          ( ($l_body (erase $l_pat $var)) 
            ($r_body (erase $r_pat $var)) 
            ($72878266 (println! (is-blk-syntax-more-abstract called with l_body $l_body r_body $r_body var $var))) 
            ($can_unify_result (can-unify $l_body $r_body)) 
            ($72878386 (println! (can-unify result is $can_unify_result)))) 
          (if $can_unify_result 
            (validate-unification $l_body $r_body) False)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">'is-blk-syntax-more-abstract'</span>, 
     <span class="pl-var">_l_pat13</span>, <span class="pl-var">_r_pat13</span>, <span class="pl-var">_var57</span>, 
     <span class="pl-var">RetVal827</span>) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72881902{vn = ..., cns = ...}</span>, <span class="pl-avar">_72882034{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72881930{vn = ..., cns = ...}</span>, <span class="pl-avar">_72882076{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_72881958{vn = ..., cns = ...}</span>, <span class="pl-avar">_72882118{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72882034{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72882118{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_72882186{$_l_has_var}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72882076{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72882118{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-var-exist'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-avar">_72882240{$_r_has_var}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72882034{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72882076{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72882118{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72882186{$_l_has_var}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_72882240{$_r_has_var}</span></span> , 
     <span class="pl-atom">s</span>( <span class="pl-atom">'is-blk-syntax-more-abstract'</span>, 
       <span class="pl-atom">called</span>, <span class="pl-atom">with</span>, <span class="pl-atom">l_pat</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-atom">r_pat</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-atom">var</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-atom">l_has_var</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-atom">r_has_var</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_72882374{$_both_have_var}</span><span class="pl-infix">=</span><span class="pl-avar">_72882186{$_l_has_var}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_72882374{$_both_have_var}</span><span class="pl-infix">=</span><span class="pl-avar">_72882240{$_r_has_var}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-prefix">\+</span><span class="pl-compound"><span class="pl-functor">eval_true</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-ellipsis">...</span> <span class="pl-infix">=</span> <span class="pl-ellipsis">...</span></span></span>)</span></span> , 
     _72882432{$P1_CODE_471} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd471</span>, <span class="pl-var">P1_CODE_RESULT_471</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_l_body</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">erase</span>, <span class="pl-var">_l_pat</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_r_body</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">erase</span>, <span class="pl-var">_r_pat</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">L</span>, 
               [ <span class="pl-atom">'println!'</span>, 
                 [ <span class="pl-atom">'is-blk-syntax-more-abstract'</span>, <span class="pl-atom">called</span>, <span class="pl-atom">with</span>, <span class="pl-atom">l_body</span>, 
                   <span class="pl-var">_l_body</span>, <span class="pl-atom">r_body</span>, 
                   <span class="pl-var">_r_body</span>, <span class="pl-atom">var</span>, <span class="pl-var">_var</span>]]], 
             [ <span class="pl-var">_can_unify_result</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">_l_body</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">M</span>, 
               [ <span class="pl-atom">'println!'</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-atom">result</span>|<span class="pl-ellipsis">...</span></span>]</span>]]], 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-var">_can_unify_result</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'validate-unification'</span>, <span class="pl-var">_l_body</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
             <span class="pl-atom">'False'</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_l_pat</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">erase</span>, <span class="pl-var">N</span>, <span class="pl-var">O</span>, <span class="pl-var">_l_body</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_r_pat</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Q</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">erase</span>, <span class="pl-var">P</span>, <span class="pl-var">Q</span>, <span class="pl-var">_r_body</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">R</span><span class="pl-infix">=</span><span class="pl-var">_l_body</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">S</span><span class="pl-infix">=</span><span class="pl-var">_r_body</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">T</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-atom">s</span>( <span class="pl-atom">'is-blk-syntax-more-abstract'</span>, 
             <span class="pl-atom">called</span>, <span class="pl-atom">with</span>, <span class="pl-atom">l_body</span>, <span class="pl-var">R</span>, <span class="pl-atom">r_body</span>, 
             <span class="pl-var">S</span>, <span class="pl-atom">var</span>, <span class="pl-var">T</span>, <span class="pl-var">U</span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">U</span>, <span class="pl-var">L</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">V</span><span class="pl-infix">=</span><span class="pl-var">_l_body</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">W</span><span class="pl-infix">=</span><span class="pl-var">_r_body</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-var">V</span>, <span class="pl-var">W</span>, <span class="pl-var">_can_unify_result</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">X</span><span class="pl-infix">=</span><span class="pl-var">_can_unify_result</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'can-unify'</span>, <span class="pl-atom">result</span>, <span class="pl-atom">is</span>, <span class="pl-var">X</span>, <span class="pl-var">Y</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-var">Y</span>, <span class="pl-var">M</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">Z</span><span class="pl-infix">=</span><span class="pl-var">_can_unify_result</span></span> , 
           <span class="pl-var">P1_CODE_472</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd471</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_472</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'validate-unification'</span>, <span class="pl-var">_l_body</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">A1</span><span class="pl-infix">=</span><span class="pl-var">_l_body</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">B1</span><span class="pl-infix">=</span><span class="pl-var">_r_body</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'validate-unification'</span>, <span class="pl-var">A1</span>, <span class="pl-var">B1</span>, <span class="pl-var">P1_CODE_RESULT_472</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">Z</span>, <span class="pl-var">P1_CODE_472</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_RESULT_471</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_72882432{$P1_CODE_471}</span>, <span class="pl-avar">_72881986{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (is-blk-more-abstract $l_blk $r_blk $var)  
    (let* 
      ( ($rps (powerset-without-empity $r_blk)) ($l_partitions (partitions $l_blk))) 
      (check-partitions $l_partitions $rps $var)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-blk-more-abstract'</span>, <span class="pl-var">_l_blk1</span>, <span class="pl-var">_r_blk1</span>, <span class="pl-var">_var61</span>, <span class="pl-var">RetVal831</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74147710{vn = ..., cns = ...}</span>, <span class="pl-avar">_74147842{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74147738{vn = ..., cns = ...}</span>, <span class="pl-avar">_74147884{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74147766{vn = ..., cns = ...}</span>, <span class="pl-avar">_74147926{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74147884{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'powerset-without-empity'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_74147980{$_rps}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74147842{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">partitions</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_74148020{$_l_partitions}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74148020{$_l_partitions}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74147980{$_rps}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74147926{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'check-partitions'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_74147794{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'check-partitions'</span>, <span class="pl-var">_partitions1</span>, <span class="pl-var">_rps1</span>, <span class="pl-var">_var65</span>, <span class="pl-var">RetVal835</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74374648{vn = ..., cns = ...}</span>, <span class="pl-avar">_74374780{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74374676{vn = ..., cns = ...}</span>, <span class="pl-avar">_74374822{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74374704{vn = ..., cns = ...}</span>, <span class="pl-avar">_74374864{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74374780{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _74374938{$P1_CODE_479} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd479</span>, <span class="pl-var">P1_CODE_RESULT_479</span>, 
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
           <span class="pl-var">P1_CODE_480</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd479</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_480</span>, 
                [ <span class="pl-atom">'check-partitions'</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_partitions</span></span>]</span>, <span class="pl-var">_rps</span>, <span class="pl-var">_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_partitions</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_rps</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'check-partitions'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_480</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_480</span>, <span class="pl-var">P1_CODE_RESULT_479</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_74374938{$P1_CODE_479}</span>, <span class="pl-avar">_74374732{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'check-subsets'</span>, <span class="pl-var">_lp1</span>, <span class="pl-var">_subsets1</span>, <span class="pl-var">_var69</span>, <span class="pl-var">RetVal839</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74935104{vn = ..., cns = ...}</span>, <span class="pl-avar">_74935236{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74935132{vn = ..., cns = ...}</span>, <span class="pl-avar">_74935278{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_74935160{vn = ..., cns = ...}</span>, <span class="pl-avar">_74935320{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_74935278{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _74935394{$P1_CODE_487} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd487</span>, <span class="pl-var">P1_CODE_RESULT_487</span>, 
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
           <span class="pl-var">P1_CODE_488</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd487</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_488</span>, 
                [ <span class="pl-atom">'check-subsets'</span>, 
                  <span class="pl-var">_lp</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_subsets</span></span>]</span>, 
                  <span class="pl-var">_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_lp</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_subsets</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'check-subsets'</span>, <span class="pl-var">H</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_488</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_488</span>, <span class="pl-var">P1_CODE_RESULT_487</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_74935394{$P1_CODE_487}</span>, <span class="pl-avar">_74935188{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'check-all-blocks'</span>, <span class="pl-var">_blocks1</span>, <span class="pl-var">_rs1</span>, <span class="pl-var">_var73</span>, <span class="pl-var">RetVal843</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_75479548{vn = ..., cns = ...}</span>, <span class="pl-avar">_75479680{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_75479576{vn = ..., cns = ...}</span>, <span class="pl-avar">_75479722{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_75479604{vn = ..., cns = ...}</span>, <span class="pl-avar">_75479764{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_75479680{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _75479838{$P1_CODE_495} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd495</span>, <span class="pl-var">P1_CODE_RESULT_495</span>, 
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
           <span class="pl-var">P1_CODE_496</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd495</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_496</span>, 
                [ <span class="pl-atom">'check-all-blocks'</span>, 
                  <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">_blocks</span></span>]</span>, <span class="pl-var">_rs</span>, <span class="pl-var">_var</span>], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_blocks</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span></span>)</span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_rs</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-var">K</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'check-all-blocks'</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span>, <span class="pl-var">P1_CODE_RESULT_496</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-var">P1_CODE_496</span>, <span class="pl-atom">'False'</span>, <span class="pl-var">P1_CODE_RESULT_495</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'True'</span>, <span class="pl-avar">_75479838{$P1_CODE_495}</span>, <span class="pl-avar">_75479632{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">_elem1</span>, <span class="pl-var">_list73</span>, <span class="pl-var">RetVal847</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_76042044{vn = ..., cns = ...}</span>, <span class="pl-avar">_76042148{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_76042072{vn = ..., cns = ...}</span>, <span class="pl-avar">_76042190{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_76042190{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _76042264{$P1_CODE_503} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd503</span>, <span class="pl-var">P1_CODE_RESULT_503</span>, 
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
           <span class="pl-var">P1_CODE_504</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd503</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_504</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">_elem</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_elem</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'is-membership'</span>, <span class="pl-var">H</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_RESULT_504</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">G</span>, <span class="pl-atom">'True'</span>, <span class="pl-var">P1_CODE_504</span>, <span class="pl-var">P1_CODE_RESULT_503</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-avar">_76042264{$P1_CODE_503}</span>, <span class="pl-avar">_76042100{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; (: merge-list (-> Expression Expression Expression))
/*
  (= (merge-list $list1 $list2)  
    (let $union 
      (union-atom $list1 $list2) 
      (unique-list $union)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'merge-list'</span>, <span class="pl-var">_list11</span>, <span class="pl-var">_list21</span>, <span class="pl-var">RetVal851</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_76511868{vn = ..., cns = ...}</span>, <span class="pl-avar">_76511972{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_76511896{vn = ..., cns = ...}</span>, <span class="pl-avar">_76512014{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_76511972{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_76512014{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'union-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_76512082{$_union}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_76512082{$_union}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'unique-list'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_76511924{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ; (: unique-list (-> Expression Expression))
/*
  (= (unique-list $list)  
    (uniq $list ()))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'unique-list'</span>, <span class="pl-var">_list77</span>, <span class="pl-var">RetVal855</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_76643924{vn = ..., cns = ...}</span>, <span class="pl-avar">_76644000{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_76644000{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-avar">_76643952{vn = ..., cns = ...}</span></span>)</span></span>) ).


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
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">_list15</span>, <span class="pl-var">_acc9</span>, <span class="pl-var">RetVal859</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_76803792{vn = ..., cns = ...}</span>, <span class="pl-avar">_76803896{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_76803820{vn = ..., cns = ...}</span>, <span class="pl-avar">_76803938{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_76803896{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_76803938{vn = ..., cns = ...}</span></span> , 
     _76804024{$P1_CODE_511} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd511</span>, <span class="pl-var">P1_CODE_RESULT_511</span>, 
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
           <span class="pl-var">P1_CODE_512</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd511</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_512</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">_tail</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span>  ,
                  <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_acc</span></span> , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">I</span>, <span class="pl-var">J</span>, <span class="pl-var">P1_CODE_RESULT_512</span></span>)</span>)) , 
           <span class="pl-var">P1_CODE_513</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd511</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_513</span>, 
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
                  <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">uniq</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">P1_CODE_RESULT_513</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_512</span>, <span class="pl-var">P1_CODE_513</span>, <span class="pl-var">P1_CODE_RESULT_511</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_76804024{$P1_CODE_511}</span>, <span class="pl-avar">_76803848{vn = ..., cns = ...}</span></span>)</span></span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/blk-abstractness.metta at 2025-10-16T14:07:13+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
