import discreteLocationAssignmentTheoremCanonicalLaneLean.LagrangianRelaxation

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure HeuristicApproximationPackage {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} {I : IntegerProgrammingPackage P N C} {L : LagrangianRelaxationPackage P N C I} where
  greedyAlgorithm : Prop
  localSearch : Prop
  approximationRatio : ℝ

structure HeuristicApproximationEvidence {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} {I : IntegerProgrammingPackage P N C} {L : LagrangianRelaxationPackage P N C I} (H : HeuristicApproximationPackage P N C I L) where
  greedyAlgorithmCorrect : H.greedyAlgorithm
  localSearchConverges : H.localSearch
  approximationRatioValid : H.approximationRatio ≥ 1

def HeuristicApproximationClosed {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} {I : IntegerProgrammingPackage P N C} {L : LagrangianRelaxationPackage P N C I} (H : HeuristicApproximationPackage P N C I L) : Prop :=
  H.greedyAlgorithm ∧ H.localSearch ∧ H.approximationRatio ≥ 1

theorem heuristic_approximation_closed_from_evidence {P : FacilityLocationPackage} {N : NetworkFlowPackage P} {C : CoveragePackage P N} {I : IntegerProgrammingPackage P N C} {L : LagrangianRelaxationPackage P N C I} (H : HeuristicApproximationPackage P N C I L) (E : HeuristicApproximationEvidence H) : HeuristicApproximationClosed H := by
  exact And.intro E.greedyAlgorithmCorrect (And.intro E.localSearchConverges E.approximationRatioValid)

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse