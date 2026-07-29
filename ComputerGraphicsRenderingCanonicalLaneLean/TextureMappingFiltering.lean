import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure TextureMappingFiltering where
  textureSample : Prop
  bilinearFilter : Prop
  trilinearFilter : Prop
  anisotropy : Prop
  mipmapping : Prop
  textureWrap : Prop

structure TextureFilteringEvidence (T : TextureMappingFiltering) where
  textureSampleClosed : T.textureSample
  bilinearFilterClosed : T.bilinearFilter
  trilinearFilterClosed : T.trilinearFilter
  anisotropyClosed : T.anisotropy
  mipmappingClosed : T.mipmapping
  textureWrapClosed : T.textureWrap

def TextureMappingFilteringClosed (T : TextureMappingFiltering) : Prop :=
  T.textureSample ∧ T.bilinearFilter ∧ T.trilinearFilter ∧
  T.anisotropy ∧ T.mipmapping ∧ T.textureWrap

theorem texture_mapping_filtering_closed_from_evidence
    (T : TextureMappingFiltering) (E : TextureFilteringEvidence T) :
    TextureMappingFilteringClosed T := by
  exact And.intro E.textureSampleClosed
    (And.intro E.bilinearFilterClosed
      (And.intro E.trilinearFilterClosed
        (And.intro E.anisotropyClosed
          (And.intro E.mipmappingClosed E.textureWrapClosed))))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse