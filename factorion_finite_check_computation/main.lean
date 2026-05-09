import Definitions

/--
Computation-backed certificate for node `factorion_finite_check_computation`.
Program artifact: factorion_finite_check_computation/computation.py
Evidence artifact: factorion_finite_check_computation/evidence.json
Evidence hash: 7f41354979c882d1
Target: {"expected_set": [1, 2, 145, 40585], "kind": "exact_set_check"}
-/
axiom factorion_finite_check_computation : ∀ n : ℕ, n ≤ 2540160 → (isFactorion n ↔ n ∈ ({1, 2, 145, 40585} : Set ℕ))
