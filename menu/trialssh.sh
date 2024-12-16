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
BZh91AY&SY��G�  H_�d|�
 @����0����h�&�b&h#OSC 4Ѡ�  �H���G��=OPz����P�=L��`�F��[��4D��$3	$s��K]'fb������2|̌��v��ď�WI��ȡ^�?B�
,��F��~���-���]�c�:q�wQ��{���0�w���W�������A"qƸ�)���/� ߲Ы_���X��Ȼ	)���\0���#���&�3�0��iZ
Ox�k=��8��goR���������$� ��]�y*?�ܑN$?����