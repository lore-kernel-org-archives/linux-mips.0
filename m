Message-ID: <012b01c58d2e$54a18250$6cf9a8c0@ALEC>
Reply-To: "Alexander Voropay" <alec@artcoms.ru>
From: "Alexander Voropay" <alec@artcoms.ru>
References: <f07e6e05071909301c212ab4@mail.gmail.com> <20050719164427.GB8758@linux-mips.org> <f07e6e05071910194bab9b16@mail.gmail.com> <1121802786.7285.88.camel@localhost.localdomain> <Pine.LNX.4.61L.0507200955390.30702@blysk.ds.pg.gda.pl> <f07e6e05072002197b529b72@mail.gmail.com> <010901c58d28$15e2a3b0$6cf9a8c0@ALEC> <Pine.LNX.4.61L.0507201347350.30702@blysk.ds.pg.gda.pl>
Subject: Re: bal instruction in gcc 3.x
Date: Wed, 20 Jul 2005 17:24:15 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="ISO-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <alec@artcoms.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20050720132415.kZEKJ2Ipv34l1hqvWBUI6MuT2_xMH-MhS6bkP6kKLAk@z>

"Maciej W. Rozycki" <macro@linux-mips.org> wrote:

> There were discussions as to whether reuse R_MIPS_PC16 for 
> branches or not.  Unfortunately I don't remember the conclusion -- you'd 
> have to find it out yourself.

http://sourceware.org/ml/binutils/2003-02/msg00447.html  (follow thread)

Seems, binutils people have removed this in more recent binutils versions.
MIPS SDE is more conservative there.

--
-=AV=-
