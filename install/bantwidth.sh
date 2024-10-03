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
BZh91AY&SY��:� B߀Q~��� �����@   �4�&C 0L  `Ld0 �  �4�&C 0L  ������5? OI���z��6��M�mO�,��������}�
H�*��?)��7ג�
s�ￄ�;��Nď�3�$�Tb`�y#8Ə��nv��3�|�.V��x�h���7�hH��L�̮·K�ޑs�JRZ�p)$�)�RE�(�D�SC���A�"x<ߦ��Qֽҹ�y�ǚ�o$q��V��bvg���#菃+;cc��'��K���$`��\�����S�������H�gp��dO��R�9�>	�$~�6�}�)#K�ft�H��Ld�ۭ8�&	�|�#�RO��FsQ��Ƭ���͎y���������H��OY%4.o���%���L��G�L�Mn����?�R�`Ę$�G�+����%��Bq#��D�����)E�g37�1��/E��z�5��7ɉ�Ĥ������#ڑ���c���s���hQ3)d�zG�M.+�2�e"�����:1�`.o�#K15�K#"E2)d�/Hؖ{�Z���#;J�d���p6"��H�iGխ�ܳ�rE8P���:�