Subject: Re: thread-ready ABIs
Date: Sun, 27 Jan 2002 20:24:36 +0000 (GMT)
In-Reply-To: <20020122121330.A16110@nevyn.them.org> from "Daniel Jacobowitz" at Jan 22, 2002 12:13:30 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16Uvqu-0002X7-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Daniel Jacobowitz <dan@debian.org>
Cc: "Kevin D. Kissell" <kevink@mips.com>, Dominic Sweetman <dom@algor.co.uk>, Ralf Baechle <ralf@oss.sgi.com>, Ulrich Drepper <drepper@redhat.com>, Mike Uhler <uhler@mips.com>, "\"MIPS/Linux List SGI\"" <linux-mips@oss.sgi.com>, "H . J . Lu" <hjl@lucon.org>
Message-ID: <20020127202436.UIWTUQqslrf6t0Fg0vf2A3f6LMH6wZpuowLTMJYmBOE@z>

> Which it is.  Fork shares no memory regions; vfork/clone share all
> memory regions.  AFAIK there is no share-heap-but-not-stack option in
> Linux.

Thats a design decision. At the point you don't have identical mappings for
both threads you need two sets of page tables and you take all the
performance hits that go with changing current tables on a schedule.

Its a lot cheaper to use a different %esp for each thread
