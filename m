Received: from Muruga.localdomain (unverified [66.135.134.124]) by micaiah.rwc.iqcicom.com
 (Vircom SMTPRS 2.0.244) with ESMTP id <B0006366815@micaiah.rwc.iqcicom.com> for <linux-mips@linux-mips.org>;
 Fri, 9 May 2003 23:11:59 -0700
Received: from localhost (muthu@localhost)
	by Muruga.localdomain (8.11.6/8.11.2) with ESMTP id h4A5oON12880
	for <linux-mips@linux-mips.org>; Fri, 9 May 2003 22:50:24 -0700
Date: Fri, 9 May 2003 22:50:24 -0700 (PDT)
From: Muthukumar Ratty <muthu@iqmail.net>
Subject: Re: OpenSSL/Binutils Issues
In-Reply-To: <3EBC7E21.6040109@gentoo.org>
Message-ID: <Pine.LNX.4.33.0305092248450.12875-100000@Muruga.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <muthu@iqmail.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030510055024.cbFe_DofnkRVvUKO2Peg677ObZbeVN3CuQ5OT-8wg6o@z>

> 		./conftest: error while loading shared libraries:
> 		usr/lib/libcrypto.so.0.9.6: unexpected reloc type 0x68
>


something really wrong with your crypto library (has some non mips
specific rel. syms???)

> not sure if this is mips-specific, or if I need to bother the OpenSSL
> team about it.

probably you should :)


>
> 	Ideas?
>
> --Kumba
>
>
>
>
