Message-ID: <000d01c4c88c$1a82e8a0$8b1a13ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
References: <01e101c4c182$5d0f2780$8b1a13ac@realtek.com.tw> <4188F75E.9010105@paulidav.org>
Subject: Re: KGDB: I cannot stop execution by using "ctrl+c"
Date: Fri, 12 Nov 2004 15:49:13 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="iso-8859-1"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Vladimir A. Gurevich" <vag@paulidav.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20041112074913.OfuICPkB2jKBEJDq0Y3OiKE3SnatL05_nQAn4Yh1Vt4@z>


Hi Vladimir,
It still cannot work using "set remotebreak 1".

Regards,
Colin


----- Original Message ----- 
From: "Vladimir A. Gurevich" <vag@paulidav.org>
To: "colin" <colin@realtek.com.tw>
Cc: <linux-mips@linux-mips.org>
Sent: Wednesday, November 03, 2004 11:21 PM
Subject: Re: KGDB: I cannot stop execution by using "ctrl+c"


> Hello Colin,
> 
> colin wrote:
> 
> >When using gdb to debug Linux kernel, I found that it cannot be stopped
> >temporarily by using "ctrl+c".
> >After the first strike of "ctrl+c", nothing happen.
> >After the second, Linux kernel will show these messages:
> >    Interrupted while waiting for the program.
> >    Give up (and stop debugging it)? (y or n)
> >If choose yes, kernel will totally stop and it goes back to gdb shell.
> >How can I stop kernel temporarily and then resume it?
> >
> You should use the following command in GDB:
> 
>     set remotebreak 1
> 
> After that it will start to behave as you expect it to, i.e. it will 
> interrupt the kernel as soon as you press CTRL-C.
> 
> Happy hacking,
> Vladimir
> 
