Subject: Re: Sigcontext->sc_pc Passed to User
Date: Fri, 12 Jul 2002 16:36:21 +0100 (BST)
In-Reply-To: <20020712162322.A18691@dea.linux-mips.net> from "Ralf Baechle" at Jul 12, 2002 04:23:22 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E17T2Sz-0003EN-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, "Kevin D. Kissell" <kevink@mips.com>, linux-mips@oss.sgi.com
Message-ID: <20020712153621.OKJ0kNyl4dJ9J4VqO2ypAYMpaeXGsMqKft2K2HkD8X8@z>

> > A mozilla instance on x86 commits 17Mb of potentially swap backed memory
> > when viewing the mozilla 1.0 start page. (Its actually a bit less but there
> > is delay in the garbage collector)
> 
> These were typical numbers of the last Mozilla I hacked myself on MIPS.
> It can grow larger without doing alot.  Aside of that this isn't Mozilla
> specific; any arbitrary program that does some fork & exec thing and
> it's memory size could be choosen.

These are precise page accurate measurements from the real world. What most
people forget is that very little of an ELF application is actually swap
backed as opposed to file backed read only
