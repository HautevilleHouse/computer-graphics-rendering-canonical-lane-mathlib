import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure TextureAndFilteringPackage where
  uvMapping : Prop
  textureSampling : Prop
  bilinearFiltering : Prop
  trilinearFiltering : Prop
  anisotropicFiltering : Prop
  mipmapping : Prop
  normalMapping : Prop
  displacementMapping : Prop

structure TextureAndFilteringEvidence (T : TextureAndFilteringPackage) where
  uvMappingClosed : T.uvMapping
  textureSamplingClosed : T.textureSampling
  bilinearFilteringClosed : T.bilinearFiltering
  trilinearFilteringClosed : T.trilinearFiltering
  anisotropicFilteringClosed : T.anisotropicFiltering
  mipmappingClosed : T.mipmapping
  normalMappingClosed : T.normalMapping
  displacementMappingClosed : T.displacementMapping

def TextureAndFilteringClosed (T : TextureAndFilteringPackage) : Prop :=
  T.uvMapping ∧ T.textureSampling ∧ T.bilinearFiltering ∧
  T.trilinearFiltering ∧ T.anisotropicFiltering ∧ T.mipmapping ∧
  T.normalMapping ∧ T.displacementMapping

theorem texture_and_filtering_closed_from_evidence (T : TextureAndFilteringPackage) (E : TextureAndFilteringEvidence T) :
    TextureAndFilteringClosed T := by
  exact And.intro E.uvMappingClosed
    (And.intro E.textureSamplingClosed
      (And.intro E.bilinearFilteringClosed
        (And.intro E.trilinearFilteringClosed
          (And.intro E.anisotropicFilteringClosed
            (And.intro E.mipmappingClosed
              (And.intro E.normalMappingClosed E.displacementMappingClosed))))))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse