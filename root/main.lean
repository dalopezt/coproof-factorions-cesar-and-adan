import «factorion_upper_bound».«main»
import «factorion_finite_check».«main»
import Definitions
theorem root : {n : ℕ | isFactorion n} = {1, 2, 145, 40585} := by
  ext n
  simp only [Set.mem_setOf_eq, Set.mem_insert_iff, Set.mem_singleton_iff]
  constructor
  · intro h
    have hbound := factorion_upper_bound n h
    exact (factorion_finite_check n hbound).mp h
  · intro h
    have hbound : n ≤ 2540160 := by
      rcases h with rfl | rfl | rfl | rfl <;> norm_num
    exact (factorion_finite_check n hbound).mpr h
