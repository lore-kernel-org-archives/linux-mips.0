Received: from rtp-iport-2.cisco.com ([64.102.122.149]:43293 "EHLO
	rtp-iport-2.cisco.com") by ftp.linux-mips.org with ESMTP
	id S21365236AbZAYVus convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sun, 25 Jan 2009 21:50:48 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: 2.6.28 will not boot on 24K processor, ebase incorrectly modified in set_uncached_handler
Date: Sun, 25 Jan 2009 16:50:25 -0500
Message-ID: <FF038EB85946AA46B18DFEE6E6F8A28976828C@xmb-rtp-218.amer.cisco.com>
In-Reply-To: <497C3C6F.3000209@paralogos.com>
References: <FF038EB85946AA46B18DFEE6E6F8A28976825D@xmb-rtp-218.amer.cisco.com> <497C3C6F.3000209@paralogos.com>
From: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Return-Path: <dvomlehn@cisco.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Kevin D. Kissell" <kevink@paralogos.com>
Cc: linux-mips@linux-mips.org, "Dezhong Diao (dediao)" <dediao@cisco.com>, "Victor Williams Jr (williavi)" <williavi@cisco.com>, "Michael Sundius -X (msundius - Yoh Services LLC at Cisco)" <msundius@cisco.com>
Message-ID: <20090125215025.pVvxG-RNRrLdSbisZYSC-8n8MzfSoVgdlfFlje9Z0Fg@z>

> From: Kevin D. Kissell [mailto:kevink@paralogos.com] 
> Sent: Sunday, January 25, 2009 2:18 AM
> To: David VomLehn (dvomlehn)
> Cc: linux-mips@linux-mips.org; Dezhong Diao (dediao); Victor 
> Williams Jr (williavi); Michael Sundius -X (msundius - Yoh 
> Services LLC at Cisco)
> Subject: Re: 2.6.28 will not boot on 24K processor, ebase 
> incorrectly modified in set_uncached_handler
> 
> David VomLehn (dvomlehn) wrote:
> > The 2.6.28 kernel dies in memcpy when called from 
> set_vi_srs_handler on
> > a
> > 24K processor. The problem is that ebase has an invalid value. The
> > original
> > value of ebase comes from a bootmem allocation, but the 
> following code
> > in
> > set_uncached_handler takes a perfectly good kseg0 address 
> and turns it
> > into
> > an invalid kseg1 address.
> >
> > 	if (cpu_has_mips_r2)
> > 		ebase += (read_c0_ebase() & 0x3ffff000);
> >
> > This code was added in commit 
> 566f74f6b2f8b85d5b8d6caaf97e5672cecd3e3e.
> >   
> I remember worrying about why it was "+=" and not "=" when others had 
> problems with that patch. See the thread "NXP STB225 board 
> support" from 
> January 8 or so.  When I asked about that, I got a comment 
> that the add 
> operation was correct, but that patch *should* have said 
> "uncached_ebase 
> += (read_c0_ebase() & 0x3ffff000);"  I guess uncache_ebase is 
> assumed to 
> contain something interesting in some non-address bits. Try 
> pre-pending 
> "uncached_" to that "ebase"...

Just adding uncached_ to the ebase doesn't appear to work. Looking at
the git
log makes it a bit unclear as to exactly who made this change, but it
would
be helpful to know what was intended.
