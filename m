Message-ID: <42FA40A2.6010400@timesys.com>
Date: Wed, 10 Aug 2005 14:00:02 -0400
From: Greg Weeks <greg.weeks@timesys.com>
MIME-Version: 1.0
Subject: Re: 24K malta
References: <42FA03D4.5060400@timesys.com>
In-Reply-To: <42FA03D4.5060400@timesys.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <greg.weeks@timesys.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: linux-mips@linux-mips.org
Message-ID: <20050810180002.7_xcTuURiFvxDvCdklMTNRjT1fETcA_JqP-oKqUV2PY@z>

Greg Weeks wrote:

> I'm seeing something strange on a 24K malta and I'm wondering if 
> anyone else has ran into something like it.
>
> This is a 2.6.12 based kernel. I've not had a chance to try the 
> current CVS yet. The last time I checked the current CVS didn't boot 
> as is on a 4Kc malta so I've not been keeping current with CVS.
>
> When I try a simple
>
> strace ls
>
> I either hang or seg fault on a 24Kc or 24Kec processor, but a 4Kc or 
> 4Kec works. If I turn off the cache on the 24K it works as well. 
> Without cache it's unbearably slow of course. This is the same exact 
> build of the kernel and root file system for all boards.

The memcpy prefetch bug is still there for malta, so I had to build 
another kernel. This is with a CVS sync from this morning.

The first strace ls works now, but the second time I do it it hangs. 
Kill -9 frees it up and the board isn't hanging.

Greg Weeks
