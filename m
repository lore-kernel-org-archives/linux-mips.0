In-Reply-To: <8230E1CC35AF9F43839F3049E930169A137217@yang.LibreStream.local>
References: <8230E1CC35AF9F43839F3049E930169A137217@yang.LibreStream.local>
Mime-Version: 1.0 (Apple Message framework v622)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-ID: <ca9dea6d5cc67afd6a42f06de4286bf9@embeddededge.com>
Content-Transfer-Encoding: 7bit
From: Dan Malek <dan@embeddededge.com>
Subject: Re: iptables/vmalloc issues on alchemy
Date: Thu, 28 Apr 2005 16:56:39 -0400
Return-Path: <dan@embeddededge.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Christian Gan <christian.gan@librestream.com>
Cc: linux-mips@linux-mips.org, Herbert Valerio Riedel <hvr@hvrlab.org>, Josh Green <jgreen@users.sourceforge.net>, Pete Popov <ppopov@embeddedalley.com>
Message-ID: <20050428205639._pXxC1I42Eatk4SlGvzq57eoKogvHvycjQPiKpNZosE@z>


On Apr 28, 2005, at 4:11 PM, Christian Gan wrote:

> Could this also related to this problem I posted a long time ago?  I
> haven't had a chance to revisit things for a while...

I've just been talking about 2.6, so "long time ago" can't be
that long :-)  I have the updates to the exception handler so
the PTEs get loaded correctly, that's on the way.  I think 2.4
should be OK if anyone is using that.

The one that bothers me is this patch I've been sitting on for
quite some time.  It's not specific to Alchemy, it's a generic
MIPS page table issue.  The problem started when someone
loaded very large modules which caused a new kernel page
table to be allocated.  For some reason I don't remember,
the vmalloc_fault fixup didn't handle this, and the applications
would crash the system because their pgd page  didn't
get updated to reflect this.  The address must have been in
the vmalloc space, but I no longer have the system for testing
(but the code is running in a several thousand real products).
The only way I could make this work is to test the fault address,
the most significant bit anyway, in the TLB miss handler to
see if it was a user or kernel address.  If it was a kernel address,
I loaded the init_mm pgd instead of the thread pgd.  Just one
test and a couple of instructions, but it was necessary.  I'm
still puzzling, but will remember :-)

Thanks.


	-- Dan
