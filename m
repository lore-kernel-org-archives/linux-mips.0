Subject: kernel for custom MV64341 board?
From: Fredrik <fcn-sub@noon.org>
Date: Tue, 15 Feb 2005 17:55:50 -0800
Message-ID: <ubrale09l.fsf@noon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-Path: <fcn@noon.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050216015550.KGQWHa-y7ZACj-g_oAudD9tqgzM0oI86LAFlHUPj7Sc@z>

Howdy,

I'm getting a custom board going: it sports an RM7000 and Marvell
MV64341 system controller (alas, no external UART!).  I've hacked
U-Boot to the point where I can TFTP a kernel image and (start to)
boot it.

So far I've been using an old 2.4 kernel I used for some Ocelot-G
work, just to get past the TFTP-load stage. MY QUESTION IS: What would
be the best kernel version for me to now start customizing for my
board?  Is 2.6 too bleeding-edge, 2.4 too moldy, or what?  Dealing
with the MV64341 will be most of the effort, of course.

The Ocelot boards seem well supported, but there looks to be a lot of
code that would have to change (different system controller, different
memory map--though I'm flexible--a lot of assumptions about the
goodies available on-board, etc.).  This is the first time I'll be
porting the kernel, so it might be more productive for me to start
from a minimalist configuration and add-in what I need.  Enough code
to set up the memory configuration would be a big help.

Suggestions?

/Fredrik

+----------------------------------------------------------------+
|            Fredrik Noon,   Senior Software Engineer            |
|            Hifn, Inc.      www.hifn.com                        |
|            fnoon@hifn.com  +1 408 399 3630                     |
|-------------------+--------------------------------------------|
|  pgp key: <http://noon.org/keys/pgpkey.txt> 7840AC55           |
+----------------------------------------------------------------+
