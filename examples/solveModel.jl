
# Solving the baseline version of the model with estimated parameters
using AAABK2018

# parameters
λ =  1.131874350361868; ψ =  0.037175089899834; ν =  0.205622086535123
α =  0.925520992611854; ϕ =  0.216311889844990; θˡ=  1.390807772162332
θʰ=  1.751156379867318; θᴱ=  0.023600456924424; ε =  2.900000000000000
ρ =  0.020000000000000; γ =  0.500000000000000; γᴱ=  0.500000000000000
σ =  2.000000000000000; Lˢ=  0.165500000000000; ω =  1.0

p = Params(λ,ψ,ν, α, ϕ, θˡ, θʰ, θᴱ, ε, ρ, γ, γᴱ, σ, Lˢ, ω)

# initial guess for equilibirum objects
eqInit = [ 2.00, 0.55, 0.06,
		   0.72, 0.83, 1.73] 

# solve
eq,res = solveBGP(p,eqInit);

# solve with 5% incumbent R&D subsidy
pIncSub = Params(p, (sⁱ = 0.05,))   # Params(pOld, modifiedParameters)
eqIncSub,resIncSub = solveBGP(pIncSub, eqInit);

# solve with 5% operation cost subsidy
pFixSub = Params(p, (sᶠ = 0.05,))
eqFixSub,resFixSub = solveBGP(pFixSub,eqInit);

# solve with 5% entrant R&D subsidy
pEntSub = Params(p, (sᴱ = 0.05,))
eqEntSub,resEntSub = solveBGP(pEntSub,eqInit);

#social planner problem
eqSoc,resSoc = solveSocialPlanner(p)

# optimal policy
# one-tool policies
optPolInc = policy_opt(p, sⁱ = true)
optPolFix = policy_opt(p, sᶠ = true)
optPolEnt = policy_opt(p, sᴱ = true)

# two-tool policy
optPolInc_Fix = policy_opt(p, sⁱ = true, sᶠ = true)
