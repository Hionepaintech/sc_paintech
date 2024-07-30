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
BZh91AY&SYŹ� 
?�������������P@F
#�  ` ������އ>��w�N��w��"]��<�۞��1���ϟZ��|�GGJ3��:hk[븭�jv'e��)�I{���D���T2"i��'�2hɉ�G�Oj���h�)�(�z�j�����l� 2M�i=)⧽JyOM4i�M�2`  ��H���z�i244�Sh4�� ���z��hi��R"2G�4~�I�z��<��"4��   ���4�z�d�Od�5=M�LэI��42zOI��z�&�P�OS L��B	��@iA��S����5?)��21�@ u� H��,!�D��* �>o34����b��k�>޶�A,�������aV�Y���?[�B5P��ɾڈ޻�-�k�|�{`�,2�6���3w1n#�K��ѪW	������[f�݊�}7$�6Nk�{���`��請6)h/+�{�p��6�(TI6kk��0a7��f�ʻ��S4�<��3oC@N;Υ�'�!�r-�u�M)ΡJ؍t�c�Z��`�2�Bq]��"��
�U��ʴ5e�Ƶ
hpP��pUٖ4�ĕ�d��*ǌ��"��nu��=y�k5vm4^���.�
*�W�g��E��B�!uw�������g����s�����j����Ttw�e��ã.��Ъ���4lQ���nD؁�E�U�ᷯ���	 ?��>|����]�64J�֋��C+Ø� �g��c2���؎���=$[i�4��H��^)��2v]���y��ѥ�y��w�^)��U7�bhx�!��9�� U�X
&-,	�w�����v��ñ!c��5yW��^�i@��-wJ��~I$�m����/��J��ox�zO����8!��y/��0>�t]����� dV��g�AŌа܁�h"��z����ep1i e���(�mZm4c	$�Ԁ�w/[~��|����-x`c$1��E4
���'4$��,Gh�����x�j7t | ��N��O���#օ�FzE�+l�<ܠb�������5P�k5���P.��~�oy[s�^���@$P�3���S�n��b\��~k���j;��U�Gu��U�sM�����{��[���Wr7r���^�Q���FmL��մM�I���N�w��qٚ���|v�
�����w	�N��x����W1?i��@h/�~����_ΠG�<�}J�{�8'k�A���}7+�����{�<\B�b�8tQ��5��_?��˯�l��f��i�����M�b�ޠ17���4^l*����n��0���q�s Z|�o� R�e�)�l�*�\RB*���T�]������$�ɭ��Rф��Mvj���a4�nH/
q����v���Ǔ��i툰B�Ҳm^p��*x�K�EOu�&��4 �{�$�U����óP�� .	@��D�Z9�N�����ǀ�/"�Q:x{4
/�� �Tv0L�nE,}>_k�7c�m���r�_�{�oQ���O�>�ې�O��6�[�;�:��;����F�c�E��B4�q�����=�Nܚg�lՖ�%�j^�T��pE���W詤��*�J��{��� �c�T��R��xV�)����wr�A�l�\�8x�[�h݁��j�����ɝ6��2"A�eB����àz�+B�^���o�6�B�|k�)W�{��ZJ��^Ɛ�j$�C���CN]�I$�;S+�5^�dݛ� �R$*M��A���ݾ��s�#ք��d����F��ē�e~�"K3$o0��Kڤ������R;�{�U�!}C]������ܘMe�1���b���׼Np B
xI<��?7p�0��A��e=�:;Ώ\���ĜhǶ���&�o�����_�M�R!��UDGv� ����tF*�$�!">ڐ1��u;��	݊h�FW	�b�'x��@�3���T���g$�EA�X RA%"��軷�!�b�T �R�<��n|�d��K[�����_$ ��BC4h����������Wq�=~�y�e�0b����p�6$H$`Ħe�J�ڊ��̄��
?k�1��%HD�+.�|�5۷`�@b�_��缽�]��>��R�4�I:����(y�~x��{����0�9SD�y%��
���ڔfI��獵~+/<��!^~* ����'�M]� T`E"<�L�Vth�������R�9��}m!w���)��R�b�Z��B��HH��"N}�� �u�	*��5�ڪR$���k�PW�D-$�3��7�'.���ݳ_���������&�@�뫄HU6�(j-��x�;e�A����^I6�7�K\{�P ��R�My��Mek����C۫ ]��fG1w q��O�������2�+�A��9�nJd��
�Ze\U��w�I@�Oo��}��½��k���᝛Ļ��h +����y��p:���A����{�aݻD��`�P� �^��U(RK����w��qD�����]}�����5��;J�
)��u���&�P�3�PC�Jd�p����?	��/q��^�+]p����g��s�9y�`�ov˶��ǥ�<�\?���۶���(�Q\����Ðga�q=I	�;� �^ֿdd@&F��B�:�� ;�D�#��NS�]L`K�� ^y����ꢗ�r�׼���� ��gP��N��tJ��:W�(�h\ާa��k�_�m�T
��^-��FC�����"�xz)��H�h�~i�P���-�n�_�BU*����<IМY�yx�Ϊ!3#!��= y/Ǉ:�C���1��ee�l��n�p$Ub��UX�ڱ�;�Mh��A��s.�D����@�� ���<���+.�:z�B�IRחhOe N�S�s��J��z���Y��P`A�4? �P�ڒ�)��8B�+����D.1]v��E��`�g�0�������B���E����{�����
�i�-��_{Һ�n�atC&�N!lV��,Xbu�F��}]��:�x��|b�َ�5���W\@<��T�)yX�r�Tv�9�������B�	A{��j�h��m���!��Xa�HbtM�R:��0N ��,��f���r��&�j.JFs�WiB����P)P��G�k�~J������7,�*���������Ωi�b"*>�����+��|!��|b<@�!DSD�ӏ�f<{7V������ð�{c! 0�p���9j`5`�>,�:��<m�!B���O�M|����gV�R.�
3��B���Ϝ��kGp#S�=����s��DOvȿԼ�2�������lT"��o5��W�v}_ݸ�Acƅ�O0a�BU'$�h�����H=gF���4�u�Q�Bk�'9��Ѥ�BЌV&��a(@��PN6#sP]V`�x� @��ɏd�G�~W���{Żű��ut�J'��%�d��N�q�m�l��w�y��_����%�&��nឬW����!�]S�{�1�y���@�\L����U]�S�jP���[h]ůɪ���Tא���L��b_���}��l�y�n�=��M�`�9�W��9|F�k�f]B�diQ��j2�D��> Q*��K��	�6��r+��T:������w��#��N��l��0h��
'����i.�o>��@��$���.��������S��c�9�$�S Q80��\ND��`@�0�S����]�Po��8��
U�Fv��9>�/�|�����L*٤x��k�ܵvJ�JWӟI�,q���f�Df���K��K��� hY��f}p#乁� ���t����5���H2-��0�|9N]�]V�r���?���B���ۺ˟>��m��JM����"�)l2��՛y��!<�&5T��IB¹sx}�{�Q�9�>��~�I����N��ѲC2�l|4jڲ��@�0"D��b>&W��������(����J�R���]!��?bz��@K�>�s�'Xi��@��(D�X�b3�2<��L�1�F�[%�2ā�g-	c��Q)�(�?r�e2�g%��%�A�,�0b�����3 0	�`�R�x��B�#�7�* �*����lJ@a�pנl:eF�QH��h� o�����f�4\n��˂9�l�:t-u6�/* QCdT/p%S�y}��p26��@�2Q4��AH)���Wc��6ϬTw�.�י�>�����[�!����,Gq��;���q�E��(<z$d6j��՝�~���T0~�]��][�h�~�����m�p�*p�������R�D������|Q
�R��wA"!g3T8���;�e�YH]Qm�ٛ���� ���|�P9�jC+�|�+�m�̀+"3 �l[��\��	��9�X ������2jr��0��K:|+I?��(��U�iB�*����&cAlf�Yq�O���`�jkي��hLy9 �zk�3��� M\4��Hl<eZ1�@�J�) )gh�+�c��@9C# ���3+Lљ���CHXej9�՟:���*�`����F*p��i۽C�
#
!聄�xt�^�.�d8�S��*�������C�7�m�`J	}J;�yH5��=��j�Ȣ&}~f��@6�\h#�b�"��0"m��}+R���,���T�p�@�H��he]T����E! 4���e�<Iә��j�ڣ&�����N�Hx�('R�.S�>���͠���X5�d�zG�BIm�:L<�	 u1�����"�(�\u&:�B��ӿxd���TMZ�q��iZ֔����D"_}��K���ʙx��.~�400Spw�@u��U���:�_~&�C������f���P�SA�T�I�R���(_e����uLY���A@�'~����W�[��yp��Cq!!��Z�AT#�����f�;��a�=�܁��;� ���e��ԕ�1�袊1��#s��iP75��:��u��>[%	���
'İZ�,���DiSKͨ�i�\� ���<���� ��a��4�!�4�)���f���P�w�pS�<O����x ��l���yK�mb���
u)�R�h/76x�`AÇ-~�қ*��	7��I���Jk@g��>��<��o�)ݞ��z��+E\Js��uKJ�8Q�M�^���ء����ȁ�[n�~�S�A�0�r4C�5M��:����
��N}M�>sC�`����2, �a��萡��I-@آ��-`"��hk+VX%��z��:��d�*�c%�}]$�OǤ���[�e	�r�܀iNHS�ռ*ZL���q4�G���OH&��:�*u�k��p�� Q���l�s�E	�`�If,EV2R�����ڰ��h� ��4��,���(�%����X�c*�#q�]�7���MbD�= Az�d���C�4-Ș��Qj�i�p�M�k3�:�oI�VҚB��T(BEK	���C�
+��r��m��y�t������/��lh6h�+Po;>j"b-ȷ�*��^�:@�8�R�t���7�a����|PB|�>(|ً��o�L�:��;�VHS��h-�	�םrq i�_V>�H0����ۊ&&��&�_WN�o�.�%�P����X&▪6o��9rn�oy���ȶޒ��B�s��,����&��v�GA�~#X+��d� �e:���YF�Z���i�1N�$3�Ha9�D��(�b�I�ʮn��K�/M�21e�hUPv�d ˹[]Ergʪ�٤G���)n�ވoǐJ��;O��s��>������ܝ�/Ԛ�����u�h֫K�F`Z�@�Jr 1Sw3���O�!�ؾ�VȦ݃ beJ4��B��	�|�
�ϬW��r��}-�]�0����nc���e� Q[鷮n0
�d6�|��z8(p۞M�2ދz�m�7�yɿ-\�*5(��B�ج7�� ��vx��C�i�Ŗ�]�f���.$��׃���?��Jj�?����,�����٫eɜ2a�3�$U�D'+�]�?y@R��aGT���f)(@6&9�5��[:��y0� a�^���wl�j	��}��x�Q<(`=E���9�%�۩��yS:j�YkPh�Wd5���8�8��4 4�KBwB �s^�N�Tp���Ś
H�F��t�Ut,� �@n ���/\�P/�B���S^[6b{�Ђ���
hrM��y�hl�r4�τ59��ߩ����2ʶ�S(n�V/J
J��]D٧dB��n�q�۸P�9\"�4��> ;ѳb������I��받�;��Eɥ�m�Lw����S�@�"zƲ�ܥz�`o=�7�� һbi�gQ��R��|��LS
|]`�EҚ��1�X�)$�֞6�ʝ�á�u7�f�(7r���	׎��w�ür���7XQW��=�C�D�W�����Z�Z�:�g(�'C��C��9)A)�G�U�]�<{����7HeѫK@���>��>z��C�!�B���YXj`)
�E�#%C�� �A*��Ι�'�D
��+ѿR�}�	D��먃P���M��v�B��84�'zm���%�{�T�~A"���tI�A�0�W�4��{�`��G����k��񟷇;m�?% �.S;����E:`���`X脑��[�l�΋�8e�׆x�"�b�1:z�z�p5�d�)��h�����lg��j@qX�Q�Nd7�%N�(�+-f��kI&z�g�?�'҈�j}H��r� �H�Yp+��$�C;D<����?�B
��)�"��
E %1�J�!�(
e$UQ�FZĒ�Y�MS!��ܑN$1nk @