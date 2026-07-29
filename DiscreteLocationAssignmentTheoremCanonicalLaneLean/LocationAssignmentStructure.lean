import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure Facility (F : Type) where
  capacity : Nat
  costPerUnit : Nat
  openCost : Nat

structure Customer (C : Type) where
  demand : Nat

structure DistanceMatrix (F C : Type) where
  dist : F → C → Nat

structure AssignmentProblem (F C : Type) where
  facilities : List (Facility F)
  customers : List (Customer C)
  distances : DistanceMatrix F C
  feasible : Prop

structure LocationAssignmentPackage (F C : Type) where
  problem : AssignmentProblem F C
  assignment : F → C → Bool
  totalCost : Nat
  capacityConstraintsSatisfied : Prop
  demandConstraintsSatisfied : Prop
  costOptimal : Prop

structure LocationAssignmentEvidence {F C : Type} (L : LocationAssignmentPackage F C) where
  capacityConstraintsSatisfiedClosed : L.capacityConstraintsSatisfied
  demandConstraintsSatisfiedClosed : L.demandConstraintsSatisfied
  costOptimalClosed : L.costOptimal

def LocationAssignmentClosed {F C : Type} (L : LocationAssignmentPackage F C) : Prop :=
  L.capacityConstraintsSatisfied ∧ L.demandConstraintsSatisfied ∧ L.costOptimal

theorem location_assignment_closed_from_evidence
    {F C : Type} (L : LocationAssignmentPackage F C) (E : LocationAssignmentEvidence L) :
    LocationAssignmentClosed L := by
  exact And.intro E.capacityConstraintsSatisfiedClosed
    (And.intro E.demandConstraintsSatisfiedClosed E.costOptimalClosed)

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse