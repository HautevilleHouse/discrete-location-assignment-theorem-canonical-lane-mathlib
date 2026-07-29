import DiscreteLocationAssignmentTheoremCanonicalLaneLean.LocationAssignmentProblem

/-!
# Optimality Conditions Package
-/

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure OptimalityConditions {C : FacilityCostModel}
    (P : LocationAssignmentProblem C) where
  firstOrderConditions : Prop
  secondOrderConditions : Prop
  globalOptimumGuaranteed : Prop
  uniquenessCondition : Prop

structure OptimalityEvidence {C : FacilityCostModel}
    {P : LocationAssignmentProblem C} (O : OptimalityConditions P) where
  firstOrderConditionsClosed : O.firstOrderConditions
  secondOrderConditionsClosed : O.secondOrderConditions
  globalOptimumGuaranteedClosed : O.globalOptimumGuaranteed
  uniquenessConditionClosed : O.uniquenessCondition

def OptimalityClosed {C : FacilityCostModel}
    {P : LocationAssignmentProblem C} (O : OptimalityConditions P) : Prop :=
  O.firstOrderConditions ∧ O.secondOrderConditions ∧
  O.globalOptimumGuaranteed ∧ O.uniquenessCondition

theorem optimality_closed_from_evidence
    {C : FacilityCostModel} {P : LocationAssignmentProblem C}
    (O : OptimalityConditions P) (E : OptimalityEvidence O) :
    OptimalityClosed O := by
  exact And.intro E.firstOrderConditionsClosed
    (And.intro E.secondOrderConditionsClosed
      (And.intro E.globalOptimumGuaranteedClosed E.uniquenessConditionClosed))

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse