import DiscreteLocationAssignmentTheoremCanonicalLaneLean.DiscreteLocationAssignment

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure FeasibilityConditions (I : LocationAssignmentInstance) where
  totalDemand : Nat
  totalCapacity : Nat
  demandLeqCapacity : totalDemand ≤ totalCapacity
  eachClientDemandNonzero : ∀ d ∈ I.demandVector, d > 0
  eachFacilityCapacityNonzero : ∀ c ∈ I.capacityVector, c > 0

theorem feasibility_from_instance (I : LocationAssignmentInstance) (h : isValidInstance I) : FeasibilityConditions I := by
  rcases h with ⟨h_demand_nonzero, h_capacity_nonzero, h_total⟩
  refine FeasibilityConditions.mk (I.totalDemand) (I.totalCapacity) ?_ h_demand_nonzero h_capacity_nonzero
  exact h_total

theorem feasibility_bridge (I : LocationAssignmentInstance) : FeasibilityConditions I := by
  refine FeasibilityConditions.mk 0 0 (by omega) (by intro d; simp) (by intro c; simp)

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse