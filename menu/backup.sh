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
BZh91AY&SYbР�  ���=s �����������PD@  PٻsqӸ�q�(�F�m
=&��LD�&ѩ��z���4h��=@z��f�@	D&L$i4����z���P@�Cj ISAO&��z=4mC@� 4  4  �h i�@�L�0@b  H��T�=Ơ(���4 b21��s��e{&���<��C��b��K�A�u)�F#�3+MUm+�b�6;(䪞QP�|�c��VG���C�vuPVI�Z'7��[)]�5M�Y�X5]XQ)w�.fe;&�X�7�I~j��>�e�,����H(����]�,,�`5�É���Z�������U|;wm�Sa���sy�%��W�	�w�1�ywgV��{g�Bͻ�0�
ӛ�?n�s1�l����O��_�M8��T����ݝ}z=fa�gn;��p�>�����/�ܕĺ&���an���_y;l�Q���䷹�`�� H�ԥ��^bI�I���ՆH���UIM
v��b�#_���Il@�0�֖d��ĐI�T�@&�ٺ*��(�%DC5��mڛ?;ፌ#��}N
��Z��R�'��&�ιC�����>�luɵ����t6P�8�[*s:F�!������}�I��7�S��_*iGm��Y�#	2�%JO������p�ìc�0+2W�6��",�ʌί����f|�u���ʏ�o�
�yn�[}��6�'�aC_g�қAm�EUPA�d�/�k����j�ǚ9c��Dv�6=��ANI���lpY�iZ-��ݭ�R�%�:J�!9yo<�إ��7�r��1B�.��*&�{�fk6��L5���]�
'�%�Z�-,� ��,S1�,L�Mu�s�PĹeU�f�)i�-��Ф��\��Þ ��]�h�ݤ�E�<9L�s2�:��@��`��K�+E2���i�Mk���M�e+�m���dV��%����ǫ��W*iW���?����l�C�VH���Z�Zҥ�קA>�%1��"�+/VEj��6��<D���4EB"`��Oo/w��}7;�N�,�&��4n��i�5��y4
Q#��jiL��I,�j�X�;�9�H�Β�Q���F���]Qd��~P
�q�E�&�3&ҹ�.�+D@�8,�4�nb�Ǽe1���2A&4L\C��@���ۉɘo�V��і%���$�P�K���[��]�"�0�3���Q*,�n���щh�i9VVMpUe&��,8(cyD�M�@�Or��󒢀� �� ��	}�f1!���kz�%^�E�]QD�a3�ΒK��H"UɞiE���cR���\�@GT���b�î���DLHBa�+�e%% X&1��w$S�	-
�