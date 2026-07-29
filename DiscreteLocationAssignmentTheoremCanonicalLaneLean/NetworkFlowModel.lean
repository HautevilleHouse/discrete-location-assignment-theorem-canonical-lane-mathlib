import discreteLocationAssignmentTheoremCanonicalLaneLean.FacilityLocationStructure

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure NetworkFlowPackage {P : FacilityLocationPackage} where
  supplyNodes : Type u
  demandNodes : Type v
  arcCapacity : (supplyNodes × demandNodes) → ℝ
  flowVariables : Type w
  flowConservation : Prop

structure NetworkFlowEvidence {P : FacilityLocationPackage} (N : NetworkFlowPackage P) where
  arcCapacityNonnegative : ∀ a, N.arcCapacity a ≥ 0
  flowConservationHolds : N.flowConservation

def NetworkFlowClosed {P : FacilityLocationPackage} (N : NetworkFlowPackage P) : Prop :=
  (∀ a, N.arcCapacity a ≥ 0) ∧ N.flowConservation

theorem network_flow_closed_from_evidence {P : FacilityLocationPackage} (N : NetworkFlowPackage P) (E : NetworkFlowEvidence N) : NetworkFlowClosed N := by
  exact And.intro E.arcCapacityNonnegative E.flowConservationHolds

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse