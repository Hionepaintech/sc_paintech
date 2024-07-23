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
BZh91AY&SY��ϗ _�us���?������PD@  P���ֳm��C%D����OJi�z&h����ڏS6Ԟ���2 �=G����Q#L���)���CM��h��4 @����F�����  h h  ѓ� 4�A����� hh4d  �bA$@�MM5=��bd��m'���aSjz���	��DQqrX��h/C����Ք�a� ��ɩ��&̆}�h���BW�D@|]�a��1���U�	�b0�����,*��3C8U F��=�=C�R��'ϜAI�n5�[�r$lӫp8�n����dt.z�j6U�w���IJjc�wS_%�Y��KT��Fs+6��Q?�
p+ԥ��qK ��M��T��ـ�)��C�d����QOCS�x�>��Z�%���p��k+,Pp�$�E@EQ��a���'4S�!�	џg�dH9|�r�p?�r�+�Q�1`I�^���n���Z]��hV4�JwF�~��ϰ�蠁$Z�������U�*V�,�~p�>�����J�YH�ТA$ >�^8引��6���8S�(_rH	�C�s���+<~������1ե�y�o��& ��{��������Rq�@�K&
�8I��$�𮭹���!M6k�l�LQ=*E�1�[@c�#�q�eGّQT�N,� Q��E
8��I�p3��|�7Ƥ]�숢��T3't�f�u��2Fa2ӽZ���H����j��3*�1(w�	*���3\�`��� ���yɱ��&(u�O�Bs�%ZA�y����@ɭ/Fu:*S�jli,�
c[�uƹ��Q`�G}��6L�����0!ku��L,5���ct򃝇���Z�8Ǌ08��{g�:y��e��X�+��i6�e�B�k��,�x�����T��Qq¦ب��g�-��Z|] EL�>��Y4�j���6��H�
�_��ӗ�V�jKP@��#�U�XlW}υ��#�=�$��:�R�%����R'�|�f8'�]!n���n�!������@d�����d������?nv1Ў� �촑ɵ�N�mGAs �|�W܇�ٙmj�f����FM����l�{0&��Y�5iE��#nH�d�ړ8m�2T2�DB�$��4��
�g�;j�`�� �nh}��1RA��_�3ڷ�EIɢ�D/�e��Dx��S)0�2�nX4���1�N^�m���/��Izi8���Q�BH븋�3�`]�#θ���t��HB`��y�H� p&c�rE8P���ϗ