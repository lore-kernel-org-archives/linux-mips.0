Received: from mail.hcrest.com ([12.173.51.131]:44144 "EHLO mail.hcrest.com")
	by ftp.linux-mips.org with ESMTP id S20021815AbXC0Ovt convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 27 Mar 2007 15:51:49 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Subject: RE: flush_anon_page for MIPS
Date: Tue, 27 Mar 2007 10:51:10 -0400
Message-ID: <36E4692623C5974BA6661C0B18EE8EDF6CD4D6@MAILSERV.hcrest.com>
In-Reply-To: <20070327.121733.130850411.nemoto@toshiba-tops.co.jp>
From: "Ravi Pratap" <Ravi.Pratap@hillcrestlabs.com>
Return-Path: <Ravi.Pratap@hillcrestlabs.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: ralf@linux-mips.org, ddaney@avtrex.com, miklos@szeredi.hu, linux-mips@linux-mips.org
Message-ID: <20070327145110.W6-pATA3Nolvrs3YPETy22YmdCBumQzi2Un8VkmCZuE@z>

> From: Atsushi Nemoto [mailto:anemo@mba.ocn.ne.jp] 
> Sent: Monday, March 26, 2007 11:18 PM
> To: Ravi Pratap
> Cc: ralf@linux-mips.org; ddaney@avtrex.com; 
> miklos@szeredi.hu; linux-mips@linux-mips.org
> Subject: Re: flush_anon_page for MIPS
> 
> On Mon, 26 Mar 2007 19:24:45 -0400, "Ravi Pratap" 
> <Ravi.Pratap@hillcrestlabs.com> wrote:
> > So I'm trying to backport these changesets and it seems that I need 
> > the changeset that originally introduced kmap_coherent, 
> etc. I tried 
> > some Google searching and found this but I need your help 
> in figuring 
> > out which exact changesets I need.
> > 
> > Is it this one:
> > 
> > b895b66990f22a8a030c41390c538660a02bb97f
> > 
> > ?
> 
> It was splitted into some parts when merged to mainline.
> 
> At 2.6.19 cycle:
> f8829caee311207afbc882794bdc5aa0db5caf33
> At 2.6.20 cycle:
> bcd022801ee514e28c32837f0b3ce18c775f1a7b
> 9de455b20705f36384a711d4a20bcf7ba1ab180b
> 77fff4ae2b7bba6d66a8287d9ab948e2b6c16145
> 
> If you only needed kmap_coherent, the first one might be enough.

Thanks - the first one, with some minor updates was good enough to apply
to 2.6.15.


Ravi.
