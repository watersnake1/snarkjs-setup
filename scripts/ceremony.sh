# Set up a ceremony for verifying proofs with one contribution
# Assumes you have already compiled your circuits and written to your input.json file

# inputs: $1 is the circuit name.r1cs, $2 is the power required for the ceremony, $3 is the circuit output key name contribution 0, and $4 is contribution 1
echo "creating ceremony with 1 contribution..."
snarkjs powersoftau new bn128 $2 pot12_0000.ptau -v
snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="Test contribution" -v
snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v
snarkjs groth16 setup $1 pot12_final.ptau $3
snarkjs zkey contribute $3 $4 --name="Milady" -v
snarkjs zkey export verificationkey $4 verification_key.json
echo "generating proof"
snarkjs groth16 prove $4 witness.wtns proof.json public.json

