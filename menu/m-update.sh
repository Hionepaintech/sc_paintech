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
BZh91AY&SY`��s 
�E�@ ���?�������@�D@0  `y����{��:l��ocRD�$�h�z=Q����54��6j���M<Q���4�@4hd�L�  M &� � 4BI�=C�!�   @�=F�h  3�ISM�h44         "��7��O�d�A4hf�#F�j10L�i��%L�A��`�� �4d�  ���H�$��֭W��*����>��!3�Į,�שd��*�d[���}`�p1NsW��a��̋����tfl�3��q��)��22
����ae�(�3�W=�ێ8���Ŀe8�p�҆|��J ��&��Ά�Ga���jʵ�l�v�0����Ȳ��Rd��6���H+�qӍV��}�⭊���k.�9��I$�I      3{9]B�x��7�Fw\)��|��H#�9
��L0�9H��FYL}�x';+�S32��!@���'�M1���B������+:����N�|�Sa�2A����P�IFJ�� ��#=
*�X�@9�I�y�zJdf�����d/��71pƅ^�ϵ��n�/��A^٠�?�$B�A��KDJ��T	�`:}�l���\{=��#vc�Z��#b�rތ׼:�DL)J�� �DH�D�C<)lC悍B��?C��B�!B3��	e�]%�৩�lU��Y&� �"�VI�Hu�0���6�&�p�k��%+3-��K���R� ����2L�q�on���W�'_���_U���D��ư=� �vh,�Kѥ#��!�ҜJ�/��Q.5��ʷ�x}g2�	�F�y$�V��Qgh�V���h-��o���ABR�,N�{�i%�ȗ���I�
�!��j ��Ǫ8� �-Tބ��[����!ZI%
HD��z ƷBI%KX���v�ү�ĸ��`�EZ��3�}b�\�o	]�J�t��c{��S0+ǟa���?�th�2`�q �9�gK��
技�R��	�,�MMK��RqC���!`��ue'�2w��p& ��W%Iy6��`��|��!$�I$�����A�bm�XH{��ʼ�l'I�$ލ"�_ƨaP�m�U�V�{��������!`�ܝru����GGZN%]� z-�K3d�9_���6��A��=�5h	�7{h�����J�ɬ?F�Ъ�����������q� z� X�����b.�u`��B�!!!AT�`:6*��l!!#7����/			ng
���4P3����Z�97�Y� B�j kW�ӟ> [G��F�v��(@�&ҒN�Z*�?A��s�8��M�Ϻ�L �0���Zm��@�V��5�{�����5 �7��[��αK�]&�ٰ�2�4��`2���~ƌUo�q_�Cj����\�dƣ�j���0��X��R�vP�iX-mm@�U�5�Z��P�h�pK@�x�1oc�1ͮ�I+�y� k��I"����ٱ��sbC=	'`��m�[m�e&}����<��Z� �pЅ곑Wv��}2'�
��c��beE�u�q��j9��=��� >@�u�by,� 2O�]��BA���