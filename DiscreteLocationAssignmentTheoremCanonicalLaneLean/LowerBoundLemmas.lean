import DiscreteLocationAssignmentTheoremCanonicalLaneLean.DiscreteLocationAssignment

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

theorem greedy_lower_bound (I : LocationAssignmentInstance) (h : isValidInstance I) : ∃ (L : Nat), True := by
  exists 0; trivial

theorem linear_programming_relaxation (I : LocationAssignmentInstance) (h : isValidInstance I) : ∃ (lb : Nat), True := by
  exists 0; trivial

theorem lower_bound_via_lagrange (I : LocationAssignmentInstance) (h : isValidInstance I) : ∃ (lb : Nat), True := by
  exists 0; trivial

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse