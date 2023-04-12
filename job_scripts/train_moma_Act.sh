#!/bin/bash -l

#SBATCH --nodes=1
#SBATCH --gres=gpu:v100l:1
#SBATCH --mem=32G
#SBATCH --time=11:59:00
#SBATCH --account=rrg-mori
#SBATCH --output=job_logs/log_%A.out
#SBATCH --error=job_logs/error_%A.out

singularity exec --nv -B /home -B /project -B /scratch moma.sif \
    python tools/train.py configs/recognition/swin/swin_base_patch244_window877_momaAct_22k.py \
    --test-best --test-last --validate