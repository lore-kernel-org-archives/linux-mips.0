Message-ID: <075901c11902$6a27b260$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <200107301345.f6UDjXV04192@oss.sgi.com>
Subject: Re:/sbin/init problem in HH2.0 distro
Date: Mon, 30 Jul 2001 16:17:32 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Fuxin Zhang <fxzhang@ict.ac.cn>, linux-mips@oss.sgi.com
Message-ID: <20010730141732.TnLZEWLyuP1UXYbeq5S1TaGzXjrAejfO_U7YxQLMD0I@z>

Well, if you can run "passwd", can you run "nm"
or some other utility to see if libc.so.6 does
in fact define the symbol _sec0?

            Kevin K.

----- Original Message -----
From: "Fuxin Zhang" <fxzhang@ict.ac.cn>
To: <linux-mips@oss.sgi.com>
Sent: Monday, July 30, 2001 3:48 PM


> hello,linux-mips
>     I am porting support of Algorithmics P6032 evalution board from
> 2.2 kernel to 2.4. I started with the kernel 2.4.3 from hardhat2.0
> distribution.Now I am able to boot the kernel but it hangs up when
> trying to exec /sbin/init.The error message is something like:
>    Init: Kernel panic: trying to kill init
>    Init:error loading libc.so.6, undefined symbol _sec0
>
> But if i let the kernel execute /bin/ash.static directly,it can give me
> a shell while complaining something like" no tty found,job control
disabled". Then I can use most commands such as ls,passwd,cat.So the
> libc.so.6 can't be a corrupted one.
>
>   The test environment is:
>        Algorithmics P6032 with a idt79RC64474 CPU
>        IDE hard disk(IBM Deskstar 40M,7200rpm)
>   Kernel options:
>        pci,ide(with/without dma,multimode) enabled
>        serial console enabled
>
>   What can be the cause?
>
>   I suspect the ide driver first.But disabling dma doesn't help and it
> seems to work quite well under ash.
>
>   I am investigating the cause,if you want,I can provide more
> information.
>
>
>
>
>
> Regards
>             Fuxin Zhang
>             fxzhang@ict.ac.cn
>
