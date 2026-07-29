import HautevilleHouse.ComputerGraphicsRenderingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure GraphicsPipelinePackage where
  vertexProcessing : Prop
  rasterization : Prop
  fragmentProcessing : Prop
  outputMerging : Prop
  pixelOutput : Prop

structure GraphicsPipelineEvidence (P : GraphicsPipelinePackage) where
  vertexProcessingClosed : P.vertexProcessing
  rasterizationClosed : P.rasterization
  fragmentProcessingClosed : P.fragmentProcessing
  outputMergingClosed : P.outputMerging
  pixelOutputClosed : P.pixelOutput

def GraphicsPipelineClosed (P : GraphicsPipelinePackage) : Prop :=
  P.vertexProcessing ∧ P.rasterization ∧ P.fragmentProcessing ∧ P.outputMerging ∧ P.pixelOutput

theorem graphics_pipeline_closed_from_evidence (P : GraphicsPipelinePackage) (E : GraphicsPipelineEvidence P) :
    GraphicsPipelineClosed P := by
  exact And.intro E.vertexProcessingClosed (And.intro E.rasterizationClosed (And.intro E.fragmentProcessingClosed (And.intro E.outputMergingClosed E.pixelOutputClosed)))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse