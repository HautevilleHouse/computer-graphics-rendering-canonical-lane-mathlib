import HautevilleHouse.ComputerGraphicsRenderingCanonicalLaneLean.GraphicsPipeline

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure AntialiasingPackage where
  multisampling : Prop
  supersampling : Prop
  morphologicalAntialiasing : Prop
  temporalAntialiasing : Prop
  subpixelReconstruction : Prop

structure AntialiasingEvidence (A : AntialiasingPackage) where
  multisamplingClosed : A.multisampling
  supersamplingClosed : A.supersampling
  morphologicalAntialiasingClosed : A.morphologicalAntialiasing
  temporalAntialiasingClosed : A.temporalAntialiasing
  subpixelReconstructionClosed : A.subpixelReconstruction

def AntialiasingClosed (A : AntialiasingPackage) : Prop :=
  A.multisampling ∧ A.supersampling ∧ A.morphologicalAntialiasing ∧ A.temporalAntialiasing ∧ A.subpixelReconstruction

theorem antialiasing_closed_from_evidence (A : AntialiasingPackage) (E : AntialiasingEvidence A) :
    AntialiasingClosed A := by
  exact And.intro E.multisamplingClosed (And.intro E.supersamplingClosed (And.intro E.morphologicalAntialiasingClosed (And.intro E.temporalAntialiasingClosed E.subpixelReconstructionClosed)))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse