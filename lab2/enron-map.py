#!/usr/bin/env python

from datetime import datetime

import sys
for line in sys.stdin:
	data = line.split('\t')
	# Exclude emails not between the given date
	date = datetime.strptime(data[0], '%Y-%m-%dT%H:%M:%S%fZ')
	keep_date = datetime(2001, 11, 5).date() <= date.date() <= datetime(2001, 11, 8).date()

	# Exclude emails not sent outside of enron
	keep_sndr = '@enron' in data[1]
	keep_rcpt = '@enron' not in data[2]

	if keep_date and keep_sndr and keep_rcpt:
		# Emit the sender to the reduce.
		print data[1].strip()
		# for item in data:
		# 	print item.strip()+ "\t"
