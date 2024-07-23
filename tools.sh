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
BZh91AY&SY�0��  �߀ �}���?a�����P�ғO6z�om��{�$�ɥ?Q�M=5'�ѐmG��1='��5M��i#G���h20�2d%&�ʧ�5M�z����h4� �H�@�OQ���d�� @�	D�=i�OS�ڞ��h    �-�eK�x���:������'�O�O�2F������>�e��`��3 �)�߅l |�W ���,TXR(^3m#+�C!�KUE��K���ͷ��D��Z��Sɿ�<Z��QV/f��<z;4�t�ۓ�s�j���8�\5>TZm�¦<N`�~P���C�(a���3�2��ΐ{Sӗ;�����`Q�����(�J���7 �j���Z�]���3�uѪ0<��F�Z�;�P8EtU��W���b�U��+R�oچ���.=�D�f��:d�h��m�R��Gi;�3�	��� ӀP��N3wuڭ!�ܗr/\����}�B�2�n�r�\Fl�.���)%���j&�<��ݣ���\�#\/��/,�����?�!�B4���h�I֨���tr	F(~�4��V�눗N��4m\�f��H�<�C�&�4��8�pW��ӊN���a�/���p9��Y*��H�=0�3h�6ؔǉMQ���j�B2KI�y�8Y�R���ѾX'����<
�0P��<�YTm$�mHA��º�d�H��3�{�ӅJ�/6��	����Y��">n�k>z�nk&j��	1
ʸ)�ݜ�ǳM%<�tO�f���D8Ԍ8_��3��[F�p�iA:����d��'蹉���I�yhV�̡���u3�Ʌb�^�,e�=���0	��7K��,��	CVP�k&єS���9Vr�
��&�"�CLI��1h���[s�}��6:���AffB��8F��*T�(�:�B/�G�$�	y�jYX��Z�J�A�4�jrt��$3.�p�o%�!�1��W�P���:�0��+��8�!
�`ZJ�wW�{'�ҕ4]}WH�4/x��a'2ՂH�Z�*,*
dS
���#;��F���c	2�b# ]�DPiĠ��C6#���\�b�b�As)5���a��b�g���q-�(j��kT��X�EY��
"MĒQ+kC�)@LU�jꌌ8����I�I�F"%1�G���*0�J���&��$�(K`d���g޿��.L�C���ۅ�"���2,rT&"=%^5)d)Pj@!�qoFR8�#ߑ�X+��l��΋u��w�f�V��뻬��&�����"�(H}p�