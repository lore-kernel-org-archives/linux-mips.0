Message-ID: <000c01c1a3e9$6a8086c0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20020122232529V.machida@sm.sony.co.jp><005301c1a368$87d27ed0$10eca8c0@grendel> <20020123145634M.machida@sm.sony.co.jp>
Subject: Re: patches for test-and-set without ll/sc (Re: thread-ready ABIs)
Date: Wed, 23 Jan 2002 09:38:24 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Machida Hiroyuki <machida@sm.sony.co.jp>
Cc: aj@suse.de, hjl@lucon.org, ralf@oss.sgi.com, linux-mips@oss.sgi.com
Message-ID: <20020123083824.5dbkdwsDJx2XW6N2oz1IGt_RuHQYe032mWlzDZk4lXU@z>

> > It should in principle be SMP safe.
> 
> I don't think so.

You are quite right.  It was an offhand remark
that should have been better qualified.   The basic
mechanism requires no global memory resource
and will detect discontinuitues in scheduling on
several CPUs at once, but but it is certainly not
SMP safe in the sense of the code sample
providing atomic increment on a classical SMP
hardware platform.  

            Regards,

            Kevin K.
