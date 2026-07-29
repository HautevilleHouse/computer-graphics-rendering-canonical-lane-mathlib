import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure PostProcessingPackage where
  colorGrading : Prop
  toneMapping : Prop
  gammaCorrection : Prop
  antialiasing : Prop
  depthOfField : Prop
  motionBlur : Prop
  bloomEffect : Prop
  ambientOcclusionPost : Prop

structure PostProcessingEvidence (P : PostProcessingPackage) where
  colorGradingClosed : P.colorGrading
  toneMappingClosed : P.toneMapping
  gammaCorrectionClosed : P.gammaCorrection
  antialiasingClosed : P.antialiasing
  depthOfFieldClosed : P.depthOfField
  motionBlurClosed : P.motionBlur
  bloomEffectClosed : P.bloomEffect
  ambientOcclusionPostClosed : P.ambientOcclusionPost

def PostProcessingClosed (P : PostProcessingPackage) : Prop :=
  P.colorGrading ∧ P.toneMapping ∧ P.gammaCorrection ∧
  P.antialiasing ∧ P.depthOfField ∧ P.motionBlur ∧
  P.bloomEffect ∧ P.ambientOcclusionPost

theorem post_processing_closed_from_evidence (P : PostProcessingPackage) (E : PostProcessingEvidence P) :
    PostProcessingClosed P := by
  exact And.intro E.colorGradingClosed
    (And.intro E.toneMappingClosed
      (And.intro E.gammaCorrectionClosed
        (And.intro E.antialiasingClosed
          (And.intro E.depthOfFieldClosed
            (And.intro E.motionBlurClosed
              (And.intro E.bloomEffectClosed E.ambientOcclusionPostClosed))))))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse