Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199708132022.NAA27369@oz.engr.sgi.com>
Subject: linus accessible from within SGI
Date: Wed, 13 Aug 1997 13:22:59 -0700 (PDT)
Reply-To: ariel@sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970813202259.4eFj-JKeEd8TvlnCKkNOACFCLRl20sF56RLEVRsio5Y@z>

Good news:

Looks like the routing problem that prevented many outside .engr
to access linus is now fixed.

guest@sgigate 3% traceroute linus.linux.sgi.com
traceroute to linus.linux.sgi.com (192.48.153.197), 30 hops max, 40 byte packets
 1  purgatory.SGI.COM (204.94.209.2)  2 ms  5 ms  3 ms
 2  forbidden (204.94.211.38)  4 ms  14 ms  7 ms
 3  paloalto-cr6.bbnplanet.net (131.119.26.57)  90 ms  105 ms  63 ms
 4  paloalto-cr4.bbnplanet.net (131.119.0.148)  684 ms  113 ms  75 ms
 5  paloalto-cr34.bbnplanet.net (131.119.0.109)  11 ms  15 ms  22 ms
 6  sgi.bbnplanet.net (131.119.16.6)  27 ms  16 ms  24 ms
 7  linus.linux.sgi.com (192.48.153.197)  16 ms  18 ms  18 ms

Roundabout, but working.

-- 
Peace, Ariel
