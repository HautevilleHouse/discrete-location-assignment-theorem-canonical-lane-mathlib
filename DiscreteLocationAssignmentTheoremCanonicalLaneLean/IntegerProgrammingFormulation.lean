import discreteLocationAssignmentTheoremCanonicalLaneLean.CoverageConstraints

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure IntegerProgrammingPackage {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} where
  locationVariables : Type u
  assignmentVariables : Type v
  objectiveFunction : Prop
  constraints : Prop

structure IntegerProgrammingEvidence {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} (I : IntegerProgrammingPackage P N C) where
  objectiveFunctionDefined : I.objectiveFunction
  constraintsFeasible : I.constraints

def IntegerProgrammingClosed {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} (I : IntegerProgrammingPackage P N C) : Prop :=
  I.objectiveFunction ∧ I.constraints

theorem integer_programming_closed_from_evidence {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} (I : IntegerProgrammingPackage P N C) (E : IntegerProgrammingEvidence I) : IntegerProgrammingClosed I := by
  exact And.intro E.objectiveFunctionDefined E.constraintsFeasible

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse