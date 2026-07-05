#!/bin/bash

pthtop="$(cd "$(dirname "${0}")/../../../.." && pwd)"
source "${pthtop}"/manage/lib/params.sh
source "${pthtop}"/manage/lib/shared.sh
source "${pthcrr}"/params.sh

pthapp="${pthsrc}"/envplw
pthmsp="${pthapp}/msp"
pthprj="${pthapp}/plw"
cntprj='/opt/playwright'

test -d "${pthapp}" || mkdir "${pthapp}"
test -d "${pthmsp}" || mkdir "${pthmsp}"
test -d "${pthprj}" || mkdir "${pthprj}"

addimg ${imgtgt} "${cnfimg}" "${pthdoc}"

docker run -v "${pthprj}":"${cntprj}" --name ${cnttgt} ${imgtgt} /exp/runcfg.sh "${cntprj}" && \
docker commit ${cnttgt} ${imgtgt} && \
docker stop ${cnttgt} && \
docker rm ${cnttgt}
