Received: from rtp-iport-1.cisco.com ([64.102.122.148]:4807 "EHLO
	rtp-iport-1.cisco.com") by ftp.linux-mips.org with ESMTP
	id S21103516AbZBMSmA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 13 Feb 2009 18:42:00 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH] MIPS: Allocate exception vector on 64 KiB boundary
Date: Fri, 13 Feb 2009 13:41:52 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A2899E2896@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <1234532640.711.63.camel@sakura.staff.proxad.net>
References: <FF038EB85946AA46B18DFEE6E6F8A28982392E@xmb-rtp-218.amer.cisco.com> <1234532640.711.63.camel@sakura.staff.proxad.net>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: mbizon@freebox.fr
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <ddaney@caviumnetworks.com>
Message-ID: <20090213184152.mq2AD-kxkeqIsJdNxSdGZNcYD2DmKyfoTfsg8e66gq0@z>

> From: Maxime Bizon [mailto:mbizon@freebox.fr] 
> Sent: Friday, February 13, 2009 5:44 AM
> To: David VomLehn (dvomlehn)
> Cc: linux-mips@linux-mips.org; ralf@linux-mips.org; David Daney
> Subject: Re: [PATCH] MIPS: Allocate exception vector on 64 
> KiB boundary
> 
> 
> On Fri, 2009-01-30 at 13:43 -0500, David VomLehn (dvomlehn) wrote:
> 
> > Fix problem with code that incorrectly modifies ebase.
> > 
> > Commit 566f74f6b2f8b85d5b8d6caaf97e5672cecd3e3e had a change that
> > incorrectly
> > modified ebase. This backs out the lines that modified 
> ebase and then
> > modified
> 
> I confirm this commit prevents my 4kec board from booting.
> 
> My c0_ebase is set to 0x90000000.
> 
> In trap_init() ebase is first set to CAC_BASE => 0x80000000, then
> 0x90000000 after adding c0_ebase offset.
> 
> set_uncached_handler() starts with uncached_ebase sets to
> KSEG1ADDR(ebase) => 0xb0000000, which is already the correct 
> value, but
> it then add the c0_ebase offset again => 0xc0000000 => boom.

Can you confirm that the patch fixes your problem?
