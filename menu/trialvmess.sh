#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY����  �_�\�|���"�D����@� ��	� L � �0`  0 9�L � � L �)�)�514dhi13D4ƓzMG�RT�~��F�Ea&'��ؼ�$�}�������	1�p؝�+Nc"�8��E��ڒ��rG�E�MNƞ�U���L�S�&0NmI���q���P�"Ɓjs9a�Q��67�!I%L�uԇ�^\J�I�եri���k�����t=�l����4Fg���ʅ��tE�D�y+*j:K�Y[[	4D'�"4��
�S5
S�Ҽ��S
q���d1't�7}#�ʙ
�8ӡ)6w ��/�Xΰ� ���q��21�Gz�$D(�,)C�B�&DV�%,&G*��Ht7���V��3���3�O�iAG�]��BC���