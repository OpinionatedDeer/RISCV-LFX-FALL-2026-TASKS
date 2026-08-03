#include "llvm/IR/PassManager.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Plugins/PassPlugin.h"
#include "llvm/Passes/PassBuilder.h"

using namespace llvm;

namespace {

    uint64_t loadCount = 0, storeCount = 0;
    void loadCounter(Module &Module){
        for(auto &Function : Module){
            for(auto &BasicBlock : Function){
                for(auto &Instruction : BasicBlock){
                    switch (Instruction.getOpcode()) {
                        case Instruction::Load:
                            loadCount++;
                            break;
                        case Instruction::Store:
                            storeCount++;
                            break;
                        default:
                            break;
                    }
                }
            }
        }
    }


    class SimplePass: public PassInfoMixin<SimplePass> {
    public:
            PreservedAnalyses run(Module &M, ModuleAnalysisManager &MM) {
            loadCounter(M);
            errs()<<"Load Count: "<<loadCount<<"\nStore Count: "<<storeCount<<"\n";
            return PreservedAnalyses::all();
        }
    };

} 

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION,
        "SimplePass",
        LLVM_VERSION_STRING,
        [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name,
                   ModulePassManager &MPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "Simple-Pass") {
                        MPM.addPass(SimplePass());
                        return true;
                    }
                    return false;
                });
        }
    };
}
