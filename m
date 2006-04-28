Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:36037 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133448AbWD1ISP
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 28 Apr 2006 09:18:15 +0100
Message-ID: <000d01c66a9c$c6686290$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <1146188366.3034.6.camel@localhost.localdomain>
Subject: Re: Java virtual machine on linux MIPS
Date: Fri, 28 Apr 2006 10:21:38 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: gowri@bitel.co.kr, linux-mips@linux-mips.org
Message-ID: <20060428082138.IrDypKc7GtMt986ogaheMGr9w2W3FHBBk0xeFht3t90@z>

It's been several years, but at one point I successfully tested
and benchmarked commercail JVMs from Insignia (now part
of Esmertec, www.esmertec.com) and Skelmir (www.skelmir.com),
and managed to get the open source Kaffe VM (www.kaffe.org) 
running on MIPS Linux as well.  Kaffe has a JIT that has, alas,
been broken for MIPS and most other RISC architectures for
the last couple of years, but the JVM still works OK in interpreted 
mode. I'm sure that there are other options - those are just the ones
I've had hands-on experience with.

            Regards,

            Kevin K.

----- Original Message ----- 
From: "Gowri Satish Adimulam" <gowri@bitel.co.kr>
To: <linux-mips@linux-mips.org>
Sent: Friday, April 28, 2006 3:39 AM
Subject: Java virtual machine on linux MIPS


> Hi , 
> 
> He is there  any java virtual machine runs on mips based linux .
> 
> any pointers will be helpful
> 
> Regards
> Gowri 
> 
> 
> 
