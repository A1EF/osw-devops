# vim: ft=yaml
---
nginx:
  install_from_repo: false
  install_from_ppa: true
  ppa_version: 'stable'
  dh_param:
    'dhparam.pem':
      keysize: 512
