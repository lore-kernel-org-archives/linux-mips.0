Received: from mx.mips.com ([63.167.95.198]:24245 "EHLO dns0.mips.com")
	by ftp.linux-mips.org with ESMTP id S20024024AbXFKNb2 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 11 Jun 2007 14:31:28 +0100
Message-ID: <007b01c7ac2c$caa073c0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <11815673353523-git-send-email-fbuihuu@gmail.com> <11815673362011-git-send-email-fbuihuu@gmail.com> <Pine.LNX.4.64N.0706111425110.6714@blysk.ds.pg.gda.pl>
Subject: Re: [PATCH 2/3] Remove MIPS SEAD support
Date: Mon, 11 Jun 2007 15:31:16 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@linux-mips.org>, Franck Bui-Huu <vagabon.xyz@gmail.com>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20070611133116.er5OgqQS3Z9qcpjK1sPoxS65hCd4D9RHhhO12AhxdtM@z>

> On Mon, 11 Jun 2007, Franck Bui-Huu wrote:
> 
> > Mips Sead support is deprecated and scheduled for removal
> > since September 2006.
> 
>  Oh, is it?  The last time I tried it worked.  Have you tried it and 
> failed to build?  That should be easy to fix.

There aren't that many SEAD users out there, but then again, no
replacement platform for SEAD has been announced, so I'm not 
wildly enthusiastic about deleting support for it, if it still works.

            Regards,

            Kevin K.
