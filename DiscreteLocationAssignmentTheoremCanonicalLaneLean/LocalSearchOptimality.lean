import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentTheoremCanonicalLaneLean.LocationAssignmentCost

namespace HautevilleHouse
namespace DiscreteLocationAssignmentTheoremCanonicalLaneLean

structure LocalSearchOptimality {D : AssignmentDomain} {C : LocationAssignmentCost D} where
  currentAssignment : D.demands → D.resources
  localMoves : (D.demands → D.resources) → Prop
  localOptimality : Prop
  globalOptimality : Prop
  localImpliesGlobal : localOptimality → globalOptimality

structure LocalSearchOptimalityEvidence {D : AssignmentDomain}
    {C : LocationAssignmentCost D} (L : LocalSearchOptimality D C) where
  localOptimalityClosed : L.localOptimality
  globalOptimalityClosed : L.globalOptimality
  implicationClosed : L.localOptimality → L.globalOptimality

def LocalSearchOptimalityClosed {D : AssignmentDomain}
    {C : LocationAssignmentCost D} (L : LocalSearchOptimality D C) : Prop :=
  L.localOptimality ∧ L.globalOptimality ∧ (L.localOptimality → L.globalOptimality)

theorem local_search_optimality_closed_from_evidence {D : AssignmentDomain}
    {C : LocationAssignmentCost D} (L : LocalSearchOptimality D C)
    (E : LocalSearchOptimalityEvidence L) : LocalSearchOptimalityClosed L := by
  exact And.intro E.localOptimalityClosed
    (And.intro E.globalOptimalityClosed E.implicationClosed)

end DiscreteLocationAssignmentTheoremCanonicalLaneLean
end HautevilleHouse