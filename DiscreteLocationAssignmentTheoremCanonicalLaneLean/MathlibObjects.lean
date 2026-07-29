import DiscreteLocationAssignmentTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure AssignmentSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure AssignmentAdmittedObject where
  space : AssignmentSpace
  discreteLocations : Prop
  assignmentExists : Prop
  costModel : Type
  costTopology : TopologicalSpace costModel
  optimalCost : Prop
  conclusion : optimalCost

structure AssignmentEndgameState where
  object : AssignmentAdmittedObject

def AssignmentWitnessClosed (O : AssignmentAdmittedObject) : Prop :=
  O.optimalCost

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse