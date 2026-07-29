import discreteLocationAssignmentTheoremCanonicalLaneLean.IntegerProgrammingFormulation

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure LagrangianRelaxationPackage {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} {I : IntegerProgrammingPackage P N C} where
  multipliers : Type u
  relaxedConstraints : Prop
  subgradientMethod : Prop

structure LagrangianRelaxationEvidence {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} {I : IntegerProgrammingPackage P N C} (L : LagrangianRelaxationPackage P N C I) where
  multipliersDefined : Nonempty L.multipliers
  relaxedConstraintsDefined : L.relaxedConstraints

def LagrangianRelaxationClosed {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} {I : IntegerProgrammingPackage P N C} (L : LagrangianRelaxationPackage P N C I) : Prop :=
  Nonempty L.multipliers ∧ L.relaxedConstraints

theorem lagrangian_relaxation_closed_from_evidence {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} {I : IntegerProgrammingPackage P N C} (L : LagrangianRelaxationPackage P N C I) (E : LagrangianRelaxationEvidence L) : LagrangianRelaxationClosed L := by
  exact And.intro E.multipliersDefined E.relaxedConstraintsDefined

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse