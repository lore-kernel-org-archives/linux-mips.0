Received: from mail.hcrest.com ([12.173.51.131]:2104 "EHLO mail.hcrest.com")
	by ftp.linux-mips.org with ESMTP id S20023005AbXCZXZP convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 27 Mar 2007 00:25:15 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 8BIT
Subject: RE: flush_anon_page for MIPS
Date: Mon, 26 Mar 2007 19:24:45 -0400
Message-ID: <36E4692623C5974BA6661C0B18EE8EDF6CD4AF@MAILSERV.hcrest.com>
In-Reply-To: <20070326140542.GA14354@linux-mips.org>
From: "Ravi Pratap" <Ravi.Pratap@hillcrestlabs.com>
Return-Path: <Ravi.Pratap@hillcrestlabs.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: David Daney <ddaney@avtrex.com>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, miklos@szeredi.hu, linux-mips@linux-mips.org
Message-ID: <20070326232445.-aNBMqGwjGi1USC6ovjF5M8doV48R_2yMH3W0roPraI@z>

> From: Ralf Baechle [mailto:ralf@linux-mips.org] 
> Sent: Monday, March 26, 2007 10:06 AM
> To: Ravi Pratap
> Cc: David Daney; Atsushi Nemoto; miklos@szeredi.hu; 
> linux-mips@linux-mips.org
> Subject: Re: flush_anon_page for MIPS
> 
> On Mon, Mar 26, 2007 at 09:33:10AM -0400, Ravi Pratap wrote:
> > Yes, but isn't it a lot of work considering the lack of a 
> > flush_anon_page in 2.6.15?
> 
> David wrote about forward porting the patches in your vendor 
> kernel to a more modern kernel.  That would require some work but the
> flush_anon_page() thing would be the least of your worries.
> 
> Otherwise, you'd need to backport the about following 
> changesets into your kernel to get flush_anon_page:
> 
> 03beb07664d768db97bf454ae5c9581cd4737bb4
> df7c814ea6385fea8ccf54c80ec78326f78b743e

So I'm trying to backport these changesets and it seems that I need the
changeset that originally introduced kmap_coherent, etc. I tried some
Google searching and found this but I need your help in figuring out
which exact changesets I need.

Is it this one:

b895b66990f22a8a030c41390c538660a02bb97f

?


Thanks,

Ravi.
