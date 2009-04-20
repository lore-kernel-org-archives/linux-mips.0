Received: from rtp-iport-2.cisco.com ([64.102.122.149]:38420 "EHLO
	rtp-iport-2.cisco.com") by ftp.linux-mips.org with ESMTP
	id S20031223AbZDTUHV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 20 Apr 2009 21:07:21 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: Boot program interface
Date: Mon, 20 Apr 2009 16:07:11 -0400
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A2890105326D@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <200904201057.04833.florian@openwrt.org>
References: <1240213045.49ec26350fa49@www.sysgo.com> <200904201057.04833.florian@openwrt.org>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Florian Fainelli <florian@openwrt.org>, Carlos Mitidieri <cam@sysgo.com>
Cc: linux-mips@linux-mips.org, "Dezhong Diao (dediao)" <dediao@cisco.com>, "Tony Colclough (colclot)" <colclot@cisco.com>
Message-ID: <20090420200711.7wYBdoMwwlDhrjceixq68NH6J93D8i4PjjTbZLBLlb0@z>

We have a working version of the device tree for MIPS. I'll see if we can expedite a patch. 

> -----Original Message-----
> From: linux-mips-bounce@linux-mips.org 
> [mailto:linux-mips-bounce@linux-mips.org] On Behalf Of 
> Florian Fainelli
> Sent: Monday, April 20, 2009 1:57 AM
> To: Carlos Mitidieri
> Cc: linux-mips@linux-mips.org
> Subject: Re: Boot program interface
> 
> Hi Carlos,
> 
> Le Monday 20 April 2009 09:37:25 Carlos Mitidieri, vous avez écrit :
> > Hello,
> >
> > I am working on a project that requires an extensive boot program
> > interface.
> >
> > It turns out that the device tree used on PPC architecture meets the
> > requirements.
> >
> > I have been looking, and I could not find any similar 
> concept implemented
> > for MIPS.
> 
> I do not know any MIPS board using a device tree either.
> 
> >
> > So, I am now considering to port the OFDT library into the 
> MIPS arch.
> >
> > What do you think about this? Is there anyone working on a 
> similar project?
> 
> You should see how Sparc, PowerPC and Microblaze use it and 
> how they do share 
> code. Also condiser seeing how u-boot handles device trees, 
> specifically on 
> PowerPC and Microblaze.
> 
> Hope that helps.
> -- 
> Best regards, Florian Fainelli
> Email : florian@openwrt.org
> http://openwrt.org
> -------------------------------
> 
