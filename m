Subject: swapon failure with au1550
Date: Tue, 15 Feb 2005 17:09:13 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Message-ID: <B482D8AA59BF244F99AFE7520D74BF9609D4F0@server1.RightHand.righthandtech.com>
content-class: urn:content-classes:message
From: "Bob Breuer" <bbreuer@righthandtech.com>
Return-Path: <bbreuer@righthandtech.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050215230913.2y5hQLYlpl4u7F7ygPNW-BlT51cx-YbVqkbbHH3qgLg@z>

With the current cvs on an au1550 configured with 64-bit physical
address, I get a kernel oops when trying to activate a swap partition
with swapon.

It looks like mm/swapfile.c line 1385 is hitting the BUG_ON() in both
pte_to_swp_entry() and swp_entry_to_pte().

Bob Breuer
