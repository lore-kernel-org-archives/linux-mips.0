Message-ID: <008401c26094$794952f0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20020920095623.5300295a.g.c.bransby-99@student.lboro.ac.uk>
Subject: Re: Cycles for certain instructions
Date: Fri, 20 Sep 2002 12:57:03 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Gareth <g.c.bransby-99@student.lboro.ac.uk>, linux-mips@linux-mips.org
Message-ID: <20020920105703.sKOB8CsRABD0P_-mZalONrI9BtU29z089KcsDwoZ-Hc@z>

> I am doing an investigation with a mips malta board that has a 4kc processor on
> it. I am trying to find out how many cycles certain instructions take to
> execute.
> 
> The program I am running loops a small piece of code many times. After a few
> loops of the code the caches will have all the instructions in them and so 
> accesses to memory will be few and far between. So how many cycles do 
> instructions such as load word and store word take? Obviosly if the data is not
> in the cache the time take will depend on the speed of the external memory. If
> the data is in the cache is the time taken fairly predictable for a given core?

On a 4Kc, and indeed on the vast majority of MIPS CPUs,
if the data is in the cache, a load will pipeline fully.  Which is
to say, the following instruction will issue on the next clock.
*However*, if that following instruction uses the loaded data,
it will stall by one cycle waiting for the data to come back
from the cache.  Compilers for MIPS will generally try to stick
some useful instructions between load and load data use.

            Regards,

            Kevin K.
