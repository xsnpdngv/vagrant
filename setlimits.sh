#!/bin/sh
# ===========================================================================
# @file    setlimits.sh
# @brief   shell script to set system wide limits
# @author  Tamas Dezso <dezso.t.tamas@gmail.com>
# @date    March 27, 2017
# ===========================================================================

cat >>/etc/security/limits.conf <<END
# set core file size limit
*                soft    core            unlimited
root             hard    core            unlimited
# set message queue limits
*                soft    msgqueue        268435456
*                hard    msgqueue        268435456
END

cat >>/etc/sysctl.conf <<END
# set message queue limits
fs.mqueue.msg_default=2048
fs.mqueue.msg_max=2048
fs.mqueue.msgsize_default=4096
fs.mqueue.msgsize_max=4096
END
