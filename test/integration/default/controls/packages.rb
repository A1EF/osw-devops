# frozen_string_literal: true

control 'osw packages' do
  title 'The required packages should be installed'

  pkgs =
    case platform[:release]
    when '18.4'
      %w[git-auto-deploy]
    else
      %w[]
    end

  pkgs += %w[debconf-utils exim4 openssh-server nmap tcpdump ioping ethtool hdparm lsof
             strace mc htop sysstat lshw iotop iftop sudo tmux chrony
             update-notifier-common unattended-upgrades update-manager-core
             software-properties-common python3-software-properties python3-apt
             python3-pycurl certbot python3-certbot-nginx python3-certbot-dns-cloudflare
             python3-pygit2 landscape-common ccze python3.7 apache2-utils php-xdebug
             php8.1-soap php8.1-bcmath cron auditd audispd-plugins rsyslog acl nginx
             openssl php8.1-fpm php8.1-zip php8.1-mbstring php8.1-gd php-imagick
             php8.1-intl php8.1-curl php8.1-mysql php8.1-cli php8.1-xml supervisor
             python3-pip composer logrotate]

  pkgs.each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end
end

control 'osw pip packages' do
  title 'The required pip packages should be installed'

  pkgs = %w[superlance]

  pkgs.each do |p|
    describe pip(p, '/usr/bin/pip3') do
      it { should be_installed }
    end
  end
end
