import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentTheoremCanonicalLaneLean.AssignmentDomain

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure PartitionBasedAssignment {D : AssignmentDomain} where
  partition : D.locations → ℕ
  assignment : D.demands → ℕ
  partitionFeasible : Prop
  assignmentFeasible : Prop
  costOptimal : Prop

structure PartitionBasedAssignmentEvidence {D : AssignmentDomain}
    (P : PartitionBasedAssignment D) where
  partitionFeasibleClosed : P.partitionFeasible
  assignmentFeasibleClosed : P.assignmentFeasible
  costOptimalClosed : P.costOptimal

def PartitionBasedAssignmentClosed {D : AssignmentDomain}
    (P : PartitionBasedAssignment D) : Prop :=
  P.partitionFeasible ∧ P.assignmentFeasible ∧ P.costOptimal

theorem partition_based_assignment_closed_from_evidence {D : AssignmentDomain}
    (P : PartitionBasedAssignment D) (E : PartitionBasedAssignmentEvidence P) :
    PartitionBasedAssignmentClosed P := by
  exact And.intro E.partitionFeasibleClosed
    (And.intro E.assignmentFeasibleClosed E.costOptimalClosed)

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse