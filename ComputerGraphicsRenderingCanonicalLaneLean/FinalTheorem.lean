import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

def ConstrainedGraphicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_graphics_endgame (A : AdmissibleClass) :
    ConstrainedGraphicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse