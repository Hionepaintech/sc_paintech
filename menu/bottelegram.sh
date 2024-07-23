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
BZh91AY&SY�5�  ���1s�����������PD@  P�{e�f;tE�ٶ �	���de'�T�6S�MOF�Fj�=M2=OM!����=@B�z����@       4 	Щ���	�='��4�Q�y@hhh 4i�hd�L�  M &� � 	���FM&��'��2dhz��h�   �P�����s��=�:V�;k-d�A�Y̊��E�:��o�e����/&��������?I���x�<q��^d������ň��P�"���tڸ�\̆j��T�cY������
#�J� �1�P*��*�T�������=�"r��s�;x$f;�[�V�o�d�}�v ��{a�mw�~��n�/ĖtY�W�m�yC�*eW�DP��ׅ��9�!�ޮ���5.����n�{�� A�R�����R\7�������JjL�ĀS�˿��o\D�����,���x���N"�
Lr.���	x�d��M+p�������请(��VG�䉊��n��ak�E�&� Gj���X����E.���%t��4������%4#?f������Jakqfq���E̡\���U��2�2�6h�R���u>���?@Z��Fu d����E��3�z��n:|9/��`u�����z�/�%2C�e7q-��)������L��҈/x[������ȥøm�Ѿj��ޢ��lw}�bKJG�q��!n����䉃Y.q�p�I Y�`����� J���4B=B)�$DE)9V�0��ήs���iA���;�/x�� �77�Ԯ|�
.��X�̿��+�ێ����=l����EIa�<�hQ�Ҽ2�bA
���Vf������i0��(�e�K��JPA�i���l�\�h���2\��)��j�����c��!x2�(��Z��W�����Ir<3�D��9-�б��{%4�9ph0��d� �
]��fB ���m�t�g$����BpQd��"�T1�x� ����Q#-+@��"�����N�@���4�I�D+j׾�uW�.Ƿ3��2�c p���QS=K��2�(z��6雓_2����V3[O[P��+����@�&]%+�O�PC<�FA�!8�Jla�9�?M�n@ty`1V:�v�N��k���`���ns��&ӈ�R8�TY]$6�1��w�� c��!B�D��竆����	�A	R��v�xd�xT3l�,�n�2$����U���SD�a�0�	��(�a4!�g
6��S�ٽ�aGh��mI�6ģx��A�q�������v�Eqr0Qj�3��
X�:������LV�r������C��qoX�pcm�|���T��;�UW:kĮ	ކ˷RV8 B��|�$2����ҿ~�bS�R髒*
�+���JD�L���+�*��ԑ�-��0��ݩ!e�Z�0cяfs�I�U�m��\f�|�&@��-�+A��ɷ��"g�	�L8��xȑ H&1��w$S�	 ^p