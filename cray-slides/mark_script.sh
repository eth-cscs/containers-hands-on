#!/bin/sh

PORT=52002
USERNAME=course80

ssh -L${PORT}:localhost:${PORT} -l${USERNAME} ela.cscs.ch ssh -L${PORT}:localhost:${PORT} daint module load analytics\\\;salloc --res=hpccrs02 -N1 -Cgpu start_analytics -k -e py27 --login-port ${PORT} --ui-port ${PORT} --run-cmd \\\"jupyter notebook --port ${PORT}\\\"

