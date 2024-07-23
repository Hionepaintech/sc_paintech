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
BZh91AY&SYA͟� ��{� (�����������p�F��  `!~o�UR�J�#A��IRQt��Z��@US��{Q@��$U)	AB�"*R"@PT�JJ�@�)$���=@��M�@mA��M�4� e#Q�T=@  �                         h���h�h0�bd!��&#h�j��hѡ�� ��$@�d	�$���m(����S�Q�z�i�ђh~�ѣ@��J �i0@���T��&��4�M5���������� i�L�1�����X}����'�A0 |�rS*|����b�^��`�נٜ��20"ŗe�w��FԬ���L`6TT 
�2%6�r���z�Af�dP��y��7h��nj�m�3��2~d-^���� Ͳ��.�4*H�c�2�m�j��5���ծB���Z���(4B�@�6�Q����	3�! ��8@,� Ħ� [naQ�HHB����0⺈aϙJT�V�2��O��߻����R�u�s"�6K��N�t߆X)���;��p���%��Z}�����p^E����������o�^tc���ÅB�a
0�4w���i���.�T�-q_fC�gh�(:K��yf��e���V��v9��5&i�x׏���U+1JL��qf˰1:r�-3W�'�K������R*"�r�w��|��f��<2�>���c!?Umڿ��`\_�l����ǐ�.66l�ؗ���骕"!c�i;�p:�/�ֻ�	4ehdt1�G����nu����m���]�Fl�2ڛ�^�_�_/# ��^ӻ�H�c�,D$�*)��Q�U+{B~� LA>�nE�.ԂaUKЋZ��SOJ�;�F�H4���:���ͪ^�e����D$*�>�k��u��w���u�������,@؇a�ʶP����ʊ~�lB�μk6D����  G�4 �B�����L�p�ǚ͛赞h7�_�|{W�[
{b���N��	w�@�,
��x@�Z6��G���a� 絿����	e˗��K����"�� Qn5�Xx���uD����
z���0���}��^�\�R:�$Dو��/�K��a���c�j�"�i����뫭%���kZֵ�d�-n���k�g�nB�c�`n�����x֨8uP_�MYR|�m�#�ϊ)�����N�����*7C�ør�@�@윀���6�c�S�.[���ݘ���/�@�c���=gq���s���)]�*��G\ë����=P2�I��" M4hY�;QA�����l�RLgђ�๝%ZΓ���=v͖n���8�����B��N���o5u�q����y�ĜT\�۷�Y9yL�=�lw������T�,	���G�f��bB��q��sr���i����7��v�S�oKs�G�m����r7�>��!�yM2�+� ��v������t�i�`�5��E�`����,�W��]5�ȅ�������{��^��'?��k�!��w�9m���A��Io��G���|;�"{�t.����rz��Z�ru�gFZ��j�[	�Cg�I,� >�Ժl�聈������ѕ9	Y<@jߨS�*/��l�n��q��(L5p~n�ué�Av��CP,G�� |������;˖	��/�tcu§i@�NjyM��r�����(��|�+�D� ��8t��SؾIK}br�%�e�e-��oC�;>��hY�����_����{C0���t��n�ɏ��$ Ȗ
�]��*~+R�Kf[=���Y|	"�@i��%F�MI�5p�X�Jt|�e�=����Xads�O�G)kY*����ѡ����=b����s�����6�(s�p�NQ*b�2XH^	f�#!���7�@��iqHf�.nl��Pн"fU�W5��|"K?�KիP~��~~�vǯ�H��/�v|����	L�����t0HG��Bt&�cJv��?M ^
�^�de�J�0�oZ��d�	b\�JP�q�ĸ��Lʐ�k��{Sb6�h���B���-��BE���B+xQ �!��l)���?��S�A�N|A�8z-����4GD�(���Y-4.Zi�v�9j@r"I��n��Qh�fڕ,��P�!�>q�U����o��ź���2(=����i�+�B(��K�B�K~d�X&�D� f� p����
��� ��VK�b? �»l'}P/�����B�g5Ǜ�2=��
,fs#�<����C��� �!�h @>�*��4!�/�|9���:�r0������H	�{��ˆb"�	ޤz*�2a��8��$qP����
�)�vI�>c�~C���w�ל7�S-��d�V��ⷅ.2���GI��=5�������a\h0�aV�ۯ��(�.ˀ�~��;����h4)���|��������6<��;N~{�`�؟�X�2��ć��"��\*܋�@�ߟ���P�u@���]h�M�X��(�@h�(h��K]�I]C�$����%n<���]%�݂�[�~����zn�E��]��W�P3��1�ct����ZN���J����0�,�*P�ߒ��L��z��&�����=����3�DN�*���?	���G,�j2E� D�Xy�%(޼[f;�QTxl/��@ą��5]���۞�!s��݌�ъ��� G��3���M�u�A����9p��t>M%��y���ԉ]����� �HV~,a�2���`��(0OI���J'���?�!tSv�T�����_ǳ
R���ţ�{��Kz�8
o��łu~�R�8�s�k���{p�H�| ����Zr��M~�=����u�q9���\�P�S���^���9�Ϝ�u�k��0�)�E���z]5�<���亸f�iZ���'�/�;_��umHGI��;��@ߚ����(x�ñ����hyGS���*u=���)�,�a�?u�¾��1tw�>���1��g 0``�9�w���E�n��Oa��1�����u�q
�T�|"����%�9�d ��<$��g�
��<��?R�(t���g����� 
D RI1�`���@�KHC,��Z}�0��2�P�@HbH@��1

N���",�q�R�F㼆ت�h��,����}�`>]���F�1Ц��~]^���*p/b&	R <!��ہ`_z#�*]Q�p�ЃR�@_P�� @�4E��U�ð�� �l�{T�߲�NJ�����ٴY-B)�֩��o;5#�`��?8���Si��	>�����b�R��#T 
��G��6�P �����4̳͆-�
�q��{��E��^�WU��M3����ga��/կQ
�gQM9ƆQh"SC:E�ġ{�8;�j�7�z�Z�nS�sq���e�yo�r�n�����/�����dP07��8p0{�z7YE(~�I�@,U��J���	�4�E���Ln[͏u	�z� ��gKS|���]S9����S�t�~�o�)�]wY�E�C�-��"R$6��B��f ]��
m]Ah��X>�Z!�5�Jz��x�MU�7㜩�ք�[8^]�-` x�rD��q�`��\��`ꝟ��r��UP��a`wa�,���d)���(l�Jt�`��hF�(C�	 Ŧ��s����NEN`���Ra�VZdݿ29����"���

��?�
�P���dή�v�4�4��g�(9Ő��<��$;%�{�R�)����$Y��C�"����Dp,p/R�!�HFn8�UjE�],�X�Z8���[$�x\�Os�&w���b��j x�,�F���^$P*��!�b�F�X+vK;�q*!�V@$���C·�\���V�����O�U�����N?ʻ��`n�zV���!$H�� _a��0'XJ�L�@�ʯ�p)�)�O���:�O`�J{�C������ @�>
	��ԋÆ�7N@� �cp��N+�B�)��jtT���#$N_Z�6��-����`ﴳ�ߥ�Ǐ��!��E>s�sy�~c?*� ��\p�������rq������7*��g��=�zז�JP)����UA⸜�} @ ���!�e��Jҡ�BY�S{c�=�-�l�C�ؽ�nP���?�@Q0��:���!�#P#�u0~��U�M��=
귑Kʢ�AߤL���1r� o�9Qr���||�E�w�T��n�)@�B���h�X)F��/��C��(R�逄0�9����F�ֱh^�G�:fCp�T(���Y0�T�!Rlǁ��ER�:��h'XzT�L)�
�DN��X� -�RB)���0*�[X( U����-�*���-�Nn4@���o�sXƣ�|"��k�ׅ%�.�p$Ɗ��S{�tl@��hDK^��F�4)�MZH�R�xT�a���w�o�(�d)�`�hC����u�Cǎ6�^QG0�*�2$�1�g��%(�< ��u����"~Q�y�qg?P']0l���P�9:�a	�!:H�m"P�PX%�P�Nѻ���(.+a��l�"�a
�, ���X!���D
�8�#`$F��N�vD|*���H��lS@�a��!��A1UnP;
�\��hn�J0��k�4%�����&D�ו�g���x��sÞ2$`H�29�Cby� \1,Tq5^n ��h��3���u�	�,X:Gq��z(&��u�X��]�v�o*�����n"�������0��j�1(r�W u���P(��@�l'ō'$@�\O'i�z��"�!2ϊuP����UPiu�̅��2Щ�m�~���u��ѫ�v��|j��z����MܡU0�{�R�b0��5PB��ګf����"��x���)Ւ���핐\��6
�Ø{�y �@�J�R�F�d�)�J����B����Q��!�R~e0E.���?@EA,!ε��s(�����<�f�1����w�&(Y*7��B��E�A�C�c��G@d!�xh��k��w��h9�Ic�|��e���x�c����2ff���,��T3= hئ�1�gB�y%���"��Mgkޘ(��=
]d��F��	��� HR���,��ͺ��B(IW�%�c�q,��ҠAh!V���8,0L\[Ԉ����8� b� 1@п%�Q� ��r�����5j�[R�PĊ��P��4��,�h��&e+K�QP8� �g�|����X�;��H��Ј�PB䁪���(�{�B���.�P@7�@�4!�&�ł6�� ����Ó�t��׌+l6��v��{��W�>�d�t���1���UZ6�y�Ab��@��BP$��ԭF��D:��h��v�����<��7 �����4�p��4���>��=g�1z��C{���i[A��C�������tI`��LH�@7��.�D�0��U.���oT �I`ΨB� J��u�#�o3�D�H�Ƒ���	N��� k3�`Ԥ2 �)hkH�Q�d	DQ�#� �!H�L�V)!�l�B�#n�7g��"��K��(
�!�YF࢟��(%�C�ڀyC8�^ѕk�:Ժ�F��ߝ-*~��a�� �Ex�W�	"2MW���dd������p�k�=�2!x��U���ު	t>.�T�s�eJ� m�Ú�բû���R��J�a}�<y���Ÿ��u�%�R�b���C�q4�R��Db����L%%��~۰�J����W�)��0R EƵa@�C�8�x��'����֩�@հ�Y���P��h�S��Xm��! ��q(��r"р�!kBAu�u�
m�mS��#�oB:93�S�������k��C����d��9�rt��Q��lU΁��?�o9�DMg,�y��2bq� ��.E
�J;��X� �+���������{Ղ�0&%��0,4B���P6B�!�E�jaG�����R���(S\m��jo�:�d��M)�MJ��`oS ����|;�d���"Xg`!}M@\�sQ�\��G��C0������@;,?TN��p������DQ<�@��y�}��V�'�e)����>#��$$H����QLq��<�iy}�/@e�����A1�`�	�}�2�Y�6 	�>���Z��p��)�	7�%�ͥ�������j-a����FG��'�TY�H0`@��,���/e�/@�!a��A�����0/�`y�"�QQ�D
�����"�(}��_PN�HA`�0
��ni�� BH, � �������������?��-@U1b��B�$��&QD�X+Έ��Q�!HG���)�l�`