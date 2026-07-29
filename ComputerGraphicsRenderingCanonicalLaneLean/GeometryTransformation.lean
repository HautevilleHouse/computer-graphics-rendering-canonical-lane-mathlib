import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure GeometryTransformation where
  modelTransform : Prop
  viewTransform : Prop
  projectionTransform : Prop
  viewportTransform : Prop
  vertexTransform : Prop
  normalTransform : Prop

structure GeometryTransformationEvidence (G : GeometryTransformation) where
  modelTransformClosed : G.modelTransform
  viewTransformClosed : G.viewTransform
  projectionTransformClosed : G.projectionTransform
  viewportTransformClosed : G.viewportTransform
  vertexTransformClosed : G.vertexTransform
  normalTransformClosed : G.normalTransform

def GeometryTransformationClosed (G : GeometryTransformation) : Prop :=
  G.modelTransform ∧ G.viewTransform ∧ G.projectionTransform ∧
  G.viewportTransform ∧ G.vertexTransform ∧ G.normalTransform

theorem geometry_transformation_closed_from_evidence
    (G : GeometryTransformation) (E : GeometryTransformationEvidence G) :
    GeometryTransformationClosed G := by
  exact And.intro E.modelTransformClosed
    (And.intro E.viewTransformClosed
      (And.intro E.projectionTransformClosed
        (And.intro E.viewportTransformClosed
          (And.intro E.vertexTransformClosed E.normalTransformClosed))))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse