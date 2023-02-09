#!/bin/bash -eu
#PBS -l select=1:jobtype=core:ncpus=1:ompthreads=1
#PBS -l walltime=00:30:00

search_root_dir=$PBS_O_WORKDIR
flux_log_filename="flux.log"

# 1. Find all files that are named $flux_log_filename
# 2. Create command using xargs. The options `-P 0` create 
#    processes to execute parallel
# 3. Remove these lines from flux log files
find $search_root_dir -name $flux_log_filename -type f \
| xargs -P 0 \
sed -i \
  -e '/crd of center of mass/d' \
  -e '/vel of center of mass/d' \
  -e '/angular vel for rotation/d'

