Message-ID: <004101c25eef$ba035350$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20020917160425.O17321@mvista.com> <01b801c25ea7$ce074ed0$10eca8c0@grendel> <20020917171434.Q17321@mvista.com>
Subject: Re: [jsun@mvista.com: Re: [RFC] FPU context switch]
Date: Wed, 18 Sep 2002 10:45:08 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jun Sun <jsun@mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20020918084508.U6Z1YAmRdG6FHhGZnxNUsDah-_x3u6jFQ1Y72JKOwF8@z>

From: "Jun Sun" <jsun@mvista.com>
> On Wed, Sep 18, 2002 at 02:10:17AM +0200, Kevin D. Kissell wrote:
> > Are you able to test this stuff on a proper SMP
> > system, by the way?  The efficiency of the code 
> > that manipulates interprocessor control variables 
> > can reasonably be expected to drop off a bit
> > in a system with MP cache invalidations blasting
> > left and right. 
> 
> Yes.  I understand this effect.  Solution 1), 2) 
> and 3) don't really suffer from this problem because
> variables tested & manipulated are local - unless the 
> process migrates which is a different problem.

It's not a "different problem", it's the heart of the
problem.  If we weren't worried about SMP
behavior, we wouldn't be revisiting this stuff.
While (1) can obviously be done without any
global knowledge, as could something (2)-like 
based on CPU-local state such as Status.CU1, 
(2), (3) and (4), as you describe them, all depend 
to some degree on shared multiprocessor variables 
to determine whether to save or restore FP state.

            Regards,

            Kevin K. 
