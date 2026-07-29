import DiscreteLocationAssignmentTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def assignmentProjection : Projection AssignmentEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem assignment_projection_idempotent (x : AssignmentEndgameState) :
    assignmentProjection.toFun (assignmentProjection.toFun x) = assignmentProjection.toFun x := by
  exact assignmentProjection.idempotent x

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse