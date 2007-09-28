Received: from mx.mips.com ([63.167.95.198]:38549 "EHLO dns0.mips.com")
	by ftp.linux-mips.org with ESMTP id S20022876AbXI1GIr (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 28 Sep 2007 07:08:47 +0100
Message-ID: <002801c80196$003f4dd0$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <52163af60709272223n72212e2bh197c7e622e3ba155@mail.gmail.com>
Subject: Re: mapping a userspace thread to a kernelspace thread
Date: Fri, 28 Sep 2007 08:08:32 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Suprasad Mutalik Desai <suprasad.desai@gmail.com>, linux-mips@linux-mips.org
Message-ID: <20070928060832.BknUlq0aAVxOLkBz5Xd12YKtmT5xJ99zK-AgEzlvCKk@z>

You seem to be laboring under a misconception or two, here.  NPTL is a 1:1 threading
model (it would have been damned convenient for me for it not to have been).  Both
linuxthreads and NPTL will create a native, known-to-the-kernel thread, which is what
I think you mean by a "kernel thread", in response to a pthread_create().  The new thread
will start life on the same CPU that created it, but normal load balancing will generally
migrate it elsewhere pretty quickly.  If you want to manage thread->CPU binding
explicitly, the sys_sched_setaffinity() system call can be used.

            Regards,

            Kevin K.

----- Original Message ----- 
From: "Suprasad Mutalik Desai" <suprasad.desai@gmail.com>
To: <linux-mips@linux-mips.org>
Sent: Friday, September 28, 2007 7:23 AM
Subject: mapping a userspace thread to a kernelspace thread


> Hi list ,
> 
>             I want to know how can we map a userspace thread to a
> kernel thread as mentioned in 1:1 threading model (linuxthreads) or
> M:N model (NPTL)  . Does this happen by just calling a
> pthread_create() in the userspace program or i need to do something
> more in the kernel space . i am using 2.6.20 kernel  .
>        I want to use this for multi threading operation in a SMP
> environment where in i want to schedule a userspace program on another
> processor by spawning a thread  . Can anyone help me in this.
> 
> Thanks and regards,
> Suprasad.
> 
> 
