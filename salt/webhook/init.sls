webhook:
  pkg.latest:
    - refresh: True

/etc/hooks.json:
  file.managed:
    - source: salt://webhook/files/hooks.json
    - user: webhook
    - group: webhook
    - mode: 644
