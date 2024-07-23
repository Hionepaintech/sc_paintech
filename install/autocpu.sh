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
BZh91AY&SY@۸ Q��!x���?�������@D@  P�J ^�h �IFI�&�M6��M��cH4�=	��=54�y�d�C ��2 i� 4��4 s&� FA�L1 Ѧ������M='� h        $�F�1M���M6���M d4�G��F��������S��Fh����)�BL�L��4VЊG�oYDA���vD�
ȏsƫ=�We��	�c���{��@{fa�I�~�)�^��;_*�i`�b3��t"�9d,ޱ�s`��#K&���;�m#1r���4Њ�E TD���oU�'J���N�EWp�r�O��k]9z!����=`���*�
2��g�V����0@M�$A�pw�� !1:A} ��)
FsŘ�!��auv��4{#���xXv�����������ڴ�s\}U���3vn�p�
@>d�GlH����p7Ff	&GxwL��ã�������{`�
TJ���-���N�B6{#�P��|I^����An�w��iB�:*vG����!ۻ���NK���� h ��Cd��.c���&RW9�D!��9�
�3�[ںڑ���P�U�.t�q�EU��ĉ[G���Y�ߊ,p��i,�s�f}�.�Z8�֒����С�� ��Rިvm�����^D��.K��;�^j�����RA�V ��	������ʳ[!�s��P����H�VM���ux1ZՉ�dY���CFt��4�W<��;��AN�W0��>d��B���C��v�K=���?6�����H�#M�H��ɕÝ����wJ�ab@�^OzS�m��1�y`�w�&��NajP�\C�g� ��	���:��V�i!mQ0R�!]��Ȅ�W!����y�>#��c(��3[wmn$+1B��(�����f�K%�E�,���d�d���M���0P|�U���J�X�� ��(�ʦ��"e겝��g��/����H4�K����S�8�N���ɘ7-̳a�(FI2A�u��b4NS���ĤM汑���x�*	/��6�'?s6���[�y�3-��'�p�m�J(΋��,HNhL������}�JG��	�3g6*� ˿�G��f$Z�h"�!���D��ElՐ$�3���e:k�	�:������uʅN�c����-��k�=��-��ɓd������l��G�G�ch-7F��nG���g`h���w�[ �S;�B��E`n�O�V,<�g]	b)qj3�؂��(0GWI�kQ���0�	ҧ2Bp�;5b�p�S-��+E�+h��f����S�� ��,���	�^X\$��a�/�-K8��*+[���X]uD$s٫j�^��!�Q�#�>�(#B�j+6&���q�*-�P��ᗬ�#$EU m�q��w�V6��ٓ.�3�������&�0�\�Ç �a�?��H�
�w 