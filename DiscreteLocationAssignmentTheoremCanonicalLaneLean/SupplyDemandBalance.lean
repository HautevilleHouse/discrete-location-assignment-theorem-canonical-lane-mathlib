import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentTheoremCanonicalLaneLean.AssignmentDomain

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure SupplyDemandBalance {D : AssignmentDomain} where
  totalDemand : ℝ := ∑ d, D.demandMagnitude d
  totalSupply : ℝ := ∑ r, D.resourceCapacity r
  balanceCondition : Prop
  demandSatisfied : totalDemand ≤ totalSupply

structure SupplyDemandBalanceEvidence {D : AssignmentDomain}
    (S : SupplyDemandBalance D) where
  balanceConditionClosed : S.balanceCondition
  demandSatisfiedClosed : S.demandSatisfied

def SupplyDemandBalanceClosed {D : AssignmentDomain}
    (S : SupplyDemandBalance D) : Prop :=
  S.balanceCondition ∧ S.demandSatisfied

theorem supply_demand_balance_closed_from_evidence {D : AssignmentDomain}
    (S : SupplyDemandBalance D) (E : SupplyDemandBalanceEvidence S) :
    SupplyDemandBalanceClosed S := by
  exact And.intro E.balanceConditionClosed E.demandSatisfiedClosed

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse