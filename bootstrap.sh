#!/usr/bin/env bash

# Exit if already bootstrapped
test -f /etc/bootstrapped && exit

# ゲストOSにインストールされているGuest Additionsのバージョンが、ホストOSのVirtualBoxのバージョンより低い場合にマウントエラーになるので以下で対応
#sudo yum install -y gcc kernel-devel
#sudo /etc/init.d/vboxadd setup

# リモートサーバーへのプロビジョン用に使用
sudo /opt/chef/embedded/bin/gem i knife-zero

date > /etc/bootstrapped