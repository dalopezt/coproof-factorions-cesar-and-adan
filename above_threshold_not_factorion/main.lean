import Definitions

theorem above_threshold_not_factorion :
    ∀ n : ℕ, (362880 : ℝ) < (n : ℝ) / Real.log (n : ℝ) → ¬isFactorion n := by
  sorry

-- The value 10^7 already pushes n / log n above the 9! threshold
