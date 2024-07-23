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
BZh91AY&SY�b��  ���g�� ����������@D@  � �[ն�m����a�����h6�&�44���  4�h S�����l��I��m���F� 24�	�1��F�Q��h � hCF�4 �� h4 ��L�hh�  h I5=�dF���M6F�e<SdM��PLjb"@�D
��u��ĵZV��	��F�b8XI"��e�|L����$`����0�͛�)�l��B��%@�%�tTc��͒!��tZf0�� mH�z����Q���4mO+,AC%t��#׬;i�����l(�2��[ҧ�	���i��4Pn&��!��W�؄�bhx�ΜM|E��~��R-ьy�a�t���CeҀ�=��tI��c���ED��5v8���� �Pħa�.i�������4x�����l?�w-�Q�1�8b�q%x�a��W_~��Ɇ�PQ��װ)���JD�FV�pxd��a+��ڎ��.�^��6�	@d�@����ْ&PB�ͺϥ�B�{g.��A-q��c{�9��9���_)F GC7) ��H=��#�E�31=��\"��D�^ �[�yD��:p�l��I���2�O��b���q)��Xʶ4�y#]�����C`H��k��%I��׀�Ռ �Dnp��$@�j@Xnec<�,N܂/J<'�D1Rg[�K��
�1��A�ʰai� v��vG����S�Y���a�q�����?9� �`QOZ��6�A1W�q�ɉ��˪�zv4�S�1d�la2��cW��XW�,��n��R:ո@�w��mJ��H��c����"�%@�D�儭�e�Yȕ�eDiC�ñ��cԍ%A�&@�5�2�k�AɥQQ�懯`C�P|,x� �hg�kA� *(*"�M�R \���'v�ࣺ$v��� n��1������S�(�놕����B��	�]�S?�82�ɛjl�2n�9r���aP(�ِH�R�ˈ"�7ۏ�-	��K�)E'�D�0Ċ&J��sI��gA|Y�;�f��B)F���e%j�o��FZL:�BX4�t���Vp`��Fs����ׅ� �& Y�q&�{�jH7��o�����!$0$�a�^�o��$HBq������N�rE8P��b��