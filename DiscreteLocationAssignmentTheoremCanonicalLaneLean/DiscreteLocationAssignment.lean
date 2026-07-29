import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure LocationAssignmentInstance where
  facilities : Nat
  clients : Nat
  demandVector : List Nat
  capacityVector : List Nat
  costMatrix : List (List Nat)

def isValidInstance (I : LocationAssignmentInstance) : Prop :=
  I.facilities = I.capacityVector.length ∧
  I.clients = I.demandVector.length ∧
  I.costMatrix.length = I.facilities ∧
  (∀ row ∈ I.costMatrix, row.length = I.clients)

structure LocationAssignmentSolution (I : LocationAssignmentInstance) where
  assignmentMatrix : List (List Nat)
  satisfiedDemand : Prop
  respectsCapacities : Prop
  solutionCost : Nat
  minimalityProof : ∀ (other : LocationAssignmentSolution I), other.solutionCost ≥ solutionCost

theorem solution_closed_under_bridge (I : LocationAssignmentInstance) :
  (∃ (sol : LocationAssignmentSolution I), True) ∨ ¬ (∃ (sol : LocationAssignmentSolution I), True) := by
  apply em

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse