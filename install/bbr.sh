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
BZh91AY&SY����  �_�@0}s��8��
����P�Z�v{�x=�a�ML��4� ��@ z�I�="�4�A�@@d�Bd4z@� �@ 4M0�&��� h��� @$I�d14�<�3Q�   6�y"CK��ꋇ����i�4!��:��ce��~�|�C/�j�yt�c �O!^CG��@�`���F>H�'��γO�K�0�q��3d�~�B����0��%(4�-�|��f�����W�rۤ�2I�;����,���ڐJg@�l��$%����2/��o(995�KF�z^�"M k-�Z�IH�r{��|�:��F!�d�bf0̈́�,z���EX��1����ŉ%ULf�U�s�C�U�!x*A��Z�e�$u�!/�!#V�42$Jmԓ(5$0l�)��H���"�w����ڡ��$�B�\BZTjS���r8���Id @��ǊI335�Q��� �- *���h ��Pm�ִ��\�"�V@��7>Ti�C�u�t }��5#�>|��6bF��oH�D��֤ah|)Y�V8��p����~��.�`�Q˿!��.)�;D���K�JJ[����J��1������ ��(r�"���無LI��#�ȥ�r��M�y��z,�,��if�!0a^/Z%0�T��k)��)B���I��shk%A�܄-8�L*$V�&��� 'Gd��Y ��y.��T�z@�������Ekq���k�ǵ����$_���K�тL�&��$�h�HӂUz6%:�
�J�&X�b���� �1��3�PMEԤ�:],ײT�
�[�4��|?�ܑN$+��e�