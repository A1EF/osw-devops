# vim: ft=yaml
---
supervisor:
  # pkg:
  #   - installed
  # service:
  #   - running
  #   - require:
  #     - pkg: supervisor
  legacy: false
  programs:
    opensourcewebsite-cron:
      enabled: true
      autorestart: 'true'
      autostart: 'true'
      command: >-
        /usr/bin/php
        -q /www/opensourcewebsite.org/htdocs/yii cron > runtime/logs/cron.log
      numprocs: '1'
      directory: '/www/opensourcewebsite.org'
      stdout_logfile: '/www/opensourcewebsite.org/htdocs/runtime/logs/cron-stdout.log'
      stderr_logfile: '/www/opensourcewebsite.org/htdocs/runtime/logs/cron-stderr.log'
      user: 'opensourcewebsite.org'
      stopsignal: 'KILL'

  lookup:
    service:
      name: supervisor
