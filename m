Subject: Re: Linux on a Tektronix XP217C xterm
Date: Tue, 8 May 2001 14:07:29 +0100 (BST)
In-Reply-To: <Pine.LNX.4.33.0105080945260.20283-100000@tori.tal.org> from "Kaj-Michael Lang" at May 08, 2001 09:56:41 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E14x7DA-0005br-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Kaj-Michael Lang <milang@tal.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010508130729.X373ri7rTdFAlx6X_DdlKMoR3PBbrtUGLyydsZHe8-g@z>

> Any chance of getting linux running on a tektronix x-terminal ? It has
> a LR33020 cpu, that I think is a R3000 integrated with some graphics
> chip. I've tried searching for documentation for the chip but I didn't
> find anything.

MMUless pseudo mips embedded CPU. Hardwired TLB's for KSEG etc. Also a few
other cute suprises such as multiply being interruptible and the irq handler
having to save cpu magic registers before doing another one.

Some of the 3com routers I hacked on used variants of these beasties. I suspect
its a ucLinux target unless you have one with loadable TLB's
