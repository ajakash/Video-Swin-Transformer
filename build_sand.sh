#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --gres=gpu:v100l:1
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --account=rrg-mori
#SBATCH --output=job_logs/log_%A.out
#SBATCH --error=job_logs/error_%A.out

nvidia-smi

# module load cuda/11.0
# module load singularity

# singularity build --remote --sandbox SANDBOX_REMOTE_DOCKERFILE/ docker/docker_11.0/Dockerfile
singularity build --remote moma_dockerfile.sif docker/docker_11.0/Dockerfile
