Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199810220626.XAA32028@oz.engr.sgi.com>
Subject: (fwd) was bug in haifa scheduler (or not)
Date: Wed, 21 Oct 1998 23:26:00 -0700 (PDT)
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19981022062600.v_-Br0FrmgyiBUDrsLIBbx7LsMUx-cPUxZeKgVx2RRE@z>

[just forwarding a bounce]

From: "David S. Miller" <davem@dm.cobaltmicro.com>
To: ralf@uni-koblenz.de
CC: linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr,
        linux-mips@vger.rutgers.edu
In-reply-to: <19981022024408.A360@uni-koblenz.de> (ralf@uni-koblenz.de)
Subject: Re: Haifa scheduler bug in egcs 1.0.2
References: <19981021015047.G1830@uni-koblenz.de> <199810210139.SAA22458@dm.cobaltmicro.com> <19981022024408.A360@uni-koblenz.de>

   Date: Thu, 22 Oct 1998 02:44:08 +0200
   From: ralf@uni-koblenz.de

   The ABI is quite strict in that aspect, it wants one lo16 per hi16
   for the same symbol.  Binutils relax that by allowing an arbitrary
   number of hi16 and one lo16 for the same symbol.

I completely understand how hi16/lo16 relocations work on MIPS, but
thanks for reiterating it to me once more.

All you have shown me is a bug in the MIPS ABI, one of thousands.

Therefore, there is no reason binutils cannot handle this sanely, and
be fixed to do so.

Later,
David S. Miller
davem@dm.cobaltmicro.com

----- End of forwarded message from owner-linux@cthulhu -----

-- 
Peace, Ariel
