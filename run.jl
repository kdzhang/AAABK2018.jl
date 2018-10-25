
########
push!(LOAD_PATH, "/Users/h/Dropbox/Research/Reallocation/AAABK Julia Version")
using Revise
using AAABK_Baseline
using BenchmarkTools

λ =  1.131874350361868
ψ =  0.037175089899834
ν =  0.205622086535123
α =  0.925520992611854
ϕ =  0.216311889844990
θˡ=  1.390807772162332
θʰ=  1.751156379867318
θᴱ=  0.023600456924424
ε =  2.900000000000000
ρ =  0.020000000000000
γ =  0.500000000000000
γᴱ=  0.500000000000000
σ =  2.000000000000000
Lˢ=  0.165500000000000
ω =  1.0


p = Params(λ,ψ,ν, α, ϕ, θˡ, θʰ, θᴱ, ε, ρ, γ, γᴱ, σ, Lˢ, ω)

eq,res = solveBGP(p);
@benchmark eq,res = solveBGP(p)
