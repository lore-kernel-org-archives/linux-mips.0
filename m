Message-ID: <09ac01c4ca24$e68a6740$a701a8c0@lan>
From: "Gilad Rom" <gilad@romat.com>
References: <20041112181335.13362.qmail@web81008.mail.yahoo.com>
Subject: Re: GPIO on the Au1500
Date: Sun, 14 Nov 2004 10:35:30 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <gilad@romat.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: ppopov@embeddedalley.com, linux-mips@linux-mips.org
Message-ID: <20041114083530.vFYehf-qZ57AN7XRZaIaydzALGzWDMdHc5BJXupLBLc@z>

Thanks. 
Can't I just mmap /dev/mem and use the
GPIO offset from SYS_BASE?

Gilad.

----- Original Message ----- 
From: "Pete Popov" <ppopov@embeddedalley.com>
To: "Gilad Rom" <gilad@romat.com>; <linux-mips@linux-mips.org>
Sent: Friday, November 12, 2004 8:13 PM
Subject: Re: GPIO on the Au1500


> 
> --- Gilad Rom <gilad@romat.com> wrote:
> 
>> Hello,
>> 
>> I am trying to use the au1000_gpio driver, but I'm a
>> little clueless as to how it is meant to be used. 
>> Can I use the GPIO ioctl's from a userland 
>> program, or must I write a kernel module?
> 
> I'll see if I can dig up some docs and the example
> userland program this weekend. That driver hasn't been
> tested in a while though.
> 
> Pete
> 
>> Thank you,
>> Gilad Rom
>> Romat Telecom
>> 
>> 
>> 
>
