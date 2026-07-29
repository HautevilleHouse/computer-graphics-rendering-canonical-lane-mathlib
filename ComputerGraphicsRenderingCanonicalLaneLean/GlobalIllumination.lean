import HautevilleHouse.ComputerGraphicsRenderingCanonicalLaneLean.RenderingEquation

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure GlobalIlluminationPackage where
  pathTracing : Prop
  photonMapping : Prop
  irradianceCaching : Prop
  ambientOcclusion : Prop
  lightPropagationVolumes : Prop

structure GlobalIlluminationEvidence (G : GlobalIlluminationPackage) where
  pathTracingClosed : G.pathTracing
  photonMappingClosed : G.photonMapping
  irradianceCachingClosed : G.irradianceCaching
  ambientOcclusionClosed : G.ambientOcclusion
  lightPropagationVolumesClosed : G.lightPropagationVolumes

def GlobalIlluminationClosed (G : GlobalIlluminationPackage) : Prop :=
  G.pathTracing ∧ G.photonMapping ∧ G.irradianceCaching ∧ G.ambientOcclusion ∧ G.lightPropagationVolumes

theorem global_illumination_closed_from_evidence (G : GlobalIlluminationPackage) (E : GlobalIlluminationEvidence G) :
    GlobalIlluminationClosed G := by
  exact And.intro E.pathTracingClosed (And.intro E.photonMappingClosed (And.intro E.irradianceCachingClosed (And.intro E.ambientOcclusionClosed E.lightPropagationVolumesClosed)))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse