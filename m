Subject: Re: Sigcontext->sc_pc Passed to User
Date: Fri, 12 Jul 2002 14:01:56 +0100 (BST)
In-Reply-To: <20020712120024.A20727@dea.linux-mips.net> from "Ralf Baechle" at Jul 12, 2002 12:00:24 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E17T03Y-0002tg-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: "Kevin D. Kissell" <kevink@mips.com>, linux-mips@oss.sgi.com
Message-ID: <20020712130156.LPaggd2SBI7z6O1PQV_bZFzVsVC6p84M3PSx9jPK7gk@z>

> Non-overcommit means large amounts of memory are required when forking
> of a new process.  The standard example is a fat bloated Mozilla forking
> for printing.  Non-overcommit means you need those 50 or 100 megs of
> Mozilla process size once more and if not as physical memory then at
> least as swap space.  Deciede yourself if you're paranoid and want that
> operation to only succeed if that much memory is actually available or
> if you take the risk of the fork & exec operation failing the other way.

Your numbers are ridiculously off.

A mozilla instance on x86 commits 17Mb of potentially swap backed memory
when viewing the mozilla 1.0 start page. (Its actually a bit less but there
is delay in the garbage collector)

2.4.18/19-ac support non overcommit, and its rather useful

Alan
