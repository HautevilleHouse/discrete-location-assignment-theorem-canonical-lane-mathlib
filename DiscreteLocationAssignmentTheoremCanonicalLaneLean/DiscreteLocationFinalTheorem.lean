import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

def ConstrainedDiscreteLocationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_location_endgame (A : AdmissibleClass) :
    ConstrainedDiscreteLocationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse