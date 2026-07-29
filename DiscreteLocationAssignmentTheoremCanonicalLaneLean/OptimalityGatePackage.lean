import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure OptimalityGatePackage where
  totalCostLowerBound : Nat
  feasibleSolutionExists : Prop
  optimalSolutionAchieved : Prop

structure OptimalityGateEvidence (G : OptimalityGatePackage) where
  totalCostLowerBoundCorrect : G.totalCostLowerBound >= 0
  feasibleSolutionExistsClosed : G.feasibleSolutionExists
  optimalSolutionAchievedClosed : G.optimalSolutionAchieved

def OptimalityGateClosed (G : OptimalityGatePackage) : Prop :=
  G.totalCostLowerBound >= 0 ∧ G.feasibleSolutionExists ∧ G.optimalSolutionAchieved

theorem optimality_gate_closed_from_evidence (G : OptimalityGatePackage)
    (E : OptimalityGateEvidence G) : OptimalityGateClosed G := by
  exact And.intro E.totalCostLowerBoundCorrect
    (And.intro E.feasibleSolutionExistsClosed E.optimalSolutionAchievedClosed)

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse