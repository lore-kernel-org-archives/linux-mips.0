Subject: Re: ld.so-1.9.x for mips
Date: Tue, 24 Apr 2001 14:43:51 +0100 (BST)
In-Reply-To: <3AE52A87.9050403@jungo.com> from "Michael Shmulevich" at Apr 24, 2001 10:25:59 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E14s36f-00024A-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Michael Shmulevich <michaels@jungo.com>
Cc: Ralf Baechle <ralf@oss.sgi.com>, Linux/MIPS <linux-mips@oss.sgi.com>, FR Linux/MIPS <linux-mips@fnet.fr>
Message-ID: <20010424134351.ciZdql4GoM0EL1KXOuTYY1B5BbzxJ2IqbFfNQh9fGSc@z>

> The whole idea behind uClibc was to get rid of that huge chunk of 
> memory-wasting package, and I do not mean to use any part of it.
> Unless you can tell me how ld.so of glibc can be compiled standalone :-)

You might want to look at newlib instead. That has mips support but not afaik
MIPS linux syscall bindings yet. Its used for things like eCos
