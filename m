Received: from dns0.mips.com ([63.167.95.198]:62648 "EHLO dns0.mips.com")
	by ftp.linux-mips.org with ESMTP id S20026641AbXKMOq5 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 13 Nov 2007 14:46:57 +0000
Message-ID: <019e01c82602$f5463bf0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <473957B6.3030202@avtrex.com> <18233.36645.232058.964652@zebedee.pink> <20071113121036.GA6582@linux-mips.org> <cda58cb80711130514x16356ea3x4069616c9ee3caac@mail.gmail.com>
Subject: Re: Cannot unwind through MIPS signal frames with ICACHE_REFILLS_WORKAROUND_WAR
Date: Tue, 13 Nov 2007 15:37:39 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Franck Bui-Huu <vagabon.xyz@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: Andrew Haley <aph-gcc@littlepinkcloud.com>, David Daney <ddaney@avtrex.com>, linux-mips@linux-mips.org, Richard Sandiford <rsandifo@nildram.co.uk>, gcc@gcc.gnu.org
Message-ID: <20071113143739.DTtxlTrKBV8XKm9Gm7Asn8Luqg6o1B6Ejz3h5tbsYHU@z>

Franck a dit:
> > Another reason is to get rid of the classic trampoline the kernel installs
> > on the stack.  On some multiprocessor systems it requires a cacheflush
> > operation to be performed on all processors which is expensive.  Having
> > the trampoline in a vDSO would solve that.
> >
> 
> And the stack wouldn't need to have exec permission anymore.

True, though it should perhaps be noted that currently it's only on 4KSc/Sd
systems (which I know you work on) where it's even possible for the stack
*not* to have exec permissions, since the classical MIPS MMU gives
execute permission to any page that is readable.

            Regards,

            Kevin K.
