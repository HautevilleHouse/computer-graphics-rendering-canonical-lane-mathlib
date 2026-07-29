import HautevilleHouse.ComputerGraphicsRenderingCanonicalLaneLean.GraphicsPipeline

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure RenderingEquationPackage where
  radianceDefinition : Prop
  reflectionModel : Prop
  lightTransport : Prop
  globalIllumination : Prop
  toneMapping : Prop

structure RenderingEquationEvidence (R : RenderingEquationPackage) where
  radianceDefinitionClosed : R.radianceDefinition
  reflectionModelClosed : R.reflectionModel
  lightTransportClosed : R.lightTransport
  globalIlluminationClosed : R.globalIllumination
  toneMappingClosed : R.toneMapping

def RenderingEquationClosed (R : RenderingEquationPackage) : Prop :=
  R.radianceDefinition ∧ R.reflectionModel ∧ R.lightTransport ∧ R.globalIllumination ∧ R.toneMapping

theorem rendering_equation_closed_from_evidence (R : RenderingEquationPackage) (E : RenderingEquationEvidence R) :
    RenderingEquationClosed R := by
  exact And.intro E.radianceDefinitionClosed (And.intro E.reflectionModelClosed (And.intro E.lightTransportClosed (And.intro E.globalIlluminationClosed E.toneMappingClosed)))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse