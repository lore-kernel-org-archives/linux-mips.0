Message-ID: <048f01c14241$89c103c0$3501010a@ltc.com>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <3BAA962D.C55F2239@mvista.com>
Subject: Re: busybox does not like 2.4.8, or the other way around?
Date: Thu, 20 Sep 2001 22:02:58 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jun Sun <jsun@mvista.com>, linux-mips@oss.sgi.com
Message-ID: <20010921020258.zLL8av9riuAE8CUlxthrKQ8ptyfW4Bm8AxWQp4owFAo@z>

I'm using busybox 0.60.1 with the latest oss kernel with success.  No clue
on why your busybox is stuck though.

Regards,
Brad

----- Original Message -----
From: "Jun Sun" <jsun@mvista.com>
To: <linux-mips@oss.sgi.com>
Sent: Thursday, September 20, 2001 9:21 PM
Subject: busybox does not like 2.4.8, or the other way around?


>
> I have a small busybox userland that works fine with 2.4.2 kernel, but
failed
> with the latest 2.4.8 kernel.  The symptom is that it is stuck at the
> following prompt:
>
> ================
> ....
> Kernel command line: console=ttyS0,115200 ip=bootp
> ....
> Freeing unused kernel memory: 4k freed
> Algorithmics/MIPS FPU Emulator v1.4
> serial console detected.  Disabling virtual terminals.
> init started:  BusyBox v0.51 (2001.07.18-06:43+0000) multi-call binary
>
> Please press Enter to activate this console.
> ================
>
> A simple test shows the console is still working, i.e., pressing a key
*does*
> generate an interrupt and ISR *does* read the correct char value.
>
> I really cannot think of anything else that might make busybox stuck here.
> Any clue?  Anybody else is using busybox with more recent kernels?
>
> Jun
>
