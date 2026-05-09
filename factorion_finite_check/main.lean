import «factorion_finite_check_computation».«main»
import Definitions
theorem factorion_finite_check : ∀ n : ℕ, n ≤ 2540160 → (isFactorion n ↔ n ∈ ({1, 2, 145, 40585} : Set ℕ)) := by
  simpa using factorion_finite_check_computation