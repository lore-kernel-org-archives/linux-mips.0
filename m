From: "Soeren Laursen" <soeren.laursen@scrooge.dk>
Date: Mon, 17 Sep 2001 18:39:30 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Subject: Re: openssh probs
Reply-to: soeren.laursen@scrooge.dk
Message-ID: <3BA64362.29627.225041C@localhost>
References: <3BA63E02.20088.2100546@localhost>
In-reply-to: <Pine.SOL.4.31.0109171218020.15630-100000@fury.csh.rit.edu>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: George Gensure <werkt@csh.rit.edu>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010917163930.jX4risM2g2VP4rjZ5lYlsM4W11kFwAEOwTy4ARS3fLo@z>

> Yeah, should've mentioned the version.  I'm already running 2.9p2.  The
> ssh server I'm testing on, I KNOW works.  I connect to it from my i686 box
> all the time.  I looked at the packet dump, and it doesn't look like the
> MAC is getting sent correctly.  I wasn't able to find the string anywhere
> in there (assuming it gets sent unencrypted, of course).

Running
OpenSSH_2.9p2, SSH protocols 1.5/2.0, 

On a:
cpu                     : MIPS
cpu model               : R4000SC V5.0
system type             : SGI Indy
BogoMIPS                : 74.75
byteorder               : big endian
unaligned accesses      : 0
wait instruction        : no
microsecond timers      : yes
extra interrupt vector  : no
hardware watchpoint     : yes
VCED exceptions         : 27900
VCEI exceptions         : 135012

It is a 2.4.3 kernel.

Nothing special running on it.

Just installed a upgrade 2.9p6
OpenSSH_2.9p2, SSH protocols 1.5/2.0, OpenSSL 0x0090602f

And it work just as great as the first version.

Best regards,

Søren,
