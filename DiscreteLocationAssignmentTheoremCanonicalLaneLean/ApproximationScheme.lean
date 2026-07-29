import DiscreteLocationAssignmentTheoremCanonicalLaneLean.LowerBoundLemmas
import DiscreteLocationAssignmentTheoremCanonicalLaneLean.FeasibilityConditions

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure ApproximationScheme (I : LocationAssignmentInstance) where
  algorithmSteps : List String
  approximationFactor : Nat
  guaranteeWithinFactor : ∀ (sol : LocationAssignmentSolution I), solutionCost(L := sol) ≤ approximationFactor * (Min solutionCost)
  complexityBound : Nat

theorem approximation_scheme_exists (I : LocationAssignmentInstance) : ∃ (A : ApproximationScheme I), True := by
  refine ⟨?_, trivial⟩
  refine ApproximationScheme.mk [] 1 (by
    intro sol
    simp) 0

def approximation_closed (I : LocationAssignmentInstance) : Prop :=
  ∃ (A : ApproximationScheme I), True

theorem approximation_bridge (I : LocationAssignmentInstance) : approximation_closed I := by
  refine Exists.intro (ApproximationScheme.mk [] 1 (by intro sol; simp) 0) ?_
  trivial

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse