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
BZh91AY&SYƜ�@  �߀ ��e�*����P�rlc� *4�=M4� @hd@��P��<�� A� ��$ԕ4Hh�@d   %a����&�jd�A=L��z����0	�  � 	��m���{%��ݔd�?LJ����jT&X��q<��Z��k�YS*fZ��J�3U���U��_��}c��UUUUUUUUUUUUUUU�2w�7�v�#�`z/p�2B�m��zQW�=۾�
pU��S��@�|<h�QP=	%UkA
AߵW�4!wV�� גHNTc�F@ Z�jG"\���bHK��}�EQEQEo�%���D�m$�
EQF�I(�6����N���b��U��#�����:Kx§������k,��*�lx�����"q���B!0�H�H�ڲID�*�C��*�r}j��k�  �I7*J	%ri7�Rã����8�q�Me)YYO�!u+#����po��\�o2ګ��U�1�I$�Kd���uce���U��熙 H���F kܫr��n�s{;̯j�" ,� �NS�i�U�U���*�ǟ���/k�p�i��P�N�ʅk�@���a��*��HHTU/pU�I	g���y!!{�\Uqj�cYr���>�*�WZ�x�g�m�3SB��Z������l j}��\of���X�W�i�46�>­�'T$	�� 4*��pڋo�żU�n��c���s7q��ʷ�*�R9�p������`�⫛{��:3�K=`��$�4U������$�gj�]�דT�I$���w��jm|�w��Ħ��hq?�w$S�	iϔ 