#!/bin/sh

USERNAME=<username>

# needs to be unique
# recommended 432<coursenumber>
# other staff can try to be lucky
# Recomended 32768-61000
PORT=432<usernum>

NUMNODES=1


ssh -t -L${PORT}:127.0.0.1:${PORT} -4 -l${USERNAME} ela.cscs.ch /users/kleinm/jupyterkey\;ssh -t -4 -L${PORT}:127.0.0.1:${PORT} daint module load analytics\\\;salloc --res=hpccrs02 -N${NUMNODES} -Cgpu start_analytics --login-port ${PORT} --ui-port ${PORT} --run-cmd \\\"jupyter notebook --port ${PORT}\\\"

