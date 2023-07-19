# Build nusystematics and nuisance
./build_nusyst.sh

# setup the environment
source setup.sh

# Produce some GENIE events
./run_genie.sh

# Run nuisance on that file to get the weights
nuiscomp -c sbnd_nuisance.xml -o sbnd_weights.root