Received: from mms3.broadcom.com ([216.31.210.19]:4264 "EHLO MMS3.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by ftp.linux-mips.org with ESMTP
	id S20024435AbZEFQoX (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 6 May 2009 17:44:23 +0100
Subject: Re: [PATCH 2/3] mips:powertv: Make kernel command line size
 configurable (resend)
From: "Jon Fraser" <jfraser@broadcom.com>
Reply-to: jfraser@broadcom.com
In-Reply-To: <20090506163518.GA19624@linux-mips.org>
References: <20090504225719.GA22417@cuplxvomd02.corp.sa.net>
 <20090506163518.GA19624@linux-mips.org>
Date: Wed, 6 May 2009 12:44:00 -0400
Message-ID: <1241628240.10498.4.camel@chaos.ne.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-Path: <jfraser@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Cc: jfraser@broadcom.com, David VomLehn <dvomlehn@cisco.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20090506164400.etjWexzvRX3V_HvgfD73nYY6PqrhPewLEfbv6Ph9JUU@z>



David,

We found huge command lines to be awkward.  In our platform support
code, we can pass environment variables from our bootstrap (CFE) to the
kernel.  Would something like this work for you?

I have no objection to making the command line buffer size bigger.

Jon



On Wed, 2009-05-06 at 09:35 -0700, Ralf Baechle wrote:
> On Mon, May 04, 2009 at 03:57:19PM -0700, David VomLehn wrote:
> 
> > Most platforms can get by perfectly well with the default command line size,
> > but some platforms need more. This patch allows the command line size to
> > be configured for those platforms that need it. The default remains 256
> > characters.
> > 
> > Signed-off-by: David VomLehn <dvomlehn@cisco.com>
> 
> How big of a command line do you need?  For no scientific reason other
> than there not being any obvious need for a larger size MIPS is using 256
> and I think unless you're asking for a huge number it will be better to
> just raise that constant.
> 
>   Ralf
> 
> 
