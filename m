Received: from mail.zeugmasystems.com ([192.139.122.66]:45764 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20039173AbWKAQcf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 1 Nov 2006 16:32:35 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: Cannot run N32 binaries.
Date: Wed, 1 Nov 2006 08:32:27 -0800
Message-ID: <66910A579C9312469A7DF9ADB54A8B7D44D2C5@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20061101163227.loVO5Z6Rb3vBDTvLDL5jvwXyuuj25b-n1ijGdv2XS2k@z>

Ilya A. Volynets-Evenbakh wrote:
> Could be looking for non-existant ld.so.1 (do you have N32 
> version of it
> in /lib32?)

That is correct. If I make a /lib32 -> lib symbolic link, everything
runs.

I actually built the libs under /lib, but I did not realize that ld
simply writes a hard-coded path for the dynamic linker into executables.

That is to say, I built an all-n32 system, using /lib and /usr/lib.

This is elegant, but probably a bad idea, so I will go back to the
/lib32 scheme.
