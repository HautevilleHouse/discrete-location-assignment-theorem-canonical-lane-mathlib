import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentTheoremCanonicalLaneLean.AssignmentDomain

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure LocationAssignmentCost {D : AssignmentDomain} where
  costFunction : D.locations → D.resources → ℝ
  nonnegativity : ∀ l r, costFunction l r ≥ 0
  regularity : Prop

structure LocationAssignmentCostEvidence {D : AssignmentDomain}
    (C : LocationAssignmentCost D) where
  nonnegativityClosed : ∀ l r, C.costFunction l r ≥ 0
  regularityClosed : C.regularity

def LocationAssignmentCostClosed {D : AssignmentDomain}
    (C : LocationAssignmentCost D) : Prop :=
  (∀ l r, C.costFunction l r ≥ 0) ∧ C.regularity

theorem location_assignment_cost_closed_from_evidence {D : AssignmentDomain}
    (C : LocationAssignmentCost D) (E : LocationAssignmentCostEvidence C) :
    LocationAssignmentCostClosed C := by
  exact And.intro E.nonnegativityClosed E.regularityClosed

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse