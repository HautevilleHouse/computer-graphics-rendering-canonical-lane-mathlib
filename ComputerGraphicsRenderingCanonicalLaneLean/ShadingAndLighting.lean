import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure ShadingAndLightingPackage where
  brdfModel : Type u
  directLighting : Prop
  indirectLighting : Prop
  ambientOcclusion : Prop
  subsurfaceScattering : Prop
  emissionMapping : Prop
  environmentLighting : Prop

structure ShadingAndLightingEvidence (S : ShadingAndLightingPackage) where
  directLightingClosed : S.directLighting
  indirectLightingClosed : S.indirectLighting
  ambientOcclusionClosed : S.ambientOcclusion
  subsurfaceScatteringClosed : S.subsurfaceScattering
  emissionMappingClosed : S.emissionMapping
  environmentLightingClosed : S.environmentLighting

def ShadingAndLightingClosed (S : ShadingAndLightingPackage) : Prop :=
  S.directLighting ∧ S.indirectLighting ∧ S.ambientOcclusion ∧
  S.subsurfaceScattering ∧ S.emissionMapping ∧ S.environmentLighting

theorem shading_and_lighting_closed_from_evidence (S : ShadingAndLightingPackage) (E : ShadingAndLightingEvidence S) :
    ShadingAndLightingClosed S := by
  exact And.intro E.directLightingClosed
    (And.intro E.indirectLightingClosed
      (And.intro E.ambientOcclusionClosed
        (And.intro E.subsurfaceScatteringClosed
          (And.intro E.emissionMappingClosed E.environmentLightingClosed))))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse