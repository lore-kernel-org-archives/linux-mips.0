Received: from nwd2mail3.analog.com ([137.71.25.52]:63464 "EHLO
	nwd2mail3.analog.com") by ftp.linux-mips.org with ESMTP
	id S8133646AbWAIHkb (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 9 Jan 2006 07:40:31 +0000
Message-ID: <200601090742.k097gYaZ017304@lilac.hdcindia.analog.com>
From: "Sathesh Babu Edara" <satheshbabu.edara@analog.com>
Subject: RE: 
Date: Mon, 9 Jan 2006 13:13:06 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <43BBC85C.4040405@mips.com>
Return-Path: <satheshbabu.edara@analog.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "'Kevin D. Kissell'" <kevink@mips.com>, linux-mips-bounce@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20060109074306.sf6GFg1LScHsfvfp2oaUZ5jYY_jFIcPZdESI-Wpq5AE@z>

 
Hi,
  Appreciate your response .

  What is the ideal HZ value if the processor speed is 200Mhz?.

Regards,
Sathesh
-----Original Message-----
From: Kevin D. Kissell [mailto:kevink@mips.com] 
Sent: Wednesday, January 04, 2006 6:37 PM
To: Sathesh Babu Edara
Cc: linux-mips-bounce@linux-mips.org; linux-mips@linux-mips.org
Subject: Re: 

Sathesh Babu Edara wrote:
>  
> 
> Hi,
>    We have ported linux-2.6.12 kernel onto MIPS processor (LX4189) and 
> the processor speed is 200Mhz.
> By default Linux-2.6.12 kernel comes with HZ value 1000.Will this HZ 
> value cause an overhead on the 200MHZ CPU.Can someone advise me on 
> whether going back to HZ vaule of 100 like Linux-2.4 will reduce the 
> overhead on this CPU.What are the side effects this change can cause?.

The 1000Hz clock should not actually cause any problems with a 200MHz CPU,
but it will suck up an annoyingly high percentage of available cycles.
Backing off to 100Hz may cause some degradation of some
real-time/interactive response times, but the improved overall performance
will probably more than make up for it.  I never build with a HZ value
greater than 100 these days, but then again, I'm mostly running on FPGAs and
other hardware emulators where the CPU clock frequencies may be less than
1MHz, and are never more than 33MHz.
Note that a HZ  value of less than 100 may cause some kernel macros to
generate divide-by-zero operations/exceptions.

		Regards,

		Kevin K.
