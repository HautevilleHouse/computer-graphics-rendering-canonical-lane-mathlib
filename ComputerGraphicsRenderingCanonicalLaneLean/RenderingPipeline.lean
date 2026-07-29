import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure RenderingPipelinePackage where
  sceneGeometry : Type u
  cameraModel : Type v
  lightingModel : Type w
  rasterization : Prop
  rayTracing : Prop
  shadingModel : Prop
  samplingStrategy : Prop
  pipelineStages : List String

structure RenderingPipelineEvidence (P : RenderingPipelinePackage) where
  rasterizationClosed : P.rasterization
  rayTracingClosed : P.rayTracing
  shadingModelClosed : P.shadingModel
  samplingStrategyClosed : P.samplingStrategy

def RenderingPipelineClosed (P : RenderingPipelinePackage) : Prop :=
  P.rasterization ∧ P.rayTracing ∧ P.shadingModel ∧ P.samplingStrategy

theorem rendering_pipeline_closed_from_evidence (P : RenderingPipelinePackage) (E : RenderingPipelineEvidence P) :
    RenderingPipelineClosed P := by
  exact And.intro E.rasterizationClosed (And.intro E.rayTracingClosed (And.intro E.shadingModelClosed E.samplingStrategyClosed))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse