module RBDMassMatrix

using RigidBodyDynamics

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    mechanism = rand_tree_mechanism(Float64, [QuaternionFloating{Float64}; [Revolute{Float64} for i = 1 : 5]; [Fixed{Float64} for i = 1 : 5]; [QuaternionSpherical{Float64} for i = 1 : 5]; [Prismatic{Float64} for i = 1 : 5]; [Planar{Float64} for i = 1 : 5]]...)
    state = MechanismState(mechanism)
    rand!(state)
    M = mass_matrix(state)
    println(M)
    0
end

end # module

using RBDMassMatrix

RBDMassMatrix.julia_main(String[])

