**Coding Challenge \- AI-assisted extraction of architectural parameters from RISC-V specifications**

Develop prompts which extract the parameters from the snippets of text from the ISA Manual. Usually, usage of following words implies a parameter: "may/might/should," "optional/optionally" and "implementation defined” or “implementation specific".

Please submit the following information:

1. Details about the LLM(s) used (name, version, context length etc.)  
2. Prompts: Especially how you developed and refined the prompt, dealt with model hallucinations etc.  
3. Results formatted as a YAML file with fields for name, description, type and constraints etc.

Snippets:

Privileged Spec 19.3.1: 

Caches organize copies of data into cache blocks, each of which represents a contiguous, naturally aligned power-of-two (or NAPOT) range of memory locations. A cache block is identified by any of the physical addresses corresponding to the underlying memory locations. **The capacity and organization of a cache and the size of a cache block are both implementation-specific,** and the execution environment provides software a means to discover information about the caches and cache blocks in a system. In the initial set of CMO extensions, the size of a cache block shall be uniform throughout the system.

Privileged Spec 2.1: 

"Conventional" R/W accessibility of CSRs according to [address mapping](https://docs.riscv.org/reference/isa/priv/priv-csrs.html#2-1-csr-address-mapping-conventions) 

The standard RISC-V ISA sets aside a 12-bit encoding space (csr\[11:0\]) for up to 4,096 CSRs. By convention, the upper 4 bits of the CSR address (csr\[11:8\]) are used to encode the read and write accessibility of the CSRs according to privilege level as shown in [Table 1](https://docs.riscv.org/reference/isa/priv/priv-csrs.html#csrrwpriv). The top two bits (csr\[11:10\]) indicate whether the register is read/write (00,01, or 10) or read-only (11). The next two bits (csr\[9:8\]) encode the lowest privilege level that can access the CSR.

