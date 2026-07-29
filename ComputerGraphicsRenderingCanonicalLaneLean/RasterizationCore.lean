import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure RasterizationCorePackage where
  vertexProcessing : Prop
  primitiveAssembly : Prop
  clipping : Prop
  homogeneousDivision : Prop
  viewportTransform : Prop
  backfaceCulling : Prop
  depthTesting : Prop

structure RasterizationCoreEvidence (C : RasterizationCorePackage) where
  vertexProcessingClosed : C.vertexProcessing
  primitiveAssemblyClosed : C.primitiveAssembly
  clippingClosed : C.clipping
  homogeneousDivisionClosed : C.homogeneousDivision
  viewportTransformClosed : C.viewportTransform
  backfaceCullingClosed : C.backfaceCulling
  depthTestingClosed : C.depthTesting

def RasterizationCoreClosed (C : RasterizationCorePackage) : Prop :=
  C.vertexProcessing ∧ C.primitiveAssembly ∧ C.clipping ∧
  C.homogeneousDivision ∧ C.viewportTransform ∧ C.backfaceCulling ∧ C.depthTesting

theorem rasterization_core_closed_from_evidence (C : RasterizationCorePackage) (E : RasterizationCoreEvidence C) :
    RasterizationCoreClosed C := by
  exact And.intro E.vertexProcessingClosed
    (And.intro E.primitiveAssemblyClosed
      (And.intro E.clippingClosed
        (And.intro E.homogeneousDivisionClosed
          (And.intro E.viewportTransformClosed
            (And.intro E.backfaceCullingClosed E.depthTestingClosed)))))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse