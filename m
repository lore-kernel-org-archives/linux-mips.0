Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:50925 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8134420AbWAIPNQ
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 9 Jan 2006 15:13:16 +0000
Message-ID: <00af01c6152f$dc1863f0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <200601090742.k097gYaZ017304@lilac.hdcindia.analog.com> <200601090749.k097nFaZ017891@lilac.hdcindia.analog.com> <20060109145425.GA4286@linux-mips.org>
Subject: Re: LL and SC instruction simulation
Date: Mon, 9 Jan 2006 16:17:50 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, Sathesh Babu Edara <satheshbabu.edara@analog.com>
Cc: linux-mips-bounce@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20060109151750.Xib31AURvaCW1QEFsxusbzxRJqPIfqNimvwkQC0QsYk@z>

Ralf writes:
> On Mon, Jan 09, 2006 at 01:19:46PM +0530, Sathesh Babu Edara wrote:
> 
> >    We have ported linux-2.4.18 and linux-2-6.12 kernel (mips.org)onto MIPS
> > processor (CPU type lx4189).
> > 
> >  We observed that on 2.4 kernel,ll and sc instruction exception handlers
> > hitting very often.
> > Where as on linux-2.6.12 this is not happening.
> 
> > Can anybody have idea why this instructions are hitting on 2.4.18 kernel and
> > not on 2-6.12 kernel.
> 
> Only ll/sc instructions in application software can be emulated, so it
> would seem your application is behaving different on 2.4 and 2.6 kernels.

Is there an interface where 2.6 might be telling library code to use system calls
instead LL/SC, where the 2.4 kernel didn't?

            Regards,

            Kevin K.
