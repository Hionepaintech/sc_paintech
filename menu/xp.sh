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
BZh91AY&SYx�j ��  ��_E H+����`/���JU5�4 h�i����i��MA� �Ѡs �	������`���`s �	������`���`3TJ~�zi?Td4d��F��  hh"Q&&���H���6OQ���F�aG�����l�(�!1dѥ=2�S5� 2hɡ�{%�NADȇª(:B��8X:N`H�VHѵvQ��@���@�D%q�	�]k\R,��2�x��j0s�*f��<D���`�=�_	��5�E�߷VL��w�Pn�X|<����!��O�Y�E��< -�,�����9[Jn�r��3�I�I&I'��K($��e~)N�O)��涫v�RUz f�]����\>�׫�C�9�ێ��ٛX\!�^%� �e��rvs�׫��{c��3���8���(Xv�N��7��G~�%��
Y�G�)��p�}�îT�yĐK�~y���`�d#d�=�'�.���Z�� �}j� ��^e�=��,)g/���4������"uY�&܄�<�N�8��U���ʞ~��LaEBl>�;Ϝ;|���o"�������S��L��� �� � �7Ih�x{rdsIH��e8�*�.о�^iMհkd\����A�%`}�gJ��̽i�j��6��	n�Nm��h����g�:�v�QOq�&��[lI/t�qq�!���\�1��`���Κ�&d�d�d�dM�p���ȿ�vO�9����^�æ�}��y���p�q� ~x�n��M�ꂦ���ܻf�%��WM��
��P�GL �	}k��d�oG8������A�K5�E�CI��wC!�Gh���B2�|�!��j�c�#$�j@R�K�
�^ w��oJT�L� m��ҝ�ݤ�($S0f�g���!�Mʐ����JRfiJR�J��؀΃�$j.S�2�>�ë�SE8T�Ǉ@w�1T��3_A��r�w�6 x�׬o�Pzν7!��Y���/>����t��]�NC�2�ǰ2�K�� 7���&6�fR�,CŇU ��l3���.) ���p0�=�ӽjg�I$4�����Ѝ�s�N�`���G�6�B�!��&�<v\>'A�C�Hf-�H�)��',�����5^cQ�R���/q �_KfT8���]�1��][�a�%#j+�l��� |]� �HR��KWp�\�������.<��`���\��R		�Ȃ6E�T������t��[�n����!��a� 2""!�MoxP�Wn�x���2G.��RW]kWmeW�C�$a � ���8@���"�(H<
H� 