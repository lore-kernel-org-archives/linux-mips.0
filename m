Message-ID: <000a01c4bb6d$5f0f8ae0$0e00a8c0@narendra>
From: "Narendra Kulkarni" <narendradv@myrealbox.com>
References: <000b01c4bb6a$f87b1580$0e00a8c0@narendra> <20041026150433.GA30620@linux-mips.org>
Subject: Re: errors while  insmoding usb-skeleton.o (changed to suit our requirements)
Date: Tue, 26 Oct 2004 20:36:26 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <narendradv@myrealbox.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: 'Narendra Kulkarni' <narendra@spacomp.com>, linux-mips@linux-mips.org
Message-ID: <20041026150626.SY2iBp6UkBsoYJEdirL2r3AT2eg7zyCRRPYEbp09WMo@z>

Hello Ralf,
I think if  we use -DKBUILD_BASENAME, we dont need -DMODULE. Correct me if i
am wrong

Narendra

----- Original Message ----- 
From: "Ralf Baechle" <ralf@linux-mips.org>
To: "Narendra Kulkarni" <narendra@econtek.com>
Cc: "'Narendra Kulkarni'" <narendra@spacomp.com>;
<linux-mips@linux-mips.org>
Sent: Tuesday, October 26, 2004 8:34 PM
Subject: Re: errors while insmoding usb-skeleton.o (changed to suit our
requirements)


> On Tue, Oct 26, 2004 at 08:19:14PM +0530, Narendra Kulkarni wrote:
>
> > I am building a module usb-skeleton.o with following compiler options
(The
> > complier options are same as the options of used for building kernel)
> >
> >
opt/brcm/hndtools-mipsel-linux-3.2.3/bin/mipsel-linux-gcc -D__KERNEL__  -I/
> >
usr/src/mipslinux/src/linux/linux/include -Wall -Wstrict-prototypes -Wno-tri
> >
graphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -I/usr/src/
> >
mipslinux/src/linux/linux/../../include -I/usr/src/mipslinux/src/linux/linux
> > /include/asm/gcc -G
>
>  -mno-abicalls -fno-pic -pipe -mips2  -mlong-calls  -nostdinc -iwithprefix
> > include -DKBUILD_BASENAME=usb-skeleton  -c -o usb-skeleton.o
usb-skeleton.c
> >
> >  When insmoding the usb-skeleton.o,  insmod usb-skeleton.o
> > I am getting the following erros
> >  Using usb-skeleton.o
> >  insmod: Relocation overflow of type 4 for __copy_user
> >  insmod: Relocation overflow of type 4 for __copy_user
> >  insmod: Relocation overflow of type 4 for __copy_user
> >
> > Where am i going wrong.  Help would be appreciated.
>
> Seems your compiler command line is missing -DMODULE.
>
>   Ralf
>
>
