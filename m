Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:15046 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S3465669AbVJSSNC convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 19 Oct 2005 19:13:02 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: Fwd: How to improve performance of 2.6 kernel
Date: Wed, 19 Oct 2005 11:12:22 -0700
Message-ID: <3CB54817FDF733459B230DD27C690CEC01049446@Exchange.MIPS.COM>
From: "Mitchell, Earl" <earlm@mips.com>
Return-Path: <earlm@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, kernel coder <lhrkernelcoder@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20051019181222._Bj-hmBzr6d1ga11qfK70xKoNDiAiw_Sjjay3a-ejB4@z>


If you are looking at network performance ...
A while back I briefly looked at this and it
looked like the per packet processing time had
gone up significantly between 2.4.20 and
2.6.x. Problem was not NAPI which switches
from interrupt to polling mode when you get a burst 
of packets. I actually traced a single packet from Rx 
to Tx. Unfortunately I didn't save my data and did 
not isolate where increased time was being spent. 

-earlm

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org
> [mailto:linux-mips-bounce@linux-mips.org]On Behalf Of Ralf Baechle
> Sent: Wednesday, October 19, 2005 8:54 AM
> To: kernel coder
> Cc: linux-mips@linux-mips.org
> Subject: Re: Fwd: How to improve performance of 2.6 kernel
> 
> 
> On Wed, Oct 19, 2005 at 10:55:01AM +0500, kernel coder wrote:
> 
> > I did lmbench benchmarks tests... and the results i got were pretty
> > weird.. I am attaching the jpegs :) of the graphs i made in 
> MS Excel.
> 
> We're happy with cold, raw ASCII numbers :)
> 
> > Btw, I have implemented NAPI in both 2.4.20 and 2.6.10. I ported the
> > code to linux-2.6 in order to increase the board's 
> efficiency but I'm
> > quite dissapointed with the results so far :(.
> 
> NAPI is doing it's job which is keeping a system responsive 
> under extreme
> loads very well.  The pre-NAPI behaviour was simply locking 
> up thus making
> systems easily DOS-able.  NAPI is not meant to improve 
> latency; it isn't
> meant but frequently mistaken to.
> 
>   Ralf
> 
> 
