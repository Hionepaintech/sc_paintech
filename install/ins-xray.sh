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
BZh91AY&SY_h� �߀�}���������`��r���ξ�O{��׹���[�� 蒁'Y:A��t	"L�djm?hT�5O�<�驣Oh���ɣC	�=SA�M@52 ��ASi��)�=Lƍ	�C d !���  �h4��� �Ѧ@@� �"e4i���J2�?H�4���ij6M54��`���J�К�FL6��2i��z��FF� i�0��� ����ML��&Sh�b�&&j��@h 4i&d�#��.�O��.~FwA�uu�d����ҟl`�)J*ԍ�!��7�ڶ
�,��V"R ��G��
�b�Q���MJ&��J��l�Q�3����E0��&]���?�o���~~��+и��aVx��Dt����?�E�G2-�n���1�J�Pd	?ˋK��= 4�W�_t5�t�f�n�X 땊 A��tL��`iJ��7������~(@q �	"!߿�m�^4��P� �!/�b !�M���Ϡk�������������!ν�z�K�u^
n�ѝ��ٸ�\Fו{١ ��=�x�,�>��|Ȧ�>j����������(\��2c�.ʚMt���Y����yHF��������W��h���"⸏�C��m�	n�i���{�.?Z�}~�]�+x�������=>��T���4�ƕ�@;!�I���y�pB�k}�H��Q�B��OI��$�B+ � ��'X�R��qV�e9������{w���U��)�8)�c�;����^��`�Z�:i�Z���e���a|3�'���f��EUۯ%�zY# @(RW�&YBsЙk�c1�� �6�"����(-F��+80F��)}E�ȃ�� �M�Z�2����u|��/{_/���x<D=!���+l"v9Q�,Z���kG� ���-�Ji{�wh�`a��ɫvE��A�|JNȺ�?�Hbn:��x�m��N��VKd�j*LM�_�+�3ބy�M��w{ģ��"�!��C��S��	"A�jؤ�!"�%gd�����B���"6��Ŷ������@Ue��#Q9�D���Kvub��q`���l�p�М�2E��>���P�����F"�M�+�a!����� ���~q��*��	�oH3�k#�ʍ,̓32S�N��KB���,�A�Zfr�M��To�+��S��,���e��{͂�B�H=M��(�O����{���ᚦ�S}��Ş�a4~�reF6�������2H�+U�E�a1�|O�V��P&T�ڡ$*!��OL��1Ga����l,����8�u�Y�%եd���Q�s�]�^YdL$ z����h软1T���S:iC R���>�&�7F��gШ�`ɷ��S@��}��m���l���SM}���VB��S���LkJl˜�ݺ�d6ܜR�� �����}u��y��������sXA�1��<c�Ϻ���r�̓�7��5�.��E��\�3�&E�G��z=)��rT<uP��9Y1
cKW��3.��?��/���ٓe�˜���.s${W��sI!�F��
FQ'U�i������`y�W��1�w�GK����u�μ��O|y[K��1@GRŪ��~�V"���T}ۛ�}��2/[�Z��ΘB�|�ewW:��Q�X$�����w�����3`^m2ҵ���f����s�ߘf`�({�/��k�i��}@�-��x�3�_9BQ����7�˞�P�D�V���yQ��svJ��.��&��qq���;�+Z�"<�h"~A<���������` ` p��+g	��	�K#_輜RN��0�S0Lq�y�L��؇kUZ�~@�Aׂ�d�~��6�1���KӛԹ|��b���ԀӰXC��A+"Z?g�a���d��p��T�IB�ZY�T1;�����
�|	 ����4(\@��Ԫ>�u
��,�RHp�rm���Yh�E�8B��P�$�
XS�ͳ��s�l�u�76��M� ��`�!jT�٠�;����:��Y��-3A9�KwPD�n�c�u����k�� ��1���%�y�l���:i�5��]7�e׻�9s���i4�s-Ɓ7i08Z8�h⧜D��m^ۧ7�)���q7��D��4-XSp�g-NЂ�v"_�TM����<�9c�P� �$"��Nzwtt-�K��adՍ���^��o�'x�6��Čr�tPMR��3b�"��a1��mX� ��;E�؞��H��S��	��	=]��N����v���Ce���J�PP�&�Ob�#�]췂~ '��`n
�@��S�%��'��飍$��qp�F�� ����y��@v%�]eOg����U���h� V�$J�P���BB�׿�\fb��h6�B�ڸ�$@?F<�z̑0�\:_d��ҺF;@��U!� �7h���T1�n���kx�I��KD+/M��D�� �8��オ�Jr(ZU뎯D.�z-2�7r����n53����a�J_�	�Л �w-3w�:���UpOi?��o��nx�t^��6�FK1� �7I�ӱ��(����e�0��e��Դ�Gћ��4�b����$��$c/*Z,6�&%�l�~����q`\۽M�h`7(��O�E* �@��8�o�b��k�-5̿�Cw�v"#���aԽ���� M��D�٩��s�C >^[���a���lD@�g>#��&�N�2��c����ڍrr�]M+��������#�sj;�O�N"d.�m``�/(WG�9�
���v��f�J��ÚE{�3c��_pP2�S�`�NEF]�$j]�:|"b��C��(HAy�vo�arQ,d��h��8�lA��S9~�/ ��I+o�3D.l����3Dҡ�=�To27'QK�=!�ïP/^�>-�-؁W�	�`AF{,������P�M�T�6����;�wZ&�G�%$�X�зz$�-*J��v�<�K��� ټ�:��[�Z�仁\ِ�cH�@�L���(4�Ah9���������h$#��d�܂�����0��^;1S%��L��8]	���	�9X�D�-Z)��AZ=�3
���WU�/Z�1�����ZT0=V ;`{C�4�Ő���'!�����t��ʑ������+��&�ł���.�.��E` 46�^OAW�L�3P5�@��0u��Sx}%��p����NU�C��fC��ps9�\ӦlS=��7��W�*@�Z��K6�jDD�,DN�faP$7��'V�� �G9��HcE� ����P�xSx��j*�i�!h��IR��b�&��	x��������jM\�Һ_F"Z)_*�\�4�L���膛�b��u0<��G�#����R��z�����u�j�Z�A�"�ܛQ���O+Z]/���_�.�p� ��%�