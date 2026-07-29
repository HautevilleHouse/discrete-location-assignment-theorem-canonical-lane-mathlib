import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentTheoremCanonicalLaneLean.FacilityLocationPackage
import HautevilleHouse.DiscreteLocationAssignmentTheoremCanonicalLaneLean.AssignmentCostPackage

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let F := A.object
  FacilityLocationClosed F

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  unfold bridgeClosed
  -- A.closed provides the proof that A.object is a closed facility location
  exact A.closed

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse