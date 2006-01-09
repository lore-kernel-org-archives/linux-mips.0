Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:24559 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133508AbWAIV7V convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 9 Jan 2006 21:59:21 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: [processor frequency]
Date: Mon, 9 Jan 2006 14:00:50 -0800
Message-ID: <3CB54817FDF733459B230DD27C690CEC010495E3@Exchange.MIPS.COM>
From: "Mitchell, Earl" <earlm@mips.com>
Return-Path: <earlm@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Wolfgang Denk <wd@denx.de>, "Kevin D. Kissell" <kevink@mips.com>
Cc: Sathesh Babu Edara <satheshbabu.edara@analog.com>, linux-mips@linux-mips.org
Message-ID: <20060109220050.F1g_tyUXE4NahE8zEkWLRhcefBzY-Z7-V5FiK-4FGdA@z>


Wolfgang, 

In your summary you mention ...

 "This probably explains why many developers who never use low-end embedded processors don't care about (and usually don't even know of) these problems in the 2.6 kernel."

The desktop/server guys typically use much larger caches (i.e. >= 512K)
and most have L2, compared to embedded systems which typically use less
without an L2. So I'd also expect embedded guys using small caches to see 
larger decreases in performance due to more cache misses (i.e. more 
interrupts produce more evictions). 

-earlm


> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org
> [mailto:linux-mips-bounce@linux-mips.org]On Behalf Of Wolfgang Denk
> Sent: Monday, January 09, 2006 1:24 PM
> To: Kevin D. Kissell
> Cc: Sathesh Babu Edara; linux-mips@linux-mips.org
> Subject: Re: [processor frequency]
> 
> 
> In message <005a01c614fb$2fe76b00$10eca8c0@grendel> you wrote:
> > There is no "ideal" value for a given processor frequency.
> > The lower the value, the less interrupt processing overhead,
> > but the slower the response time to events that are detected
> > or serviced during clock interrupts. 1000 HZ *may* be a sensible
> > value (I have my doubts, personally) for 2+ GHz PC processors, 
> > but it's excessive (IMHO) for a 200MHz processor and unworkable 
> > for a 20MHz CPU. I think that 100HZ is still a reasonable value
> > for an embedded RISC CPU, but the "ideal" value is going to
> > be a function of the application.
> 
> We did some tests of the performance impact of 100 vs. 1000 Hz  clock
> frequency on low end systems (50 MHz PowerPC); for details please see
> http://www.denx.de/wiki/view/Know/Clock100vs1000Hz
> 
> Best regards,
> 
> Wolfgang Denk
> 
> -- 
> Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> Our missions are peaceful -- not for conquest.  When we do battle, it
> is only because we have no choice.
> 	-- Kirk, "The Squire of Gothos", stardate 2124.5
> 
> 
