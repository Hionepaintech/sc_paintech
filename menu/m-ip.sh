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
BZh91AY&SY��u� 
���^���������TFb  H @ `?N���73Z:  PJB�A�OP1= � ��@�6��  Q�{P����4L CF& L	�c��h 4��  4i�� �2$P��F�B`M`	�0    �aԢ��C��M4�� P   =@ � # !��OS�MI����������M4�H�#�bhzK������ǛW�DK��is ������:��w��R�k�ŷJ��T��P����i�E*a{0��oT�W,�Rq)�AU�x-��
� A�(�!T��O�Y�(.�b&�7K/��"�BE��\�	���$ۖe��(�]�b�`Sv4�� ��}UQˬ�� g���H2O��0n�5�u|GH7�"�+ V���ALwÐ�6�O`�6'G�P�H���-��Loa��dk&1��yr^͡W�f�iQ-�W:�"���r鮐�,�J󀉔�9��L�z��D�z���6��dKʏE���Ja��8��eV��{I$�2��c0PIO�z�t�R��}�@&a��bB�\ ۲��� ��"	�Acm��
���8a��F��D6��gl(ݝ�>ʝ�*�s��z|=��q՘�&ft!%^����R����vJ�b��~Z�W���BѤJC�	�&D�9r���~�&�O���iŃ6i�O�5������)5��tLT�#3Y�BMa�q}���bƟ\�QS��@$������������P�� ����rm����X�i��壺SW�9�x�w~<��:�Qk�:y��z��z��Zq���(잠 =4M��$�dF$ȥI[N=��D�r�w�K��=5WlDd�N���z��45X����h�T���B�ш-��2��{�~���0�g�2�=�#��fd�hf�Ë��4�"f�Q�E�𕅴����RR ӓ�=�)����G9Q㥘%ě\A<a�j�8ί�\��8JR'���	��^�E"*L� �!!`! �aH[�+
���2l��h1�}�2���5�����h7�6� ���
�;㣊�UX����Ч��O;Ն�B�.��@�P��pP<��u�� Z���8���Fu�#��p8h�m�&��T2p����\�B'!)�hg8*	���srV��}2�����9t`�b�aю|��My�����s�*h/o�^���w�"N�QBD�����U!3�b2��[Ɛ��H
��1�"<��o>Ү(���$�b3�lG^S��϶ Ա�`&F3M#JC�0���k��a)�#4��|g��×Ufz�o\1r������5�<W{�3o�>\���F�A�KhLl6dL��T2
ȥ��k�TC6��P��6��Pj��6�� �o���xU�/��XL�[U��)��f9xhCɼ�Gy��w�~���ڂa˦�w�̪����~1���X�=��IU��`3`�U@@"��$Ha�`x�0�	�X��?�~!�&��.RH"7@�(��B�����BA��ܑN$-%o 