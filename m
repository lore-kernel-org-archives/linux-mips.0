Message-ID: <00cb01c0be94$7744aac0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <20010406130958.A14083@paradigm.rfc822.org> <20010406132214.D14083@paradigm.rfc822.org> <00a401c0be8e$cfc065a0$0deca8c0@Ulysses> <20010406135849.E14083@paradigm.rfc822.org>
Subject: Re: first packages for mipsel
Date: Fri, 6 Apr 2001 14:23:53 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Florian Lohoff <flo@rfc822.org>
Cc: debian-mips@lists.debian.org, linux-mips@oss.sgi.com
Message-ID: <20010406122353.PcIlV0YdQuVnpsJxjndeG4YDQdgYmaMxse2M0_vflho@z>

> If there is a working ll/sc emulation fine - Currently there is none
> so the only way to go TODAY is sysmips.

I'll work on one in the background.  It should be pretty straightforward
for the uniprocessor case, but an SMP version will be messier, and
possibly require a platform-dependent hook.  Of course, the same
is true of sysmips()...

            Kevin K.
