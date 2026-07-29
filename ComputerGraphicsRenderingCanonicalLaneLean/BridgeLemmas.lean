import ComputerGraphicsRenderingCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GraphicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse
