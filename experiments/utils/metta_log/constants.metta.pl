%% Generated from /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/constants.metta at 2025-10-18T23:41:35+03:00
:- style_check(-discontiguous).
:- style_check(-singleton).
:- include(library(metta_lang/metta_transpiled_header)).
:- set_prolog_flag(pfc_term_expansion, true).

%  ;;;;;;;;;;;;;;;
%  ;; Constants ;;
%  ;;;;;;;;;;;;;;;
%  ;; For now the underlying beta distributions have a Jeffreys prior,
/*
  (= (prior-alpha)  1.0)
*/


<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-compound"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">:-</span> <span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span></span>)</span>.


/*
  (= (prior-beta)  1.0)
*/


<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-compound"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">:-</span> <span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span></span>)</span>.


%  ;; Default K value , as sated on "openCog/atomps/simpleTruthValue.h"
/*
  (= (default_k)  800.0)
*/


<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-compound"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">:-</span> <span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span></span>)</span>.


%  ;; Lookahead
/*
  (= (lookahead)  1.0)
*/


<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-compound"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">:-</span> <span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span></span>)</span>.


%  ;; Maximum supported count (till +inf is supported, possibly).
/*
  (= (max-count)  1.0e+09)
*/


<span class="pl-compound pl-level-0"><span class="pl-prefix">==&gt;</span>(<span class="pl-compound"><span class="pl-compound"><span class="pl-functor">mc</span>(<span class="pl-args"><span class="pl-ellipsis">...</span>, <span class="pl-ellipsis">...</span></span>)</span> <span class="pl-infix">:-</span> <span class="pl-compound"><span class="pl-ellipsis">...</span><span class="pl-infix">,</span><span class="pl-ellipsis">...</span></span></span>)</span>.


%% Finished generating /home/eyobderese/iCog-repo/hyperon-miner/experiments/utils/metta_log/constants.metta at 2025-10-18T23:41:35+03:00

:- normal_IO.
:- initialization(transpiled_main, program).
