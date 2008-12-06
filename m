Received: from sj-iport-1.cisco.com ([171.71.176.70]:32967 "EHLO
	sj-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S24163331AbYLFKbR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sat, 6 Dec 2008 10:31:17 +0000
Received: from sj-core-1.cisco.com (sj-core-1.cisco.com [171.71.177.237])
	by sj-dkim-1.cisco.com (8.12.11/8.12.11) with ESMTP id mB6AVAHd002674
	for <linux-mips@linux-mips.org>; Sat, 6 Dec 2008 02:31:10 -0800
Received: from sausatlsmtp1.sciatl.com (sausatlsmtp1.cisco.com [192.133.217.33])
	by sj-core-1.cisco.com (8.13.8/8.13.8) with ESMTP id mB6AV6jx010146
	for <linux-mips@linux-mips.org>; Sat, 6 Dec 2008 10:31:07 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: question regarding system memory whatever
Date: Fri, 5 Dec 2008 21:46:12 -0500
Message-ID: <1C18506EA6ACF94097F87E8D358338F501F558@sausatlexch4.corp.sa.net>
In-Reply-To: <20081205181737.2fc890bc@ripper.onstor.net>
References: <20081205181737.2fc890bc@ripper.onstor.net>
From: "VomLehn, David" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Andrew Sharp <andy.sharp@onstor.com>, linux-mips@linux-mips.org
Message-ID: <20081206024612.c1TCD8_SIJIjr6Leo1Rx3SNwcIFkP9gyMBdxJ7IK6dk@z>

(Resend, the linux-mips email address was mangled the first time)
 
Er, it's kind of a good news/bad news joke...

The bad news is that MIPS Linux isn't smart enough, at least as of
2.6.24, to use memory that precedes the kernel.

The good news is that we've got changes that will handle this.

The bad news is that I'm so backed up even getting a basic patchset to
add our platform to the kernel mainline that I don't know how long it
will take until I'm be able to get these additional patches out.

I'll cc the guy who did the changes to see if he can extract a patch for
this.
> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of Andrew Sharp
> Sent: Friday, December 05, 2008 6:18 PM
> To: linux-mips@
> Subject: question regarding system memory whatever
> 
> I recently changed plat_mem_setup() or equivalent in my platform code
> to not mark the first 32M of memory as BOOT_MEM_ROM_DATA and instead
> have the first BOOT_MEM_RAM memory region start at 0.  Here is the two
> lines of output from mem_init() for the two different versions:
> 
> Memory: 433408k/475136k available (2202k kernel code, 41556k 
> reserved, 690k data, 112k init, 0k highmem)
> 
> Memory: 433408k/507904k available (2202k kernel code, 74324k 
> reserved, 689k data, 112k init, 0k highmem)
> 
> As you can see, the 32M got added to "reserved" memory (?) and only
> added to the right hand number of the "available".  OK, so what does
> that mean?  I promised our monkey userspace programmers that they
> would have another 32M of memory to slosh around in, but before I
> release this change on them I'd like to know what these numbers are
> telling me.
> 
> This is on 2.6.22 from l.m.o on a Sibyte 1125 in 64bit LE.
> CONFIG_FLATMEM=y which was the fashion at the time.
> 
> Cheers,
> 
> a
> 
> 



     - - - - -                              Cisco                            - - - - -         
This e-mail and any attachments may contain information which is confidential, 
proprietary, privileged or otherwise protected by law. The information is solely 
intended for the named addressee (or a person responsible for delivering it to 
the addressee). If you are not the intended recipient of this message, you are 
not authorized to read, print, retain, copy or disseminate this message or any 
part of it. If you have received this e-mail in error, please notify the sender 
immediately by return e-mail and delete it from your computer.
