import DiscreteLocationAssignmentTheoremCanonicalLaneLean.FacilityCostModel

/-!
# Location Assignment Problem Package
-/

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure LocationAssignmentProblem (C : FacilityCostModel) where
  demandPoints : Type u
  candidateLocations : Type v
  assignmentMapping : demandPoints → candidateLocations
  totalCostCalculated : Prop
  feasibilityCondition : Prop
  optimalityCriterion : Prop

structure LocationAssignmentEvidence {C : FacilityCostModel}
    (P : LocationAssignmentProblem C) where
  totalCostCalculatedClosed : P.totalCostCalculated
  feasibilityConditionClosed : P.feasibilityCondition
  optimalityCriterionClosed : P.optimalityCriterion

def LocationAssignmentClosed {C : FacilityCostModel}
    (P : LocationAssignmentProblem C) : Prop :=
  P.totalCostCalculated ∧ P.feasibilityCondition ∧ P.optimalityCriterion

theorem location_assignment_closed_from_evidence
    {C : FacilityCostModel} (P : LocationAssignmentProblem C)
    (E : LocationAssignmentEvidence P) : LocationAssignmentClosed P := by
  exact And.intro E.totalCostCalculatedClosed
    (And.intro E.feasibilityConditionClosed E.optimalityCriterionClosed)

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse