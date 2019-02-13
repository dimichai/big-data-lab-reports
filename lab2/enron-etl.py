#!/usr/bin/env python

# this turns enron email archive into tuples (date, from, to)

import sys
import zipfile 
import tempfile
import email
import time
import datetime
import os
import urllib

# stdin is list of URLs to data files
for u in sys.stdin:
	u = u.strip()
	if not u:
		continue

	tmpf = tempfile.mkstemp()
	urllib.urlretrieve(u, tmpf[1])

	try:
		zip = zipfile.ZipFile(tmpf[1], 'r')
	except:
		continue
		
	txtf = [i for i in zip.infolist() if i.filename.endswith('.txt')]
		
	for f in txtf:
		msg = email.message_from_file(zip.open(f))

		tostr   = msg.get("To")
		fromstr = msg.get("From")
		datestr = msg.get("Date")

		if (tostr is None or fromstr is None or datestr is None):
			continue

		toaddrs = [email.utils.parseaddr(a) for a in tostr.split(',')]
		fromaddr = email.utils.parseaddr(fromstr)[1].replace('\'','').strip().lower()
	
		try: # datetime hell, convert custom time zone stuff to UTC
			dt = datetime.datetime.strptime(datestr[:25].strip(), '%a, %d %b %Y %H:%M:%S')
			dt = dt + datetime.timedelta(hours = int(datestr[25:].strip()[:3]))
		except ValueError:
			continue

		if not '@' in fromaddr or '/' in fromaddr:
			continue
		for a in toaddrs:
			if (not '@' in a[1] or '/' in a[1]):
				continue
			ta = a[1].replace('\'','').strip().lower()
			print dt.isoformat() + 'Z\t' + fromaddr + '\t' + ta

	zip.close()
	os.remove(tmpf[1])
