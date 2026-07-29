import discreteLocationAssignmentTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure FacilityLocationPackage where
  facilities : Type u
  demandPoints : Type v
  distanceMetric : facilities → demandPoints → ℝ
  costFunction : ℝ → ℝ
  assignmentVars : Type w

structure FacilityLocationEvidence (P : FacilityLocationPackage) where
  distanceMetricNonnegative : ∀ f d, P.distanceMetric f d ≥ 0
  costFunctionNondecreasing : ∀ x y, x ≤ y → P.costFunction x ≤ P.costFunction y
  assignmentVarsWellDefined : Nonempty P.assignmentVars

def FacilityLocationClosed (P : FacilityLocationPackage) : Prop :=
  (∀ f d, P.distanceMetric f d ≥ 0) ∧ Nonempty P.assignmentVars

theorem facility_location_closed_from_evidence (P : FacilityLocationPackage) (E : FacilityLocationEvidence P) : FacilityLocationClosed P := by
  exact And.intro E.distanceMetricNonnegative E.assignmentVarsWellDefined

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse