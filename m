Received: from wssseeger ([192.168.1.53]) by nt_server.stellartec.com
          (Post.Office MTA v3.1.2 release (PO205-101c)
          ID# 568-43562U100L2S100) with SMTP id AAA113
          for <linux-mips@linux-mips.org>; Wed, 12 Feb 2003 09:27:42 -0800
Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: RE: NEC VR4181A
Date: Wed, 12 Feb 2003 09:30:58 -0800
Message-ID: <027601c2d2bc$8234acd0$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200302121823.09663.jscheel@activevb.de>
Return-Path: <sseeger@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030212173058.0YAOH3J3P1JvkdD8WQlyxg55qhBd70Ol56LGW7VgjYA@z>

Julian,

We are doing a project here at work with that board. Are you using the NEC
Osprey? The board is a POS. Watch out for the voltage buffers on the extern
ISA ports not being able to handle the speed of the ISA bus if the board
isn't warmed up. Get your heat gun if you're plugging in any hardware to it.

For building your cross compiler (you will want to use mipsel, which is 32.
Don't do 64 bit stuff on the 4181. You'll never need it) please see
http://www.ltc.com/~brad/mips/mips-cross-toolchain/ which is a great guide.
Take care not to overwrite your PC's libs with mips ones. Ouch. :)

I'm happy with this processor although it is a bit slow. I managed to get
worst case interrupt latency at 46 microseconds with linux going full blast
on network and compact flash stuff with our external board. (using RTAI and
kernel 2.4.18)

Steve

>-----Original Message-----
>From: linux-mips-bounce@linux-mips.org
>[mailto:linux-mips-bounce@linux-mips.org]On Behalf Of Julian Scheel
>Sent: Wednesday, February 12, 2003 9:23 AM
>To: linux-mips@linux-mips.org
>Subject: NEC VR4181A
>
>
>Hello all,
>
>I need a bit help. First I have to say I am a total newbie in
>cross-compiler
>and MIPS-section.
>I have a little board with a NEC VR4181A CPU (Mips 64). Now I
>want to build a
>kernel for this board.
>I think first I have to do is building a Cross-Toolchain, right?
>Can someone give me some links how to do that?
>
>Then I have to compile the kernel, are there any MIPS-specific
>things I have
>to be warned off?
>
>Thanks in advance and many greatings,
>Julian
>
