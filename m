Received: from accolon.hansenpartnership.com ([76.243.235.52]:17325 "EHLO
	accolon.hansenpartnership.com") by ftp.linux-mips.org with ESMTP
	id S24081604AbYLCRIv (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 3 Dec 2008 17:08:51 +0000
Subject: Re: [PATCH] SCSI: fix the return type of the remove() method in
	sgiwd93.c
From: James Bottomley <James.Bottomley@HansenPartnership.com>
In-Reply-To: <46353.88.114.226.209.1228321494.squirrel@webmail.movial.fi>
References: <1227140357-29921-1-git-send-email-dmitri.vorobiev@movial.fi>
	 <46353.88.114.226.209.1228321494.squirrel@webmail.movial.fi>
Content-Type: text/plain
Date: Wed, 03 Dec 2008 11:08:43 -0600
Message-ID: <1228324123.5551.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: <James.Bottomley@HansenPartnership.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Vorobiev Dmitri <dmitri.vorobiev@movial.fi>
Cc: linux-scsi@vger.kernel.org, linux-mips@linux-mips.org, Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>
Message-ID: <20081203170843.r36cij9iXGDiaht5te_5tSSR3LosL3fPu6o2BLMkSUM@z>

On Wed, 2008-12-03 at 18:24 +0200, Vorobiev Dmitri wrote:
> > This patch fixes the following compilation warning:
> >
> >   CC [M]  drivers/scsi/sgiwd93.o
> > drivers/scsi/sgiwd93.c:314: warning: initialization from incompatible
> > pointer type
> >
> 
> Hello James,
> 
> Any news about this one? I think this patch should go via linux-scsi,
> unless you would be insisting on pushing it via linux-mips, in which case
> I'll politely bug Ralf about it. :)

Looks OK for the local change.

Globally, having driver->remove and platform_driver->remove return int
instead of void looks wrong.  Particularly when the only use cases are
in drivers/base/ and they all ignore the return code.

Greg and Kay ... shouldn't we simply redefine the return values for the
remove methods in these structures to return void (and thus match the
use case)?

James
