#!/bin/bash
#SBATCH -N 2
#SBATCH --gpus-per-task=1
#SBATCH --ntasks-per-node=4
#SBATCH --gpu-bind=none
#SBATCH -t 02:00:00
#SBATCH -q regular
#SBATCH -A nstaff
#SBATCH -C gpu
#SBATCH --image=docker:nvcr.io/nvidia/nightly/cuda-quantum:latest
#SBATCH --module=cuda-mpich

export CUDAQ_MPI_COMM_LIB=${HOME}/distributed_interfaces/libcudaq_distributed_interface_mpi.so

srun shifter python3 nuclear_test.py 
