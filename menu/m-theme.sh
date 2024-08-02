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
BZh91AY&SY'��  ��~3~���?����߮@ f�  P���F  $)��z�S�@ѡ��@1��h�4�#M 4Lp4�M���F�d��4ѐ 	���	F��   � F�  4�A����� hh4d  �bA�@&�T�H@= h4�bmM4g���4ڗ!�G)�B4h��5�i����"�����:S�`��[�)�~��+��|iܘ�'�x��/�e���G�Ʊn�o�]=�u[Je�~���0>0P�4f笒IV��
1Eg�3B,h�
W ��{�����)J��$�E;�4>�;`������B�ܩ�ݺ��ǝ�x���E�=� Z8ͽ
����Е!>���*mZ�wz�4ba�� �U�.��c� 2�$���vҜ�Qv�Q-u���E�$�bB��c�c���Ya��Q � �$�-8Ip��VAT`�`(Qh�)%�;��I%�p���N�$�������&����3���PICv���8�HPqЫ� bG,�SԥS��xͲyOX�v�G�Xt;���.�r�H�P+ 
���2��'�ʣ�c�����=�̹��~��J��Ӈ��$@�y6e�tzĜ�U�@��3,�]j�o��|��nV^1p00Ъf��͉y�^�$h�DŎ�S���L���W�\���x��/@џ��IЁZ�\��V���ߙi�E;��j� ]߱J�Y�EH��9y|^�i�k8�}�<�+�噸�-Z�GD�!TT��x�__�W�F4Mh3,A-);��cmvn�(��x��,�\D�5ji):B���-���X��AZn��� ���0����tz�p"\��VF�D"d��YP��	���]����J�Z��)�C�:n �� X�qJ�$ "B��o]_@��d
��s��<�	�����"�(H�B 