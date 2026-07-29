import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure AssignmentCostPackage {F : FacilityLocationPackage} where
  assignment : F.candidateSites -> F.demandPoints -> Prop
  cost : F.candidateSites -> F.demandPoints -> Nat
  assignmentFeasible : forall d, exists s, assignment s d
  costNonnegative : forall s d, cost s d >= 0

structure AssignmentCostEvidence {F : FacilityLocationPackage}
    (A : AssignmentCostPackage F) where
  assignmentFeasibleClosed : A.assignmentFeasible
  costNonnegativeClosed : A.costNonnegative

def AssignmentCostClosed {F : FacilityLocationPackage}
    (A : AssignmentCostPackage F) : Prop :=
  A.assignmentFeasible ∧ (forall s d, A.cost s d >= 0)

theorem assignment_cost_closed_from_evidence {F : FacilityLocationPackage}
    (A : AssignmentCostPackage F) (E : AssignmentCostEvidence A) :
    AssignmentCostClosed A := by
  exact And.intro E.assignmentFeasibleClosed E.costNonnegativeClosed

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse