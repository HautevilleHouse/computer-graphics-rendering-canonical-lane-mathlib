import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure RasterizationPipeline where
  vertexProcessing : Prop
  primitiveAssembly : Prop
  rasterization : Prop
  fragmentProcessing : Prop
  outputMerging : Prop

structure RasterizationEvidence (P : RasterizationPipeline) where
  vertexProcessingClosed : P.vertexProcessing
  primitiveAssemblyClosed : P.primitiveAssembly
  rasterizationClosed : P.rasterization
  fragmentProcessingClosed : P.fragmentProcessing
  outputMergingClosed : P.outputMerging

def RasterizationPipelineClosed (P : RasterizationPipeline) : Prop :=
  P.vertexProcessing ∧ P.primitiveAssembly ∧
  P.rasterization ∧ P.fragmentProcessing ∧ P.outputMerging

theorem rasterization_pipeline_closed_from_evidence (P : RasterizationPipeline)
    (E : RasterizationEvidence P) : RasterizationPipelineClosed P := by
  exact And.intro E.vertexProcessingClosed
    (And.intro E.primitiveAssemblyClosed
      (And.intro E.rasterizationClosed
        (And.intro E.fragmentProcessingClosed E.outputMergingClosed)))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse