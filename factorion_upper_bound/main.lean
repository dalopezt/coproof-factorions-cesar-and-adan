import «f_div_log_strictly_increasing».«main»
import «above_threshold_not_factorion».«main»
import «threshold_at_ten7».«main»
import «seven_digit_factorion_le».«main»
import Definitions
-- Sub-goal 1: n / log n is strictly increasing for n > 3 (in particular, for n > e)





theorem factorion_upper_bound : ∀ n : ℕ, isFactorion n → n ≤ 2540160 := by
  intro n hn
  by_cases hlt : n < 10 ^ 7
  · exact seven_digit_factorion_le n hlt hn
  · push_neg at hlt
    have h1 : (362880 : ℝ) < (10 : ℝ) ^ 7 / Real.log ((10 : ℝ) ^ 7) :=
      threshold_at_ten7
    have h2 : (10 : ℝ) ^ 7 / Real.log ((10 : ℝ) ^ 7) ≤ (n : ℝ) / Real.log (n : ℝ) :=
      f_div_log_strictly_increasing ((10 : ℝ) ^ 7) (n : ℝ)
        (by norm_num)
        (by exact_mod_cast hlt)
    have h3 : (362880 : ℝ) < (n : ℝ) / Real.log (n : ℝ) := lt_of_lt_of_le h1 h2
    exact absurd hn (above_threshold_not_factorion n h3)
