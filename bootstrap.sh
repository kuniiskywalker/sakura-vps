#!/usr/bin/env bash

# Exit if already bootstrapped
test -f /etc/bootstrapped && exit

# �Q�X�gOS�ɃC���X�g�[������Ă���Guest Additions�̃o�[�W�������A�z�X�gOS��VirtualBox�̃o�[�W�������Ⴂ�ꍇ�Ƀ}�E���g�G���[�ɂȂ�̂ňȉ��őΉ�
#sudo yum install -y gcc kernel-devel
#sudo /etc/init.d/vboxadd setup

# �����[�g�T�[�o�[�ւ̃v���r�W�����p�Ɏg�p
sudo /opt/chef/embedded/bin/gem i knife-zero

date > /etc/bootstrapped