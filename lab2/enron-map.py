#!/usr/bin/env python

from datetime import datetime

import sys

def get_email_domain(email):
	return email.split('@')[1]

for line in sys.stdin:
	data = line.split('\t')
	# Exclude emails not between the given date
	date = datetime.strptime(data[0], '%Y-%m-%dT%H:%M:%S%fZ')
	keep_date = datetime(2001, 11, 5).date() <= date.date() <= datetime(2001, 11, 8).date()

	# Get the domain of the email addresses of the sender and the recipient
	sndr = get_email_domain(data[1])
	rcpt = get_email_domain(data[2])

	# Exclude emails from enron not sent outside of enron
	keep_sndr = 'enron' in sndr
	keep_rcpt = 'enron' not in rcpt

	if keep_date and keep_sndr and keep_rcpt:
		# Emit the sender to the reducer.
		print data[1].strip()

