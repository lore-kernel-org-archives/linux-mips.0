Received: from intrepid (c-67-175-6-30.client.comcast.net [67.175.6.30])
	(authenticated bits=0)
	by starbase.tos.net (8.13.1/8.13.1) with ESMTP id iBRNDgc6013040
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-mips@linux-mips.org>; Mon, 27 Dec 2004 17:13:42 -0600
Message-ID: <200412272313.iBRNDgc6013040@starbase.tos.net>
From: "Habeeb J. Dihu" <macgyver@tos.net>
Subject: 2.6.9 Cobalt Tulip lockups.
Date: Mon, 27 Dec 2004 17:12:50 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-Path: <macgyver@tos.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041227231250.bXBlP4zOsV52BuaSMfN-38kEmszi5TZQMB4lbdFMLQ4@z>

Firstly...hope everyone enjoyed (or is still enjoying) their holidays.

Just joined the mailing list.  Apologies on the longish post, but I wanted
to provide as much information as possible.

I've got a couple of Cobalt boxes (a RaQ2 and a Qube2) that are successfully
running Debian (as well as Gentoo) running the 2.6.9 branch of CVS plus
Peter Horton's patches.  The machines are quite stable and I really haven't
run into any issues until I start stress-testing networking.

Under high network loads when connected at 100TX FDX, I can always get the
Cobalts to lock up.  Under anything slower -- 100TX HDX, 10TX FDX, 10TX HDX
-- everything works fine.  This problem is specific to:

1.  Lots of data transfer to/from the Cobalt.
2.  Running at 100TX FDX.

The test scenario is:

Cobalt running 2.6.9CVS + PH's patches.  Cobalt is running an NFS server.
