import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure RayTracingIntegratorPackage where
  rayGeometry : Type u
  intersectionTest : Prop
  bsdfEvaluation : Prop
  lightSampling : Prop
  russianRoulette : Prop
  multipleImportanceSampling : Prop
  pathTermination : Prop

structure RayTracingIntegratorEvidence (I : RayTracingIntegratorPackage) where
  intersectionTestClosed : I.intersectionTest
  bsdfEvaluationClosed : I.bsdfEvaluation
  lightSamplingClosed : I.lightSampling
  russianRouletteClosed : I.russianRoulette
  multipleImportanceSamplingClosed : I.multipleImportanceSampling
  pathTerminationClosed : I.pathTermination

def RayTracingIntegratorClosed (I : RayTracingIntegratorPackage) : Prop :=
  I.intersectionTest ∧ I.bsdfEvaluation ∧ I.lightSampling ∧
  I.russianRoulette ∧ I.multipleImportanceSampling ∧ I.pathTermination

theorem ray_tracing_integrator_closed_from_evidence (I : RayTracingIntegratorPackage) (E : RayTracingIntegratorEvidence I) :
    RayTracingIntegratorClosed I := by
  exact And.intro E.intersectionTestClosed
    (And.intro E.bsdfEvaluationClosed
      (And.intro E.lightSamplingClosed
        (And.intro E.russianRouletteClosed
          (And.intro E.multipleImportanceSamplingClosed E.pathTerminationClosed))))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse