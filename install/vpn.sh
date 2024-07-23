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
BZh91AY&SY�)�� �߀R}��oߠ����`	�>޷�ows[�K QZv�h�m�$�P��z��Le=LM&���bzj��ڞ�ҧ��H4h  4d�   ��`�CM22a �@Md��MJi4LQ�S�6�� �    I2��#I����=�mQ���� ޢ2 ��F�"� ��SOQ46�z��y'���G��<��z@�a����ǹ�2�x�HLa����+]��Rb�ӆ0k	�����<��?0��<�X��8A�=:���!�,�-Ȧ�HE!�ږX0pʟ�kOY�=���#^�VX(xa�JD���6�R��|�li�)�dv��P-��F���tz�WC���w/�C4��O�#�8BH�e/J<�iR~d}�z�٧�x�V��3`$��q8Q�7dBqHT�!��1�J��el�����\U]���S�\ӝw�=i�	 p2À�vi�����MF���lLm���ԍ�:Ly��S�<r��F��"��*���vo�(����e�;��3,J��A2~��V�P�1$���^aV������L�6X�s�V-��:y��1۲��b(���F���W3Bۮ'`��8�K9�܎�p"%�X��Ԃ�,:�yxom?!���N+؛�����y�1�Q}���g
��$\R���,j
��#'(˒���Y,�N�i�%��0q�N\�Kg�-e9ep�}�h�$��/AW�����������FxEBȎ:���iib���F4|�x@�(�S�TY�0��4��y@GC��hK��'���D���]�����Յ�:z�,X�M��m����->&��0�ӕo+
x9��.H\D��g�9Ɲ�G�m��Dz����?O�"x�P~��c#��/�M*���C�m��o�6o9���[�.���5��鷛̌fJ�7��P�B�ļ<��,��>cȹN~fl��!�҆�T�\H��s�p�%�_�q7���S��E���1���� �U���y��m��4�ψ7����᫶��)Ð\7m��R����@�0�.���6���w&Ĝ�b5c�8��'$[�_d�a�JPs��ifZ8��jo�ۦ1@�q��it;S��iY���Йݑ��?#��s#�v�j�%ژ����ع:$�H��lL�uE���ğ�7�t�;͋��8��$^�����bT�O4�h���S�����5�$�%0(|�RF]nA�đ���-�����/]5-�}�{��Z���$��yD�s�ÊZ~ޭ�:��Kӑ5<J�0�m^;����9�u3H#P6S���K�Z&�PI�;�"`L&]X�%C�B]�����Gt��x���STF��S-�(��A9kÇ�L*@��e���&��z�-N�*8s(���ｪ&�d�hc(�`�`��gz/a������c�:��2�.KR��Vd j�=x�j�k���4K0(%@�F��mD����m��j�7pP<��-
���m��!D�-� *H����D�T.� rB��\cɶ3:��6$�	Ix��͘F��%o$B�g�+�L�y���7�}���ڝ����6�պ��c�1|)V͎�Ȅ���^��.	7	��;� (fG��A)���=�6p�z�j��UUTTh�������$��x�1ʅ�@*}����|C��2sY7��N&��t��	�V��8�Mz��i�,����p/�1u�MHuA�'9��o���v���,E�˄�_�èd?д�.d��X�<̪I.L�(��iX��)��B^S�,;7)�d���'�{�7����A>0p/K�43(^Z]��	:�hR0$��!���`�\Bm�%�	$�W8�hP�tM�ᾡ��4���cq^�6��%@�0�])$���A��i�� Rs�m��;f���#$�x�������ɸys�aD�2RQ3 $%#��[<T���7�����b������ ��.o�&qIlI��p+�}� �����w$S�	r��