content-class: urn:content-classes:message
Subject: need help on bus error problem
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 8BIT
Date: Sat, 25 Oct 2003 09:44:35 -0700
Message-ID: <92F2591F460F684C9C309EB0D33256FA01B54329@trid-mail1.tridentmicro.com>
From: "Teresa Tao" <TERESAT@TTI-DM.COM>
Return-Path: <TERESAT@TTI-DM.COM>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20031025164435.P3vKF4n2ia_HmTCkkHssI8eOuEjIhUbDEuJ77L4wYGM@z>

Hi there,

I am working on an real time video playback applicaion on a mips cpu. But after my video application play a while like 5 to 10 minutes, a bus error happened.

We add some debug meesage in the kernel, so we know that after the do_ade function inside the unalign.c, the bus error happens for the opcode lw or sw. So my guess is that I have an unaligned memory pointer(not in 4 byte boundary).
But my puzzle is that if I have an unaligned memory pointer, it should happen at the first loop I playback, how come it happens after it plays several loops?
Is there a possibility that my application's stack being trashed after a while? but I don't have recursive calls inside my application.


Thanks in advance!

Teresa
