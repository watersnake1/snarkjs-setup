echo "installing required tools for zk snark proof verification on your system... milady"
echo "installing rust"
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
echo "installing circom"
git clone https://github.com/iden3/circom.git
cd circom && cargo build --release
cargo install --path circom
echo "installing snarkjs"
npm install -g snarkjs


