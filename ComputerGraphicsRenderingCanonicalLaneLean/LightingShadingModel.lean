import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure LightingShadingModel where
  ambientLighting : Prop
  diffuseLighting : Prop
  specularLighting : Prop
  emissiveLighting : Prop
  phongShading : Prop
  blinnPhongShading : Prop
  physicallyBasedRendering : Prop

structure LightingShadingEvidence (L : LightingShadingModel) where
  ambientLightingClosed : L.ambientLighting
  diffuseLightingClosed : L.diffuseLighting
  specularLightingClosed : L.specularLighting
  emissiveLightingClosed : L.emissiveLighting
  phongShadingClosed : L.phongShading
  blinnPhongShadingClosed : L.blinnPhongShading
  physicallyBasedRenderingClosed : L.physicallyBasedRendering

def LightingShadingModelClosed (L : LightingShadingModel) : Prop :=
  L.ambientLighting ∧ L.diffuseLighting ∧ L.specularLighting ∧
  L.emissiveLighting ∧ L.phongShading ∧ L.blinnPhongShading ∧
  L.physicallyBasedRendering

theorem lighting_shading_model_closed_from_evidence
    (L : LightingShadingModel) (E : LightingShadingEvidence L) :
    LightingShadingModelClosed L := by
  exact And.intro E.ambientLightingClosed
    (And.intro E.diffuseLightingClosed
      (And.intro E.specularLightingClosed
        (And.intro E.emissiveLightingClosed
          (And.intro E.phongShadingClosed
            (And.intro E.blinnPhongShadingClosed
              E.physicallyBasedRenderingClosed)))))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse