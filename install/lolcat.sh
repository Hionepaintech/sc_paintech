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
BZh91AY&SYAh�  $_� i�   ?���@   0P��  BH�MA�OI��ޤ"�ɪlЧ�h�=L�L�Ǹ�u�n�h-�M���k���^�D�LVr���pT�j�$�C��iU�,9�JMoOZe>

�-<yJ؇p7S.C,�S��)=�U��<E���+8,��*$�p5ZQd��	]`��8��
H((f�r7=�|��e/}��U޺�e�&P���`�)�o�T
Ĭ[fcK)�C�>[�>��"e�VUλ�w$S�	�