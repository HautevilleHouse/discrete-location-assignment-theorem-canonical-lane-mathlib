import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentTheoremCanonicalLaneLean.SupplyDemandBalance

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure GlobalAssignmentBound {D : AssignmentDomain}
    (S : SupplyDemandBalance D) where
  upperBound : ℝ
  lowerBound : ℝ
  boundRelation : upperBound ≥ lowerBound
  tightnessCondition : Prop

structure GlobalAssignmentBoundEvidence {D : AssignmentDomain}
    {S : SupplyDemandBalance D} (G : GlobalAssignmentBound D S) where
  boundRelationClosed : G.upperBound ≥ G.lowerBound
  tightnessConditionClosed : G.tightnessCondition

def GlobalAssignmentBoundClosed {D : AssignmentDomain}
    {S : SupplyDemandBalance D} (G : GlobalAssignmentBound D S) : Prop :=
  G.upperBound ≥ G.lowerBound ∧ G.tightnessCondition

theorem global_assignment_bound_closed_from_evidence {D : AssignmentDomain}
    {S : SupplyDemandBalance D} (G : GlobalAssignmentBound D S)
    (E : GlobalAssignmentBoundEvidence G) : GlobalAssignmentBoundClosed G := by
  exact And.intro E.boundRelationClosed E.tightnessConditionClosed

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse