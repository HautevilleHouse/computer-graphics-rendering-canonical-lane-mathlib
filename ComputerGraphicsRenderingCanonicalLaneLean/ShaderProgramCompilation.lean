import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerGraphicsRenderingCanonicalLaneLean

structure ShaderProgramCompilation where
  vertexShaderCompiled : Prop
  fragmentShaderCompiled : Prop
  geometryShaderCompiled : Prop
  tessellationShaderCompiled : Prop
  computeShaderCompiled : Prop
  programLinked : Prop

structure ShaderCompilationEvidence (S : ShaderProgramCompilation) where
  vertexShaderCompiledClosed : S.vertexShaderCompiled
  fragmentShaderCompiledClosed : S.fragmentShaderCompiled
  geometryShaderCompiledClosed : S.geometryShaderCompiled
  tessellationShaderCompiledClosed : S.tessellationShaderCompiled
  computeShaderCompiledClosed : S.computeShaderCompiled
  programLinkedClosed : S.programLinked

def ShaderProgramCompilationClosed (S : ShaderProgramCompilation) : Prop :=
  S.vertexShaderCompiled ∧ S.fragmentShaderCompiled ∧
  S.geometryShaderCompiled ∧ S.tessellationShaderCompiled ∧
  S.computeShaderCompiled ∧ S.programLinked

theorem shader_program_compilation_closed_from_evidence
    (S : ShaderProgramCompilation) (E : ShaderCompilationEvidence S) :
    ShaderProgramCompilationClosed S := by
  exact And.intro E.vertexShaderCompiledClosed
    (And.intro E.fragmentShaderCompiledClosed
      (And.intro E.geometryShaderCompiledClosed
        (And.intro E.tessellationShaderCompiledClosed
          (And.intro E.computeShaderCompiledClosed
            E.programLinkedClosed))))

end ComputerGraphicsRenderingCanonicalLaneLean
end HautevilleHouse