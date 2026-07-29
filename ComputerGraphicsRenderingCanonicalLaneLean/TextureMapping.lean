import HautevilleHouse.ComputerGraphicsRenderingCanonicalLaneLean.GraphicsPipeline

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure TextureMappingPackage where
  uvMapping : Prop
  textureFiltering : Prop
  mipmapping : Prop
  textureCompression : Prop
  procedualTextures : Prop

structure TextureMappingEvidence (T : TextureMappingPackage) where
  uvMappingClosed : T.uvMapping
  textureFilteringClosed : T.textureFiltering
  mipmappingClosed : T.mipmapping
  textureCompressionClosed : T.textureCompression
  procedualTexturesClosed : T.procedualTextures

def TextureMappingClosed (T : TextureMappingPackage) : Prop :=
  T.uvMapping ∧ T.textureFiltering ∧ T.mipmapping ∧ T.textureCompression ∧ T.procedualTextures

theorem texture_mapping_closed_from_evidence (T : TextureMappingPackage) (E : TextureMappingEvidence T) :
    TextureMappingClosed T := by
  exact And.intro E.uvMappingClosed (And.intro E.textureFilteringClosed (And.intro E.mipmappingClosed (And.intro E.textureCompressionClosed E.procedualTexturesClosed)))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse