import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure FacilityLocationPackage where
  candidateSites : Type u
  demandPoints : Type v
  setupCost : candidateSites -> Nat
  transportCost : candidateSites -> demandPoints -> Nat
  capacityConstraint : candidateSites -> Nat
  limitedFacilities : Nat

structure FacilityLocationEvidence (F : FacilityLocationPackage) where
  candidateSitesNonempty : Nonempty F.candidateSites
  demandPointsNonempty : Nonempty F.demandPoints
  setupCostNonnegative : forall s, F.setupCost s >= 0
  transportCostNonnegative : forall s d, F.transportCost s d >= 0
  capacityConstraintPositive : forall s, F.capacityConstraint s > 0
  limitedFacilitiesPositive : F.limitedFacilities > 0

def FacilityLocationClosed (F : FacilityLocationPackage) : Prop :=
  Nonempty F.candidateSites ∧ Nonempty F.demandPoints ∧
  (forall s, F.setupCost s >= 0) ∧ (forall s d, F.transportCost s d >= 0) ∧
  (forall s, F.capacityConstraint s > 0) ∧ F.limitedFacilities > 0

theorem facility_location_closed_from_evidence (F : FacilityLocationPackage)
    (E : FacilityLocationEvidence F) : FacilityLocationClosed F := by
  exact And.intro E.candidateSitesNonempty
    (And.intro E.demandPointsNonempty
      (And.intro E.setupCostNonnegative
        (And.intro E.transportCostNonnegative
          (And.intro E.capacityConstraintPositive E.limitedFacilitiesPositive))))

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse