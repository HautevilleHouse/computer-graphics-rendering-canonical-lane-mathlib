import HautevilleHouse.ComputerGraphicsRenderingCanonicalLaneLean.RenderingEquation

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure ShadowMappingPackage where
  shadowMapGeneration : Prop
  shadowTest : Prop
  shadowingIntegration : Prop
  percentageCloserFiltering : Prop
  varianceShadowMapping : Prop

structure ShadowMappingEvidence (S : ShadowMappingPackage) where
  shadowMapGenerationClosed : S.shadowMapGeneration
  shadowTestClosed : S.shadowTest
  shadowingIntegrationClosed : S.shadowingIntegration
  percentageCloserFilteringClosed : S.percentageCloserFiltering
  varianceShadowMappingClosed : S.varianceShadowMapping

def ShadowMappingClosed (S : ShadowMappingPackage) : Prop :=
  S.shadowMapGeneration ∧ S.shadowTest ∧ S.shadowingIntegration ∧ S.percentageCloserFiltering ∧ S.varianceShadowMapping

theorem shadow_mapping_closed_from_evidence (S : ShadowMappingPackage) (E : ShadowMappingEvidence S) :
    ShadowMappingClosed S := by
  exact And.intro E.shadowMapGenerationClosed (And.intro E.shadowTestClosed (And.intro E.shadowingIntegrationClosed (And.intro E.percentageCloserFilteringClosed E.varianceShadowMappingClosed)))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse