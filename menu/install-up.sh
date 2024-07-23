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
BZh91AY&SY�vN?  V�A�@ ���������   @t���L%@$=f���1��4b4�=���%	��j=&�� �4 h42h�14�@��`�M4 a�#%=L��Sڧ��O)����~��I�&A�#j�,����:&eM�W>��8��1���c�&#$�}��`&$jy������To����; ߧ&��AUv��
L#ݎ"�S��G&"4R9��ീ��`��88d`~�zH�r��L��N� �c��:a�gp�a�t����fU����ꅚy��E����y���ʯlq#*A��a�%���U8��^�C�rY�g�"P)��@<Ş�j�>3�Vg
v�"��7xCI�%Z�jO�\wʳ�m@\>��5��E�Bѝ��a���iX�J��`	1��Jx���#D�.+����F��[8��^��,4E�+�GHLPg&b,�
%�IQq���	xtWVٜ.`l)�5���C��n#Y��Z!6�ẑ�r����P�T����)�`RJ�	�"��*R$:�
p�F%%F�/`��̼�RzlOX�,#�If:$|W�LU���&ݭ�1��XƐ%WQL	�(�bp��-���<if��*h� 4��#-T� �@0X���~���ܑN$!]���