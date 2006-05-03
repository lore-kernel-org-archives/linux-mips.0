Received: from smtp125.iad.emailsrvr.com ([207.97.245.125]:23959 "HELO
	smtp135.iad.emailsrvr.com") by ftp.linux-mips.org with SMTP
	id S7620187AbWECQy1 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 3 May 2006 17:54:27 +0100
Message-ID: <007b01c66ed2$493622f0$2300a8c0@ratin>
Reply-To: "Ratin" <mrahman@sypixx.com>
From: "Ratin" <mrahman@sypixx.com>
References: <5C1FD43E5F1B824E83985A74F396286E01DD4E88@bby1exm08.pmc_nt.nt.pmc-sierra.bc.ca>
Subject: Re: changing IP address on mipsel-linux
Date: Wed, 3 May 2006 09:54:46 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <mrahman@sypixx.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Don Hiatt <Don_Hiatt@pmc-sierra.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20060503165446.P_aok0k7uiQ7I7_6PdZOWgE4UJt_vsGTnal41won7wo@z>

I meant changing the IP address of the device running mipsel-linux 
statically (not DHCP) on the fly (I am using http interface and a C handler 
function to do so) and then keeping it for the rest of its lifetime, so have 
to run system ( ifconfig ) or similar API call for immediate change and 
perhaps write the new IP to a file somewhere, which I am yet to discover.

Ratin

----- Original Message ----- 
From: "Don Hiatt" <Don_Hiatt@pmc-sierra.com>
To: "'Ratin'" <mrahman@sypixx.com>
Cc: <linux-mips@linux-mips.org>
Sent: Wednesday, May 03, 2006 9:21 AM
Subject: RE: changing IP address on mipsel-linux


> Perhaps you mean you want to set the IP for a NFS mounted filesystem?
>
> If so you can pass "ip=dhcp" or ip="192.168.13.120" as a kernel argument.
>
> Cheers,
>
> don
>
> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org
> [mailto:linux-mips-bounce@linux-mips.org]On Behalf Of Ratin
> Sent: Wednesday, May 03, 2006 9:12 AM
> To: Freddy Spierenburg
> Cc: linux-mips@linux-mips.org
> Subject: Re: changing IP address on mipsel-linux
>
>
> Hi Freddy, Thanks for your response, I appreciate your help. I am kind of
> new to this version of Linux.
> The uname -a gives me this:
>
> Linux 192.168.0.62 2.6.10-idt20050328 #1 Tue Dec 13 10:36:55 PST 2005 mips
> unknown
>
> Ratin
> 
