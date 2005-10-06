Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:52097 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133554AbVJFR70 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 6 Oct 2005 18:59:26 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: Basic question w.r.t bootloader 
Date: Thu, 6 Oct 2005 10:59:16 -0700
Message-ID: <3CB54817FDF733459B230DD27C690CEC010493E5@Exchange.MIPS.COM>
From: "Mitchell, Earl" <earlm@mips.com>
Return-Path: <earlm@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Arravind babu <aravindforl@yahoo.co.in>
Cc: linux-mips@linux-mips.org
Message-ID: <20051006175916.9-Lx57Q7zXYsapoNFhAFWYg2IAxhCnJy8-oQcsxV_x4@z>



If its a DRAM DIMM module then SW reads info
about that RAM via the SPD interface.
SPD = Serial Presence Detect 
This is typically an I2C interface so
SW can bit bang it. 

SPD provides more info than just size.
For example on some systems you need to
know the RAS/CAS params and various
wait state settings in order to program your
memory controller for optimal performance. 
This is how PCs are able to configure themselves 
to work with standard modules. For more info
checkout this site ...

http://www.pcguide.com/art/sdram.htm

For SRAMs the HW guys usually provide
some set of registers for SW to read 
info its needs like size. And sometimes
they don't so you have to use address
probing tricks as Wolfgang described. 

-earlm


> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org
> [mailto:linux-mips-bounce@linux-mips.org]On Behalf Of Wolfgang Denk
> Sent: Thursday, October 06, 2005 12:29 AM
> To: Arravind babu
> Cc: linux-mips@linux-mips.org
> Subject: Re: Basic question w.r.t bootloader 
> 
> 
> In message 
> <20051006065332.6978.qmail@web8604.mail.in.yahoo.com> you wrote:
> > 
> >        Generally how bootloader/bootflash code detects
> > the size of RAM on the board? Is it hardcoded some
> > where in the bootflash code or is it detected using
> > memory chips ?
> 
> One method is to probe addresses (at N, 2*N, 4*N etc. starting with a
> resonable value of N like 1 MB) until probing fails. See for  example
> common/memsize.c in the U-Boot sources.
> 
> Best regards,
> 
> Wolfgang Denk
> 
> -- 
> Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> The IQ of the group is the lowest IQ of a member of the group divided
> by the number of people in the group.
> 
> 
