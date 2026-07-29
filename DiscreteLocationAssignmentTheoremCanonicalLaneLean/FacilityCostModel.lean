import Mathlib.Topology.Basic

/-!
# Facility Cost Model Package
-/

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure FacilityCostModel where
  facilityType : Type u
  locationType : Type v
  distanceMetric : Type w
  setupCost : Prop
  transportationCost : Prop
  capacityConstraints : Prop
  costFunctionSmooth : Prop

structure FacilityCostEvidence (F : FacilityCostModel) where
  setupCostClosed : F.setupCost
  transportationCostClosed : F.transportationCost
  capacityConstraintsClosed : F.capacityConstraints
  costFunctionSmoothClosed : F.costFunctionSmooth

def FacilityCostClosed (F : FacilityCostModel) : Prop :=
  F.setupCost ∧ F.transportationCost ∧ F.capacityConstraints ∧ F.costFunctionSmooth

theorem facility_cost_closed_from_evidence
    (F : FacilityCostModel) (E : FacilityCostEvidence F) :
    FacilityCostClosed F := by
  exact And.intro E.setupCostClosed
    (And.intro E.transportationCostClosed
      (And.intro E.capacityConstraintsClosed E.costFunctionSmoothClosed))

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse