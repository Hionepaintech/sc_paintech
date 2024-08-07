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
BZh91AY&SYܽA' ��qx����������`���P  @ �| J* �B�T(D��*A��$�U*����44    �  � aƆ��   @  �� 0�CF��@      @d q��F�F��   �  �2 U!i����Ħ2=�dbM3#M�yOH0	��JQ4L	�Jm2i��)�z��i��?Td4z�SF�2zNl����k���Ϧґ�0��v/�}O<�bllg~�����{�����md�5�~�ܶMo�m���e��N7Ԯ.I���lbpr10�����r�2jf�}3F��a��i�gW���Y.F*o�N39�ҭ�&L:n���0�5���֭�j���or8��9��r.Iona���vY����͹֣�r�?�o��m�b��S����_�����w�nI������թ��5�𫝅e;.5ZO�r���|�9��{�ioh�Y��O����ѱ̮f�h�^��d��Wڗ����m�S�D��.��'+m����ky2���h��O4w��*�]'�[UƖ�f|.�­Ł�ʯ583~��qt�#��Ȇ�e�,//�kL��db�Ŭc��6\��ʴ�����w�_Li�k\��Y�
�Η4��.m=��XU��1���1�#�:K�9G��~�=
�?u=J�S�������t�����f�����hɇ�W�{On�M��6��뙵���W��z_��766�8�t�[�Y6K�����n~ jU�X����+����Ԏ/]��3kh��+�M���=-��������V�����O��?"����Xw�a��_[����*��j��w״�~)���w��_b�L�m��x�[���*������Jw�(�0>:�u�F�,,Yw]weԶ��,o}V��dz�}������X���L�-*���U�-���]�-����0W�X����/��l��<S'�ϰ�=N�¸���dĦG��h���t#KQ����C㏸�o*���t���符��lsMS�ԭLL5%f���1�[[�k'�|l���'ݫ[���kw���ka��O�Z��vT{��2����,�z�"YR��dP��S#/�J��|�]7�l��J��'�w�����þ盙S)��:�r�����n]��b�Z&���ls��Uv9��3'����6���kίm;j���!�º�K�u-�p�^�2O=��t�%���o�.��.
aWq���W@����-9Y��b�;Kb�e+W����䓅=d�p|s�Tұ6+�7��a���X�|NG�ݜ�~��f�dԿ��L��i5�j*��{5m~gȖ%qUkj�[6L<m��N��^�{'̯ȯ:wǽ8;��ku�m��,��h��,�-�#����pyk���4��2�+Ԭ+��XW��������l�'4�ϩ����-���F���|W��~&���ɶ�N�3W����y��]�|������-v��:�۝��_�w��5游��ZƱ��FFFJb8�vYr�[#dm�
#j�m��G�W4{��Ǧ:nѹ�}�R��>F��+��VJ�{�LS���J�JXa�������U��9쌲2�x.�.�}��G]�ĸ�����Eu2��XE�_�_ɵ�i���5'Aabﴔ�o��#�؏*�k�w�
��W[�,64kW"��3��5�Q6I�c��M#�1l���r�U��mW�`i�JԮFۚ���ZM'��q)�O][٥�['j�j�+Y0���r͔��5<-��N��7_���t;T�Oq�m��mY�V�oV��qL�ۍ��p�4u]����6/<m�#.�X�'+�E��|o��nV�n˥��K���&J�Vȼ�
ŋ#ڽ��^�KE�YVa���V,>��3��䶾i�~��j�4{�o,��[��7J�1bX{��K�`����ﺮ��=*¿D�d���霬O�3v�Չ��J��
��+6L��C�2��^h��4���
�%��r��v�5W��)KĞ�����s��Z.�$�]Ѹ��=�:�M���kh؜,�e�=����e�,���!~�})iad��L6=���x�v�bt<J�e ���E�E��3�"�;��].��3�8Kz�Mh�4}�)k']\�'v��j\��[ݒs��+�b��a�=g;)�6/�MԮ��mt���淣[.x�p�:o��Z���<���S�yׂ5>;-�Yn�Ʉ��e�e���Ţ���ewթ�.�
��ٵ+'#���ok��U^�klެ�x�{�s7�\����`s�n�޽��]ѕ��'s�j���ܥ8N�����x�2W�tG+}:��c-#-�oE�w�V4ѕ+Sc9�u�U��o<K�^�2���|���`0:ٳV'f��AVU2#{7��a���6��گ2�Z����C���_��iZ����6T�j��*�u�t_.�߶Ǡ�ޑ��L���dĬ2mm���索x��c���:YS&L2vS�����ȭn.�}.�t�79+��XW�������#S);їDm�U�5����e��E�xV�[��dr��.��k�|�plg8��j��(�e�0���⭔�^��=OAd�|J��Y83w��T�V�Q�ċR�^�}����W�46��Ė���c&l�Y0�"��r��z`�\a�n{A�na��sY&�CZڬ����x��x��⌓��Se�M����m�ۅ���d9��/�i{��>!o��s�ί-.#�r+�����vFRɑL��KKK����^�m��׏�<ʳz�b�g3d�;�Msڜiƞ(�'�n��_2�ˌuذ;t�=�z�N���o��--,�ż��-6+7�r9�Ѫl��U�9�M��M֒xYo}9���?-����Z�*�N5=v)�kwZS��K���c|�p��KX�*�%�W
�?��.�uMlѠ���VF&���].�T��bVV�Sc)�!dͩ�y��;͡�߶��sZ�V��M��L��W#r��ޚ��]�:YL�Ntv�J�5���p4(�dn���[s
���S2bb�9��5&n{ތG�Uit�л#R�0�#�\^yx���F�ғ��]��[��9#�Ϋ����K���\�)��4pa�K�15���u���'���K�ڗx�����k����qtS��*����h��w��b�Q[���_[[[F)V%nNuoq*{)`�(+��:X_y�eU�b��bW��:�u0/�����ź��lh��+�xG޾�����1}q�R$b��?�?2��Wַ��G�G�T�U��I#�G���"�(Hn^���