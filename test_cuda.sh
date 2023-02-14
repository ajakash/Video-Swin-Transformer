#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --gres=gpu:v100l:1
#SBATCH --mem=32G
#SBATCH --time=0:30:00
#SBATCH --account=rrg-mori
#SBATCH --output=job_logs/log_%A.out
#SBATCH --error=job_logs/error_%A.out

nvidia-smi

# module load cuda/11.0
# module load singularity

singularity exec --nv -B /home -B /project -B /scratch moma_sand1.sif python -c "import torch; print(torch.cuda.is_available())"