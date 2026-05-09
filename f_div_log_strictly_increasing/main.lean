import Definitions
theorem f_div_log_strictly_increasing :
    ∀ x y : ℝ, (3 : ℝ) < x → x ≤ y → x / Real.log x ≤ y / Real.log y := by
  intro x y hx hxy
  have hx_pos : (0 : ℝ) < x := by linarith
  have hy_pos : (0 : ℝ) < y := hx_pos.trans_le hxy
  have hlogx_pos : (0 : ℝ) < Real.log x := Real.log_pos (by linarith)
  have hlogy_pos : (0 : ℝ) < Real.log y := Real.log_pos (by linarith)
  have he_le_x : Real.exp 1 ≤ x := by
    have h1 : Real.exp 1 < 2.7182818286 := Real.exp_one_lt_d9
    have h2 : (2.7182818286 : ℝ) < 3 := by norm_num
    linarith
  have he_le_y : Real.exp 1 ≤ y := le_trans he_le_x hxy
  have hanti : Real.log y / y ≤ Real.log x / x :=
    Real.log_div_self_antitoneOn (Set.mem_Ici.mpr he_le_x) (Set.mem_Ici.mpr he_le_y) hxy
  rw [div_le_div_iff hlogx_pos hlogy_pos]
  have h := (div_le_div_iff hy_pos hx_pos).mp hanti
  nlinarith [mul_comm (Real.log y) x, mul_comm (Real.log x) y]

-- Sub-goal 2: When n / log n exceeds 9! = 362880, n cannot be a factorion