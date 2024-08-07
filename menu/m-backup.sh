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
BZh91AY&SYa�7r ���� ����������pF@�  `
���t(�u���3��]��u��@�(�D̍�6��?T�j=M6���SA��Q�M ��hz�=@ � � �  24       � 4    ��       jRiOQ����  �@b    ��24T�S�m4D�(����z�����4d� �z��A��4�M��h�#I�d=)�	���zMPi��=O�S��!���b 0�7zx���mK�1�rJ��z��﯊ׂ��_*�R���u��)��ґ$��I�8�X�6&�\1 ɤ+��:Tw�X�L�5i:����Pf��
V��Ď@LZʺ3[�9�#U����2$�ƿ��[\%�`;��C܉�0'c���u�����P��Nu2���!l
"�H," !ɸT*2<�p_΄P�4)Wb��Th�#o�܂e�#��qqD�eKzT*����H1��C~K������8<�C����8β@��bh D`�?`�%a��������3,�1��[F��F��$c匲 �q�e�96v��W�N�S�~ƳU�<����b!��\G�����1��C|�ș��!%�B*��!-�C�=_��e�T\�����[��L��5�N2%ō�7ߓ�ٻD��¼��y�������T����,�@,4y�*L+;�Ia�̽XB�:g(1�]}g�_e �q�Uj��
���+�'���S���y2V�n�#���X#X,Z&���.-�%FF�-�g)h�=��B,��Iì9tg�{z�4nDR���97�&��H1DR�h��� �M�Y���
B(ʁ�CLW0�'��K2�
E�!YP�����P�,�(���ǬҊ�_�/��7�}�-b�1�)��lT�i���N��p���~��'�0�|(�?��H��|vn���DA��e�-���Ko���ml2�̏�ڑke���G��ԃ��2�"�VF�s�AU݈��g#m�-��68^�D9�}�B���^&�1�+ҚX�t$0�d2�H���Wq.�n#
�"�X��>=��VA�(�1������337�	���)��z�N�1HwHY%7���?���AA �ML�\e�� a3S1W+!��Ail�Ǣ��8G�,Zeb�A�ؐ�z�O1��a��� "��R$I���
� ���.�,��������CkVA�mf���{�*$ %�N�Q	��R9���*��)�2	�0�l�L��,l��"���~
�����E��!�R��/¢�%���ϛ��:�e����ٖ{v�j̏�yO�t�d-���R�'D�,�,
RzHa���#v�P8�$��޾K/��Xu�)z�`]�B�OXt��/���%o�uP�k��gX�'�r"�}|Y��7���l,��em�7V��}�	[��\�<�9�X3����҈[�pZ���Uϲ��	�N��+Mb��Ӌ��l�A�Wk����n��z�����1��
�M���-2�쟀a	��q�.~ IFKo���̛Z�$�3<��G@K������2�,@�*f�6� eI?�o��tT��	�M��l�D�	զ"�o+��`%�	2S"��z�I��Z�>"H�J¢bm�As��ZTGBLLl@��#!e�\G�]Z��������H�I�k�#�@Hui�L�_��GR�ߥ3ٌ Pd�����	 F0}�9�b�L��́&` �$+B�Z�%!��*x�3�Z&2�#��M���f�E�l_�����ɐCLF%�����I�	j�th\�n04q�8*
\,�b �}�����'x��L�T͛�G+ӡ>���Ig�h���lR���MU���5�̢$ʈ��}�]���#b<N��9�����'��Z�s@��+S�ei����Rt^z\؎�Ay�`ZE�h�=�<a�t,�^@9��Z7�b~HʹS���}�5���.�D�x@�,p��Q���V��=�� i3v��)< NIJ$+Ҍ��l^3�B�À���@F@$#�(�s��̄ aG`Hq*�Cw�s%-n=�(d�@B#*���7jiS����;��uƉs�I��pM����.�Ai;D�$~:b��Z���(�]�]�����PC!�Y����ɻ�@ò�t%2޼��(j<	�TJ�s^\��8�S��m0/9ˌ�\�6�S(B�=ڕ�H|1�YЎ#72�,>�8�L�ִ�昭�H*��8L�Ϫ�(����Rb�q�j��:��QSVI�҂ xnD@���`#J��c�+T�)�I"�g�ņ�C�������.$ �$��L�:��&� ��FG�0�A1�[ ]I *f-�4�m&�HP0�Cf60�B��T����4G�d���@gl��cܰ]3���Z0����R*��E(����D3`J�wW � ���(8E(�`��y;HR"�����)�1��