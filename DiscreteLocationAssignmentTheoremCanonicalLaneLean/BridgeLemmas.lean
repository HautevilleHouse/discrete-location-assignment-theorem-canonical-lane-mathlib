import canonicalLaneMathlib.AdmissibleClass
import DiscreteLocationAssignmentTheoremCanonicalLaneLean.DiscreteLocationAssignment

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.gateWitness

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse