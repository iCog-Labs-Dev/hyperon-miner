%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/bs-utils.metta at 2025-10-03T12:04:41+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).



<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call_13</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-atom">top_call</span><span class="pl-infix">:-</span><span class="pl-compound"><span class="pl-functor">time</span>(<span class="pl-args"><span class="pl-ellipsis">...</span></span>)</span></span>)</span>.




<span class="pl-atom">top_call_13</span>:- <span class="pl-compound pl-level-0"><span class="pl-functor">eval_H</span>(<span class="pl-args"><span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'import!'</span>|<span class="pl-ellipsis">...</span></span>]</span>, <span class="pl-var">ExecRes</span></span>)</span>.




top_call :-
    time(top_call_13).


%  ;; =============================================================================
%  ;; Function: subsample-py
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Creates a random subsample from a database by selecting a specified number
%  ;;   of atoms and placing them in a new space.
%  ;;
%  ;; Inputs:
%  ;;   - `$db`: The source database/space to subsample
%  ;;   - `$subsize`: The number of atoms to include in the subsample
%  ;;
%  ;; Output:
%  ;;   - A new space containing the randomly selected atoms
%  ;;
%  ;; =============================================================================
/*
  (= (subsample-py $db $subsize)  
    (let* 
      ( ($_ (println! "Subsampling database")) 
        ($random_selected (generet-random-subsample $db $subsize)) 
        ($_ (println! "Randomly selected atoms:")) 
        ($_ (println! $random_selected)) 
        ($space (copy-db (new-space) $random_selected))) $space))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'subsample-py'</span>, <span class="pl-var">_db41</span>, <span class="pl-var">_subsize1</span>, <span class="pl-var">RetVal735</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64135074{vn = ..., cns = ...}</span>, <span class="pl-avar">_64135178{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64135102{vn = ..., cns = ...}</span>, <span class="pl-avar">_64135220{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-string">"Subsampling database"</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64135178{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64135220{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'generet-random-subsample'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_64135300{$_random_selected}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-string">"Randomly selected atoms:"</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64135300{$_random_selected}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'new-space'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64135300{$_random_selected}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'copy-db'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_64135396{$_space}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_64135130{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_64135396{$_space}</span></span></span>) ).


%  ;; avrg-tv-py
%  ;; Computes the arithmetic mean of a sequence of numerical values.
%  ;; 
%  ;; Parameters:
%  ;;   x – A sequence of numerical values (e.g., time-series data).
%  ;; 
%  ;; Returns:
%  ;;   The average (mean) of the values in `x`.
%  ;; 
%  ;; Note:
%  ;;   This function is an alias for `mean-tv`.
/*
  (= (avrg-tv-py $x)  
    (mean-tv $x))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'avrg-tv-py'</span>, <span class="pl-var">_x33</span>, <span class="pl-var">RetVal739</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64379654{vn = ..., cns = ...}</span>, <span class="pl-avar">_64379730{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64379730{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'mean-tv'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-avar">_64379682{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: get-element-by-Index
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Retrieves an element from a list at a specified index position.
%  ;;
%  ;; Parameters:
%  ;;   - $list: The input list to access
%  ;;   - $index: Zero-based index of the element to retrieve
%  ;;
%  ;; Returns:
%  ;;   - The element at the specified index
%  ;;   - Undefined behavior if index is out of bounds
%  ;; =============================================================================
/*
  (= (get-element-by-Index $list $index)  
    (index-atom $list $index))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'get-element-by-Index'</span>, <span class="pl-var">_list57</span>, <span class="pl-var">_index1</span>, <span class="pl-var">RetVal743</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64493198{vn = ..., cns = ...}</span>, <span class="pl-avar">_64493302{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64493226{vn = ..., cns = ...}</span>, <span class="pl-avar">_64493344{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64493302{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64493344{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'index-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_64493254{vn = ..., cns = ...}</span></span>)</span></span>) ).


%  ;; =============================================================================
%  ;; Function: random-element
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Selects and returns a random element from the given database ($db).
%  ;;
%  ;; Parameters:
%  ;;   - $db: A database or collection from which atoms are extracted.
%  ;;
%  ;;
%  ;; Returns:
%  ;;   - A randomly selected element from the database.
%  ;;
%  ;; =============================================================================
/*
  (= (random-element $db)  
    (let* 
      ( ($list (collapse (get-atoms $db))) 
        ($_ (size-atom $list)) 
        ($index (random-int 0 5)) 
        ($element (get-element-by-Index $list $index)) 
        ($_ (println! $element))) $element))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'random-element'</span>, <span class="pl-var">_db45</span>, <span class="pl-var">RetVal747</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64657676{vn = ..., cns = ...}</span>, <span class="pl-avar">_64657752{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-atom">findall_ne</span>( <span class="pl-var">A</span>, 
       <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-var">B</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'get-atoms'</span>, <span class="pl-var">B</span>, <span class="pl-var">A</span></span>)</span></span>, 
       _64657814{$_list}) , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64657814{$_list}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'size-atom'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">2</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'random-int'</span>, <span class="pl-int">0</span>, <span class="pl-int">5</span>, <span class="pl-avar">_64657876{$_index}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64657814{$_list}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64657876{$_index}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'get-element-by-Index'</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">3</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">4</span></span>)</span>, <span class="pl-avar">_64657930{$_element}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64657930{$_element}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">5</span></span>)</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-atom">'_'</span></span>)</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-avar">_64657704{vn = ..., cns = ...}</span><span class="pl-infix">=</span><span class="pl-avar">_64657930{$_element}</span></span></span>) ).


%  ;; =============================================================================
%  ;; Function: generet-random-subsample
%  ;; -----------------------------------------------------------------------------
%  ;; Purpose:
%  ;;   Generates a random subsample of elements from the provided database ($db)
%  ;;   with the specified sample size ($subsize). The subsample is collected 
%  ;;   recursively.
%  ;;
%  ;; Parameters:
%  ;;   - $db: The database or collection to sample from.
%  ;;   - $subsize: The desired size of the random subsample.
%  ;;
%  ;; Returns:
%  ;;   - A list containing a random subsample of elements from the database.
/*
  (= (generet-random-subsample $db $subsize)  
    (if 
      (== $subsize 0) 
      (println! "Base case reached: returning empty list") 
      (let* 
        ( ($elements (random-element $db)) 
          ($new_subsize (- $subsize 1)) 
          ($tail_elements (generet-random-subsample $db $new_subsize))) 
        (cons-atom $elements $tail_elements))))
*/


( <span class="pl-atom">==&gt;</span><span class="pl-functor"> ( </span><span class="pl-ellipsis clickprev fold"></span><span class="pl-args">
   <span class="pl-compound pl-level-0"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-atom">'generet-random-subsample'</span>, <span class="pl-var">_db49</span>, <span class="pl-var">_subsize5</span>, <span class="pl-var">RetVal751</span></span>)</span> :- 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64964932{vn = ..., cns = ...}</span>, <span class="pl-avar">_64965036{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">ensure_evaled</span>(<span class="pl-args"><span class="pl-atom">'%Undefined%'</span>, <span class="pl-avar">_64964960{vn = ..., cns = ...}</span>, <span class="pl-avar">_64965078{vn = ..., cns = ...}</span></span>)</span> , 
     <span class="pl-compound pl-level-0"><span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span> <span class="pl-infix">=</span> <span class="pl-avar">_64965078{vn = ..., cns = ...}</span></span> , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">==</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">0</span></span>)</span>, <span class="pl-int">0</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span></span>)</span> , 
     _64965152{$P1_CODE_383} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span></span>]</span>, 
         <span class="pl-var">P1_CODE_RESULT_383</span>, 
         [ <span class="pl-atom">'println!'</span>, 
           <span class="pl-string">"Base case reached: returning empty list"</span>], 
         <span class="pl-compound pl-level-0"><span class="pl-atom">true</span><span class="pl-infix">,</span><span class="pl-compound"><span class="pl-functor">println_impl</span>(<span class="pl-args"><span class="pl-string">"Base case reached: returning empty list"</span>, <span class="pl-var">P1_CODE_RESULT_383</span></span>)</span></span>) , 
     _64965218{$P1_CODE_384} =  
          
       <span class="pl-atom">as_p1</span>( <span class="pl-atom">'%Undefined%'</span>, 
         <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-&gt;</span>, <span class="pl-atom">'%Undefined%'</span></span>]</span>, <span class="pl-atom">'Expression'</span>, <span class="pl-var">P1_CODE_RESULT_384</span>, 
         [ <span class="pl-atom">'let*'</span>, 
           [ [ <span class="pl-var">_elements</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'random-element'</span>, <span class="pl-var">_db</span></span>]</span>], 
             [ <span class="pl-var">_new_subsize</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">_subsize</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
             [ <span class="pl-var">_tail_elements</span>, 
               <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'generet-random-subsample'</span>, <span class="pl-var">_db</span>|<span class="pl-ellipsis">...</span></span>]</span>]], 
           <span class="pl-list"><span class="pl-functor"> [ </span><span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">_elements</span>|<span class="pl-ellipsis">...</span></span>]</span>], 
         ( <span class="pl-compound pl-level-0"><span class="pl-var">C</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span>  ,
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'random-element'</span>, <span class="pl-var">C</span>, <span class="pl-var">_elements</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">D</span><span class="pl-infix">=</span><span class="pl-var">_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">-</span>, <span class="pl-var">D</span>, <span class="pl-int">1</span>, <span class="pl-var">_new_subsize</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">E</span><span class="pl-infix">=</span><span class="pl-var">_db</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">F</span><span class="pl-infix">=</span><span class="pl-var">_new_subsize</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">me</span>(<span class="pl-args"><span class="pl-atom">'generet-random-subsample'</span>, <span class="pl-var">E</span>, <span class="pl-var">F</span>, <span class="pl-var">_tail_elements</span></span>)</span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">G</span><span class="pl-infix">=</span><span class="pl-var">_elements</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-var">H</span><span class="pl-infix">=</span><span class="pl-var">_tail_elements</span></span> , 
           <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">'cons-atom'</span>, <span class="pl-var">G</span>, <span class="pl-var">H</span>, <span class="pl-var">P1_CODE_RESULT_384</span></span>)</span>)) , 
     <span class="pl-compound pl-level-0"><span class="pl-functor">s</span>(<span class="pl-args"><span class="pl-atom">if</span>, <span class="pl-compound"><span class="pl-functor">'$VAR'</span>(<span class="pl-args"><span class="pl-int">1</span></span>)</span>, <span class="pl-avar">_64965152{$P1_CODE_383}</span>, <span class="pl-avar">_64965218{$P1_CODE_384}</span>, <span class="pl-avar">_64964988{vn = ..., cns = ...}</span></span>)</span></span>) ).


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/bs-utils.metta at 2025-10-03T12:04:43+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
