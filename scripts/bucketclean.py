#!/usr/bin/env python3
import re
import subprocess
import sys
factoid = ' '.join(line.strip() for line in sys.stdin)
form = {}
form['entry.1597667447'] = 'asarkar'
form['entry_1555196978'], form['entry.1013038267'], form['entry_997229399'] = \
  re.match(r".*'(.*)' \(\#([0-9]*)\): (.*)", factoid).groups()
subprocess.check_call('curl https://docs.google.com/forms/d/1lUqcoM2MJX62fF0M_4cbl0J9aj5iwNV2fi5VnlWO2RU/formResponse {}'.format(' '.join('-d {}="{}"'.format(k, v) for k, v in form.items())), shell=True)
