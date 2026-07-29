import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure TransparencyBlending where
  alphaBlending : Prop
  additiveBlending : Prop
  multiplicativeBlending : Prop
  orderIndependentTransparency : Prop
  depthPeeling : Prop
  stochasticTransparency : Prop

structure TransparencyBlendingEvidence (T : TransparencyBlending) where
  alphaBlendingClosed : T.alphaBlending
  additiveBlendingClosed : T.additiveBlending
  multiplicativeBlendingClosed : T.multiplicativeBlending
  orderIndependentTransparencyClosed : T.orderIndependentTransparency
  depthPeelingClosed : T.depthPeeling
  stochasticTransparencyClosed : T.stochasticTransparency

def TransparencyBlendingClosed (T : TransparencyBlending) : Prop :=
  T.alphaBlending ∧ T.additiveBlending ∧ T.multiplicativeBlending ∧
  T.orderIndependentTransparency ∧ T.depthPeeling ∧ T.stochasticTransparency

theorem transparency_blending_closed_from_evidence
    (T : TransparencyBlending) (E : TransparencyBlendingEvidence T) :
    TransparencyBlendingClosed T := by
  exact And.intro E.alphaBlendingClosed
    (And.intro E.additiveBlendingClosed
      (And.intro E.multiplicativeBlendingClosed
        (And.intro E.orderIndependentTransparencyClosed
          (And.intro E.depthPeelingClosed E.stochasticTransparencyClosed))))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse