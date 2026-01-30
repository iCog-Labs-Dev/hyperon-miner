; ============================================================================
; Metta Namespaced Atom Interface
; ============================================================================
; This interface provides a clean abstraction over atom space operations
; by allowing users to organize atoms into virtual "namespaces" while
; storing everything in a single &mork space.
;
; ENHANCED: Supports generic intersection matching with comma operator (,)
; Using car-atom to check pattern structure and handle ANY number of patterns.
;
; Based on MeTTa Standard Library Syntax:
; - add-atom: (add-atom Space Atom) -> Unit
; - get-atoms: (get-atoms Space) -> List
; - match: (match Space Pattern Output) -> Result
; - remove-atom: (remove-atom Space Atom) -> Unit
; ============================================================================

; ============================================================================
; Core Namespace Helper Functions
; ============================================================================

(= (null? $x)
    (if (== $x ())
       True
       False))
; Create a namespaced atom by wrapping it with (ns <namespace>)
; Namespace can be ANY atom (string, symbol, or even a space atom like &kb)
; Usage: (make-ns-atom &kb (Foo bar))
; Returns: ((ns &kb) (Foo bar))
(= (make-ns-atom $namespace $atom)
   ((ns $namespace) $atom))

; Extract the actual atom from a namespaced atom
; Usage: (get-atom-from-ns ((ns myspace) (Foo bar)))
; Returns: (Foo bar)
(= (get-atom-from-ns ((ns $ns) $rest))
   $rest)

; ============================================================================
; Helper: Check if pattern is a comma tuple using car-atom
; ============================================================================
; Uses car-atom to safely check the head of the pattern
; Returns true if first element is comma operator
;
(= (is-comma-pattern $pattern)
    (and (== (get-metatype $pattern) Expression)
            (== (car-atom $pattern) ,)))

; ============================================================================
; Helper: Get rest of pattern after removing head using cdr-atom
; ============================================================================
; Returns everything except the head atom
;
(= (get-pattern-rest $pattern)
   (cdr-atom $pattern))

; ============================================================================
; Helper: Wrap pattern with namespace
; ============================================================================
; Creates ((ns $namespace) $pattern)
;
(= (wrap-with-ns $namespace $pattern)
   ((ns $namespace) $pattern))

; ============================================================================
; Helper: Recursively wrap all patterns in comma tuple with namespace
; ============================================================================
; Takes a comma pattern (, P1 P2 P3 ...) and returns (, (ns P1) (ns P2) (ns P3) ...)
; where each pattern is wrapped: ((ns $namespace) $pattern)
;
(= (wrap-comma-patterns $namespace $comma-pattern)
    (let* ((($head $tail) (decons-atom $comma-pattern)))
       (cons-atom $head (wrap-comma-patterns-recursive $namespace $tail))))

; ============================================================================
; Helper: Recursively process rest of comma pattern
; ============================================================================
; Wraps each pattern in the rest with namespace, maintaining comma structure
;
(= (wrap-comma-patterns-recursive $namespace $rest)
    (if (== $rest ())
       ()
       (let* ((($current $remaining) (decons-atom $rest)))
          (cons-atom (wrap-with-ns $namespace $current)
                         (wrap-comma-patterns-recursive $namespace $remaining)))))

; ============================================================================
; ADD-ATOM-CUSTOM: Add atom to a specific namespace
; ============================================================================
; Description: Adds an atom to a named namespace in the &mork space
;
; Usage: !(add-atom-custom "myspace" (Pattern 1))
; Internal: (add-atom &mork ((ns "myspace") (Pattern 1)))
;
; Parameters:
;   - namespace: Any atom identifier for the namespace (e.g. "users", users, &kb)
;   - atom: Atom to add to the namespace
;
; Return: Unit atom
;
(= (add-atom-custom $namespace $atom)
   (add-atom &mork ((ns $namespace) $atom)))

; ============================================================================
; GET-ATOMS-CUSTOM: Retrieve all atoms from a specific namespace
; ============================================================================
; Description: Returns all atoms stored in a specific namespace
;
; Usage: !(get-atoms-custom "myspace")
; Internal: Gets all atoms from &mork with namespace prefix
;
; Parameters:
;   - namespace: Any atom identifier for the namespace
;
; Return: List of atoms in the namespace
;
(= (get-atoms-custom $namespace)
   (match &mork ((ns $namespace) $rest) $rest))

; ============================================================================
; MATCH-CUSTOM: Query atoms from a specific namespace (GENERIC)
; ============================================================================
; Description: Searches for atoms in a namespace matching a pattern.
;             Handles single patterns and intersection matching with comma operator.
;             Works with ANY number of conjucted patterns through recursion.
;
; Usage - Single pattern:
; !(match-custom "myspace" (Pattern $x) $x)
;
; Usage - Intersection (any number of patterns):
; !(match-custom "users" (, (User $name $age) (Admin $name)) $name)
; !(match-custom "users" (, (User $name) (Admin $name) (Active $name)) $name)
; !(match-custom "users" (, P1 P2 P3 P4 P5 ... Pn) $output)
;
; Internal Logic:
;   1. Check if pattern head is comma operator using car-atom
;   2. If yes: Wrap all patterns in comma tuple with namespace
;      Result: (, ((ns $ns) P1) ((ns $ns) P2) ((ns $ns) P3) ...)
;   3. Pass wrapped pattern to match: (match &mork wrapped-pattern $output)
;   4. If no: Use standard single-pattern match with namespace
;
; Parameters:
;   - namespace: Any atom identifier for the namespace
;   - pattern: Pattern atom (can be comma-separated for intersection)
;   - output: Output template with variables
;
; Return: Matched results with variables filled
;
(= (match-custom $namespace $pattern $output)
   (if (is-comma-pattern $pattern)
     (let* (
      ($wrapped-pattern (wrap-comma-patterns $namespace $pattern))
      )
       (match &mork $wrapped-pattern $output))
     (match &mork ((ns $namespace) $pattern) $output)))

; ============================================================================
; REMOVE-ATOM-CUSTOM: Remove atom from a specific namespace
; ============================================================================
; Description: Removes an atom from a named namespace
;
; Usage: !(remove-atom-custom "myspace" (Pattern 1))
; Internal: (remove-atom &mork ((ns "myspace") (Pattern 1)))
;
; Parameters:
;   - namespace: Any atom identifier for the namespace
;   - atom: Atom to remove from the namespace
;
; Return: Unit atom
;
(= (remove-atom-custom $namespace $atom)
   (remove-atom &mork ((ns $namespace) $atom)))

; ============================================================================
; COUNT-CUSTOM: Get count of atoms in a specific namespace
; ============================================================================
; Description: Returns the number of atoms in a namespace
;
; Usage: !(count-custom "myspace")
;
; Parameters:
;   - namespace: Any atom identifier for the namespace
;
; Return: Number of atoms in the namespace
;
; Note: Uses size-atom on the results from match query
;
(= (count-custom $namespace)
   (size-atom (collapse (match &mork ((ns $namespace) $x) $x))))

; ============================================================================
; Convenience DB Helpers (namespace-based)
; ============================================================================

(= (db-size-custom $namespace)
   (count-custom $namespace))

(= (counter-custom $namespace $pattern)
   (tuple-count (collapse (match-custom $namespace $pattern $pattern))))

(= (sup-num-custom $namespace $pattern)
   (counter-custom $namespace $pattern))

(= (sup-eval-custom $namespace $pattern $ms)
   (let $sup (counter-custom $namespace $pattern)
      (if (>= $sup $ms) True False)))

(= (universe-count-custom $pattern $namespace)
   (pow-math (db-size-custom $namespace) (n_conjuncts $pattern)))

; ============================================================================
; Loader: copy atoms from a real space into a namespace in &mork
; ============================================================================

(= (mork-load-space $namespace $fromSpace)
   (collapse (match $fromSpace $atom (add-atom-custom $namespace $atom))))

(= (mork-clear-namespace $namespace)
   (collapse (match &mork ((ns $namespace) $atom)
                  (remove-atom &mork ((ns $namespace) $atom)))))

(= (mork-replace-namespace $namespace $fromSpace)
   (let* (($_ (mork-clear-namespace $namespace)))
     (mork-load-space $namespace $fromSpace)))

; ============================================================================
; LIST-NAMESPACE: List all atoms in a namespace
; ============================================================================
; Description: Returns all atoms in a specific namespace
;
; Usage: !(list-namespace "myspace")
;
; Parameters:
;   - namespace: Any atom identifier for the namespace
;
; Return: Matched atoms in the namespace
;
(= (list-namespace $namespace)
   (match &mork ((ns $namespace) $atom) $atom))

; ============================================================================
; Example Usage
; ============================================================================
;
; Add atoms to "users" namespace:
; !(add-atom-custom "users" (User alice 25))
; !(add-atom-custom "users" (User bob 30))
; !(add-atom-custom "users" (Admin alice))
; !(add-atom-custom "users" (Admin bob))
; !(add-atom-custom "users" (Active alice))
;
; Add atoms to "products" namespace:
; !(add-atom-custom "products" (Product laptop 999))
; !(add-atom-custom "products" (Product mouse 25))
;
; Get all atoms from a namespace:
; !(list-namespace "users")
;
; Query with single pattern:
; !(match-custom "users" (User $name $age) $name)
;

; !(wrap-comma-patterns "users" (, (User $name $age) (Admin $name)))
; Query with 2-way intersection (AND logic - both patterns must match):
; !(match-custom "users" (, (User $name $age) (Admin $name)) $name)
; Returns: alice, bob (users who are also admins)
;
; Query with 3-way intersection:
; !(match-custom "users" (, (User $name $age) (Admin $name) (Active $name)) $name)
; Returns: alice (user AND admin AND active)
;
; Query with 5-way intersection (works for ANY number of patterns):
; !(match-custom "users" (, (User $name) (Admin $name) (Active $name) (Verified $name) (Premium $name)) $name)
;
; Get count of atoms in namespace:
; !(count-custom "users")
;
; Remove specific atom:
; !(remove-atom-custom "users" (User alice 25))
;
; Get all user atoms after removal:
; !(list-namespace "users")

; ============================================================================
