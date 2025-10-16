%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/index_to_var.metta at 2025-10-16T14:06:45+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

/*
  (= (debruijn2num Z)  0)
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">debruijn2num</span>, <span class="pl-var">Z5</span>, <span class="pl-int">0</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_62543836{vn = ..., cns = ...}</span>, <span class="pl-atom">'Z'</span></span>)</span></span>) ).


/*
  (= (debruijn2num (S $k))  
    (+ 1 
      (debruijn2num $k)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">debruijn2num</span>, <span class="pl-var">S__k5</span>, <span class="pl-var">RetVal739</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_62639186{vn = ..., cns = ...}</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'S'</span>|<span class="pl-ellipsis">...</span></span>]</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_62639272{$_k}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">debruijn2num</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-int">1</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_62639214{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (fromNum $n)  
    (if 
      (<= $n 0) Z 
      (S (fromNum (- $n 1)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">fromNum</span>, <span class="pl-var">_n5</span>, <span class="pl-var">RetVal743</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_62761228{vn = ..., cns = ...}</span>, <span class="pl-avar">_62761304{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_62761304{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">&lt;=</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _62761378{$P1_CODE_383} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Nat'</span>, <span class="pl-var">P1_CODE_RESULT_383</span>, 
         [ <span class="pl-atom">'S'</span>, 
           [ <span class="pl-atom">fromNum</span>, 
             <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_n</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_n</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">C</span>, <span class="pl-int">1</span>, <span class="pl-var">D</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">fromNum</span>, <span class="pl-var">D</span>, <span class="pl-var">E</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">mi</span>(<span class="pl-args"><span class="pl-atom">'S'</span>, <span class="pl-var">E</span>, <span class="pl-var">P1_CODE_RESULT_383</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'Z'</span>, <span class="pl-avar">_62761378{$P1_CODE_383}</span>, <span class="pl-avar">_62761256{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (make_var1 $x)  
    (let $v 
      (format-args "$var{}" 
        ($x)) 
      (parse (parse (repr $v)))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">make_var1</span>, <span class="pl-var">_x33</span>, <span class="pl-var">RetVal747</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63008294{vn = ..., cns = ...}</span>, <span class="pl-avar">_63008370{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'format-args'</span>, <span class="pl-string">"$var{}"</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-avar">_63008370{vn = ..., cns = ...}</span></span>]</span>, <span class="pl-avar">_63008426{$_v}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63008426{$_v}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">repr</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">parse</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">parse</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_63008322{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (generate $x)  
    (let* 
      ( ($num (eval (debruijn2num $x)))) 
      (make_var1 $num)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">generate</span>, <span class="pl-var">_x37</span>, <span class="pl-var">RetVal751</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63147282{vn = ..., cns = ...}</span>, <span class="pl-avar">_63147358{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63147358{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">debruijn2num</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_63147412{$_num}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63147412{$_num}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">make_var1</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_63147310{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (replacev $pattern)  
    (map-atom $pattern $x 
      (if 
        (== 
          (get-type $x) Nat) 
        (generate $x) 
        (if 
          (and 
            (not (== (get-type $x) Nat)) 
            (== 
              (get-metatype $x) Expression)) 
          (replacev $x) $x))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">replacev</span>, <span class="pl-var">_pattern61</span>, <span class="pl-var">RetVal755</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63336502{vn = ..., cns = ...}</span>, <span class="pl-avar">_63336578{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63336578{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63336630{$_x}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63336630{$_x}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-type'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-atom">'Nat'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     _63336704{$P1_CODE_387} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'Atom'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_387</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">generate</span>, <span class="pl-var">_x</span></span>]</span>, 
         <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">generate</span>, <span class="pl-var">F</span>, <span class="pl-var">P1_CODE_RESULT_387</span></span>)</span></span>) , 
     _63336790{$P1_CODE_388} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'Atom'</span></span>]</span>, <span class="pl-var">RetTypeNotCd388</span>, <span class="pl-var">P1_CODE_RESULT_388</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">and</span>, 
             [ <span class="pl-atom">not</span>, 
               [ <span class="pl-atom">==</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-type'</span>, <span class="pl-var">_x</span></span>]</span>, 
                 <span class="pl-atom">'Nat'</span>]], 
             [ <span class="pl-atom">==</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_x</span></span>]</span>, 
               <span class="pl-atom">'Expression'</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">replacev</span>, <span class="pl-var">_x</span></span>]</span>, 
           <span class="pl-var">_x</span>], 
         ( ( <span class="pl-atom">\+</span> ( 
              eval_true( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span></span></span>)) )  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">K</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-var">P1_CODE_389</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd388</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_389</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">replacev</span>, <span class="pl-var">_x</span></span>]</span>, 
                <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">replacev</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_389</span></span>)</span></span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_389</span>, <span class="pl-var">M</span>, <span class="pl-var">P1_CODE_RESULT_388</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_63336704{$P1_CODE_387}</span>, <span class="pl-avar">_63336790{$P1_CODE_388}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'map-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span>, <span class="pl-avar">_63336530{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (num2deb $pattern)  
    (map-atom $pattern $x 
      (if 
        (== 
          (get-type $x) Number) 
        (fromNum $x) 
        (if 
          (and 
            (not (== (get-type $x) Number)) 
            (== 
              (get-metatype $x) Expression)) 
          (num2deb $x) $x))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">num2deb</span>, <span class="pl-var">_pattern65</span>, <span class="pl-var">RetVal759</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_63987960{vn = ..., cns = ...}</span>, <span class="pl-avar">_63988036{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63988036{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63988088{$_x}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_63988088{$_x}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-type'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-atom">'Number'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     _63988162{$P1_CODE_399} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'Atom'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_399</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">fromNum</span>, <span class="pl-var">_x</span></span>]</span>, 
         <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">fromNum</span>, <span class="pl-var">F</span>, <span class="pl-var">P1_CODE_RESULT_399</span></span>)</span></span>) , 
     _63988248{$P1_CODE_400} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'Atom'</span></span>]</span>, <span class="pl-var">RetTypeNotCd400</span>, <span class="pl-var">P1_CODE_RESULT_400</span>, 
         [ <span class="pl-atom">if</span>, 
           [ <span class="pl-atom">and</span>, 
             [ <span class="pl-atom">not</span>, 
               [ <span class="pl-atom">==</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-type'</span>, <span class="pl-var">_x</span></span>]</span>, 
                 <span class="pl-atom">'Number'</span>]], 
             [ <span class="pl-atom">==</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">_x</span></span>]</span>, 
               <span class="pl-atom">'Expression'</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">num2deb</span>, <span class="pl-var">_x</span></span>]</span>, 
           <span class="pl-var">_x</span>], 
         ( ( <span class="pl-atom">\+</span> ( 
              eval_true( <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span></span></span>)) )  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">J</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-var">J</span>, <span class="pl-var">K</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-var">K</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">I</span></span>)</span> , 
           <span class="pl-var">P1_CODE_401</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd400</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_401</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">num2deb</span>, <span class="pl-var">_x</span></span>]</span>, 
                <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">L</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">num2deb</span>, <span class="pl-var">L</span>, <span class="pl-var">P1_CODE_RESULT_401</span></span>)</span></span>) , 
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span><span class="pl-infix">=</span><span class="pl-var">_x</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">I</span>, <span class="pl-var">P1_CODE_401</span>, <span class="pl-var">M</span>, <span class="pl-var">P1_CODE_RESULT_400</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_63988162{$P1_CODE_399}</span>, <span class="pl-avar">_63988248{$P1_CODE_400}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'map-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">13</span></span>)</span>, <span class="pl-avar">_63987988{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (replace $pattern)  
    (let* 
      ( ( ($numpat $_ $_) (var2num $pattern 0 ())) ($deb (num2deb $numpat))) $deb))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">replace</span>, <span class="pl-var">_pattern69</span>, <span class="pl-var">RetVal763</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64598382{vn = ..., cns = ...}</span>, <span class="pl-avar">_64598458{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64598458{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">var2num</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-atom">unify_with_occurs_check</span>( <span class="pl-var">B</span>, [
       <span class="pl-var">_numpat</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span>, <span class="pl-compound pl-level-0"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64598540{$_numpat}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">num2deb</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_64598580{$_deb}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_64598410{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_64598580{$_deb}</span></span></span>) ).


/*
  (= (var2num () $index $list)  
    (() $index $list))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">var2num</span>, <span class="pl-var">Nil69</span>, <span class="pl-var">_index1</span>, <span class="pl-var">_list57</span>, <span class="pl-var">RetVal767</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_64798524{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64798552{vn = ..., cns = ...}</span>, <span class="pl-avar">_64798668{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64798580{vn = ..., cns = ...}</span>, <span class="pl-avar">_64798710{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64798668{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64798710{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">13</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args">[]|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-avar">_64798608{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (check $list $var)  
    (if 
      (== 
        (intersection-atom $list $var) ()) False True))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">check</span>, <span class="pl-var">_list61</span>, <span class="pl-var">_var21</span>, <span class="pl-var">RetVal771</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64934618{vn = ..., cns = ...}</span>, <span class="pl-avar">_64934722{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64934646{vn = ..., cns = ...}</span>, <span class="pl-avar">_64934764{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">intersection</span>(<span class="pl-args"><span class="pl-avar">_64934722{vn = ..., cns = ...}</span>, <span class="pl-avar">_64934764{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, [], <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'False'</span>, <span class="pl-atom">'True'</span>, <span class="pl-avar">_64934674{vn = ..., cns = ...}</span></span>)</span></span>) ).


/*
  (= (find_index () $_ $_)  )
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">find_index</span>, <span class="pl-var">Nil73</span>, <span class="pl-var">_var25</span>, <span class="pl-var">_index5</span>, []</span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">eval_and_unify</span>(<span class="pl-args"><span class="pl-avar">_65093998{vn = ..., cns = ...}</span>, []</span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65094026{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65094054{vn = ..., cns = ...}</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0">[]<span class="pl-infix">=~</span>[]</span></span>) ).


/*
  (= (find_index $list $var $index)  
    (let* 
      ( ($head (car-atom $list)) 
        ($tail (cdr-atom $list)) 
        ($res (if (== $head $var) $index (find_index $tail $var (+ $index 1))))) $res))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">find_index</span>, <span class="pl-var">_list65</span>, <span class="pl-var">_var29</span>, <span class="pl-var">_index9</span>, <span class="pl-var">RetVal779</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65257696{vn = ..., cns = ...}</span>, <span class="pl-avar">_65257828{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65257724{vn = ..., cns = ...}</span>, <span class="pl-avar">_65257870{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65257752{vn = ..., cns = ...}</span>, <span class="pl-avar">_65257912{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65257828{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_65257966{$_head}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65257828{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_65258006{$_tail}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65257966{$_head}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65257870{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65257912{vn = ..., cns = ...}</span></span> , 
     _65258084{$P1_CODE_411} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_411</span>, 
         [ <span class="pl-atom">find_index</span>, <span class="pl-var">_tail</span>, <span class="pl-var">_var</span>, 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">_index</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_tail</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_var</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">I</span><span class="pl-infix">=</span><span class="pl-var">_index</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-var">I</span>, <span class="pl-int">1</span>, <span class="pl-var">J</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">find_index</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">J</span>, <span class="pl-var">P1_CODE_RESULT_411</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-avar">_65258084{$P1_CODE_411}</span>, <span class="pl-avar">_65258250{$_res}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_65257780{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_65258250{$_res}</span></span></span>) ).


/*
  (= (var2num $pattern intersection-atom $list)  
    (let* 
      ( (intersection-atom (car-atom $pattern)) 
        ($tail (cdr-atom $pattern)) 
        ($is_var (== (get-metatype intersection-atom) Variable)) 
        ($is_expr (== (get-metatype intersection-atom) Expression)) 
        ($check (check $list (intersection-atom))) 
        ($processed_head_and_index (if $is_expr (var2num intersection-atom intersection-atom $list) (if $is_var (if $check ((find_index $list intersection-atom 0) intersection-atom $list) (intersection-atom (+ intersection-atom 1) (union-atom $list (intersection-atom)))) (intersection-atom intersection-atom $list)))) 
        ( ($res_head $new_index $new_list) $processed_head_and_index) 
        ($processed_tail_and_index (var2num $tail $new_index $new_list)) 
        ( ($res_tail $final_index $final_list) $processed_tail_and_index)) 
      ( (cons-atom $res_head $res_tail) $final_index $final_list)))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-atom">mc</span>( <span class="pl-atom">var2num</span>, 
     <span class="pl-var">_pattern73</span>, <span class="pl-var">_index13</span>, <span class="pl-var">_list69</span>, 
     [ <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_res_head</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">_final_index</span>, <span class="pl-var">_final_list</span>]) :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65896612{vn = ..., cns = ...}</span>, <span class="pl-avar">_65896808{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65896640{vn = ..., cns = ...}</span>, <span class="pl-atom">'intersection-atom'</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_65896668{vn = ..., cns = ...}</span>, <span class="pl-avar">_65896864{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65896808{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'car-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">unify_with_occurs_check</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-atom">'intersection-atom'</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65896808{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cdr-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-avar">_65896956{$_tail}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-atom">'intersection-atom'</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-atom">'Variable'</span>, <span class="pl-avar">_65897018{$_is_var}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-atom">'intersection-atom'</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-metatype'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">6</span></span>)</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-avar">_65897080{$_is_expr}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65896864{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">8</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-atom">'intersection-atom'</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">u_assign</span>(<span class="pl-args"><span class="pl-int">14</span>, <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>]</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">check</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">7</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">9</span></span>)</span>, <span class="pl-avar">_65897154{$_check}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">10</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65897080{$_is_expr}</span></span> , 
     _65897192{$P1_CODE_415} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span>, <span class="pl-var">P1_CODE_RESULT_415</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">var2num</span>, <span class="pl-atom">'intersection-atom'</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">L</span> <span class="pl-infix">=</span> <span class="pl-atom">'intersection-atom'</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-var">M</span> <span class="pl-infix">=</span> <span class="pl-atom">'intersection-atom'</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">N</span><span class="pl-infix">=</span><span class="pl-var">_list</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">var2num</span>, <span class="pl-var">L</span>, <span class="pl-var">M</span>, <span class="pl-var">N</span>, <span class="pl-var">P1_CODE_RESULT_415</span></span>)</span>)) , 
     _65897318{$P1_CODE_416} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-var">RetTypeNotCd416</span>, <span class="pl-var">P1_CODE_RESULT_416</span>, 
         [ <span class="pl-atom">if</span>, 
           <span class="pl-var">_is_var</span>, 
           [ <span class="pl-atom">if</span>, 
             <span class="pl-var">_check</span>, 
             [ <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">find_index</span>, <span class="pl-var">_list</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'intersection-atom'</span>, <span class="pl-var">_list</span>], 
             [ <span class="pl-atom">'intersection-atom'</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-atom">'intersection-atom'</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
               [ <span class="pl-atom">'union-atom'</span>, 
                 <span class="pl-var">_list</span>, 
                 <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'intersection-atom'</span></span>]</span>]]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'intersection-atom'</span>, <span class="pl-atom">'intersection-atom'</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">O</span><span class="pl-infix">=</span><span class="pl-var">_is_var</span></span>  ,
           <span class="pl-var">P1_CODE_417</span> =  
                
             <span class="pl-atom">as_p1</span>( 
                <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>, 
                <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd416</span></span>]</span>, <span class="pl-var">RetTypeNotCd417</span>, <span class="pl-var">P1_CODE_RESULT_417</span>, 
                [ <span class="pl-atom">if</span>, 
                  <span class="pl-var">_check</span>, 
                  [ <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">find_index</span>, <span class="pl-var">_list</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'intersection-atom'</span>, <span class="pl-var">_list</span>], 
                  [ <span class="pl-atom">'intersection-atom'</span>, 
                    <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-atom">'intersection-atom'</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                    [ <span class="pl-atom">'union-atom'</span>, 
                      <span class="pl-var">_list</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'intersection-atom'</span></span>]</span>]]], 
                ( <span class="pl-compound pl-level-0"><span class="pl-var">P</span><span class="pl-infix">=</span><span class="pl-var">_check</span></span>  ,
                  <span class="pl-var">P1_CODE_418</span> =  
                       
                    <span class="pl-atom">as_p1</span>( 
                       <span class="pl-atom">cr</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd416</span></span>]</span>, 
                         <span class="pl-compound pl-level-0"><span class="pl-functor">cr</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'%Undefined%'</span></span>)</span>), 
                       <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-var">RetTypeNotCd417</span></span>]</span>, 
                       <span class="pl-anon">_</span>, 
                       [ <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">find_index</span>, <span class="pl-var">_list</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'intersection-atom'</span>, <span class="pl-var">_list</span>], 
                       [ <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">find_index</span>, <span class="pl-var">_list</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-atom">'intersection-atom'</span>, <span class="pl-var">_list</span>], 
                       <span class="pl-atom">true</span>) , 
                  <span class="pl-atom">intersection</span>( <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">+</span>, <span class="pl-atom">'intersection-atom'</span>|<span class="pl-ellipsis">...</span></span>]</span>, 
                    [ <span class="pl-atom">'union-atom'</span>, 
                      <span class="pl-var">_list</span>, 
                      <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'intersection-atom'</span></span>]</span>], 
                    <span class="pl-var">Q</span>) , 
                  <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">P</span>, <span class="pl-var">P1_CODE_418</span>, <span class="pl-var">Q</span>, <span class="pl-var">P1_CODE_RESULT_417</span></span>)</span>)) , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">intersection</span>(<span class="pl-args"><span class="pl-atom">'intersection-atom'</span>, <span class="pl-var">_list</span>, <span class="pl-var">R</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-var">O</span>, <span class="pl-var">P1_CODE_417</span>, <span class="pl-var">R</span>, <span class="pl-var">P1_CODE_RESULT_416</span></span>)</span>)) , 
     <span class="pl-atom">s</span>( <span class="pl-atom">if</span>, 
       <span class="pl-var">K</span>, <span class="pl-avar">_65897192{$P1_CODE_415}</span>, <span class="pl-avar">_65897318{$P1_CODE_416}</span>, 
       _65897858{$_processed_head_and_index}) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">18</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65897858{$_processed_head_and_index}</span></span> , 
     <span class="pl-atom">unify_with_occurs_check</span>( <span class="pl-var">S</span>, [
       <span class="pl-var">_res_head</span>, <span class="pl-avar">_65897908{$_new_index}</span>, <span class="pl-avar">_65897928{$_new_list}</span>]) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">19</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65896956{$_tail}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">20</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65897908{$_new_index}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">21</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65897928{$_new_list}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">var2num</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">19</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">20</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">21</span></span>)</span>, <span class="pl-avar">_65897996{$_processed_tail_and_index}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">22</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_65897996{$_processed_tail_and_index}</span></span> , 
     <span class="pl-atom">unify_with_occurs_check</span>( <span class="pl-var">W</span>, [
       <span class="pl-var">_res_tail</span>, <span class="pl-avar">_65896754{$_final_index}</span>, <span class="pl-avar">_65896774{$_final_list}</span>])</span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/index_to_var.metta at 2025-10-16T14:06:54+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
