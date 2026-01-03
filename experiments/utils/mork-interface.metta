; ============================================================================
; Metta Namespaced Atom Interface
; ============================================================================
; This interface provides a clean abstraction over atom space operations
; by allowing users to organize atoms into virtual "namespaces" while
; storing everything in a single &mork space.
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

; Create a namespaced atom by wrapping it with (ns namespace-name)
; Usage: (make-ns-atom "myspace" (Foo bar))
; Returns: ((ns myspace) (Foo bar))
(= (make-ns-atom $namespace $atom)
   ((ns $namespace) $atom))

; Extract the actual atom from a namespaced atom
; Usage: (get-atom-from-ns ((ns myspace) (Foo bar)))
; Returns: (Foo bar)
(= (get-atom-from-ns ((ns $ns) $rest))
   $rest)

; ============================================================================
; ADD-ATOM-CUSTOM: Add atom to a specific namespace
; ============================================================================
; Description: Adds an atom to a named namespace in the &mork space
;
; Usage: !(add-atom-custom "myspace" (Pattern 1))
; Internal: (add-atom &mork ((ns "myspace") (Pattern 1)))
;
; Parameters:
;   - namespace: String identifier for the namespace
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
;   - namespace: String identifier for the namespace
;
; Return: List of atoms in the namespace
;
(= (get-atoms-custom $namespace)
   (match &mork ((ns $namespace) $rest) ((ns $namespace) $rest)))

; ============================================================================
; MATCH-CUSTOM: Query atoms from a specific namespace
; ============================================================================
; Description: Searches for atoms in a namespace matching a pattern
;
; Usage: !(match-custom "myspace" (Pattern $x) $x)
; Internal: (match &mork ((ns "myspace") (Pattern $x)) $x)
;
; Parameters:
;   - namespace: String identifier for the namespace
;   - pattern: Pattern atom to search for
;   - output: Output template with variables
;
; Return: Matched results with variables filled
;
(= (match-custom $namespace $pattern $output)
   (match &mork ((ns $namespace) $pattern) $output))

; ============================================================================
; REMOVE-ATOM-CUSTOM: Remove atom from a specific namespace
; ============================================================================
; Description: Removes an atom from a named namespace
;
; Usage: !(remove-atom-custom "myspace" (Pattern 1))
; Internal: (remove-atom &mork ((ns "myspace") (Pattern 1)))
;
; Parameters:
;   - namespace: String identifier for the namespace
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
;   - namespace: String identifier for the namespace
;
; Return: Number of atoms in the namespace
;
; Note: Uses size-atom on the results from match query
;
(= (count-custom $namespace)
   (size-atom (match &mork ((ns $namespace) $x) $x)))

; ============================================================================
; LIST-NAMESPACE: List all atoms in a namespace
; ============================================================================
; Description: Returns all atoms in a specific namespace
;
; Usage: !(list-namespace "myspace")
;
; Parameters:
;   - namespace: String identifier for the namespace
;
; Return: Matched atoms in the namespace
;
(= (list-namespace $namespace)
   (match &mork ((ns $namespace) $atom) $atom))

; ============================================================================
; Example Usage
; ============================================================================
;
Add atoms to "users" namespace:
!(add-atom-custom "users" (User alice 25))
!(add-atom-custom "users" (User bob 30))
;
; Add atoms to "products" namespace:
; !(add-atom-custom "products" (Product laptop 999))
; !(add-atom-custom "products" (Product mouse 25))
;
Get all atoms from a namespace:
!(list-namespace "users")
;
; Query with pattern matching:
; !(match-custom "users" (User $name $age) $name)
;
; Get count of atoms in namespace:
; !(count-custom "users")
;
; Remove specific atom:
; !(remove-atom-custom "users" (User alice 25))
;
; Get all products:
; !(list-namespace "products")
;
; ============================================================================