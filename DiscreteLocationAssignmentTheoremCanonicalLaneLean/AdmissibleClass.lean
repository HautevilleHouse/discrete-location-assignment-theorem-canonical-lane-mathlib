import DiscreteLocationAssignmentTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : AssignmentAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  AssignmentWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse