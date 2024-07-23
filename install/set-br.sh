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
BZh91AY&SY�w��  b߀@y�&E�����@�h  VPF�̧���ڃ�� �ai'�LІ�!�F# �   @   %!��L	�T�OMOQ聚��j$��V�{��������SР
-�� ���ơ�e{�����teM����Ǿ��;��=�+�y%P

��Q8(�@��v�B�G�$(%��o@���*��6Sk�'\M�`����]��ue����9�&��ه'�м��:���l��tj;r�����[��L~���+������2�w�*W��SV�9���<�n����z^�m��;a�>����v�eG���w^&d�>�4BAX�����m�v@{�@��>�㢐?�)(4�t�$.ִ$��&�y��d�`�r�2M�����4�6���o[$��]�Pxd.�c�D�w�ڿ����a��9(�I &&M����[u&	F���%��
�L]iܷ�S�v�re�h�Ep�h�lJ�Jg\3���7	h�q���5�$�%��u<��r�eA&�ü�����'���jի��/ZX����xaH��\	♃y��m�ꍁV�P�7�.���*ܴⵋ��	��8�֝Ez$)�rE8P��w��