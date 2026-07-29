import discreteLocationAssignmentTheoremCanonicalLaneLean.NetworkFlowModel

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure CoveragePackage {P : FacilityLocationPackage} {N : NetworkFlowPackage P} where
  coverageRadius : ℝ
  coverageCondition : ∀ (f : P.facilities) (d : P.demandPoints), P.distanceMetric f d ≤ coverageRadius → Prop
  uncoveredDemand : Type u

structure CoverageEvidence {P : FacilityLocationPackage} {N : NetworkFlowPackage P} (C : CoveragePackage P N) where
  coverageRadiusPositive : C.coverageRadius > 0
  coverageSatisfied : ∀ f d, P.distanceMetric f d ≤ C.coverageRadius → C.coverageCondition f d

def CoverageClosed {P : FacilityLocationPackage} {N : NetworkFlowPackage P} (C : CoveragePackage P N) : Prop :=
  C.coverageRadius > 0 ∧ (∀ f d, P.distanceMetric f d ≤ C.coverageRadius → C.coverageCondition f d)

theorem coverage_closed_from_evidence {P : FacilityLocationPackage} {N : NetworkFlowPackage P} (C : CoveragePackage P N) (E : CoverageEvidence C) : CoverageClosed C := by
  exact And.intro E.coverageRadiusPositive E.coverageSatisfied

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse