Message-ID: <001501c126ca$4a5331a0$8021690a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
References: <000701c11c8b$77e039e0$8021690a@huawei.com> <20010804071016.A1275@bacchus.dhis.org>
Subject: Re: Where is the first entry point for linux-mips boot?
Date: Fri, 17 Aug 2001 11:11:21 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010817031121.TqKt6GzgJmizzmC8Z8mh-XvQxIaf0RUW-uDQYFceOhQ@z>


----- Original Message -----
From: "Ralf Baechle" <ralf@oss.sgi.com>
To: "machael thailer" <dony.he@huawei.com>
Cc: <linux-mips@oss.sgi.com>
Sent: Saturday, August 04, 2001 1:10 PM
Subject: Re: Where is the first entry point for linux-mips boot?


> On Sat, Aug 04, 2001 at 10:16:27AM +0800, machael thailer wrote:
>
> >     There are many many subdirectories in arch/mips, I don't know where
is
> > the FIRST entry point for embedded linux-mips boot process? I find that
> > there is "kernel_entry" in arch/mips/kernel/head.S. I know this is the
entry
> > point for linux kernel ,but it is not the FIRST entry point for embedded
> > linux-mips boot process. So my questions is :
> >     After the board initializations finish, it should load linux kernel
into
> > RAM and jump there .  Just before it runs the linux kernel, who calls
> > "kernel_entry"?
>
> The firmware or bootloader.

Another question:

After my custom board  finished initializations, It should load "linux
kernel" into RAM.
The question is :  Is this a compressed "linux kernel" just like vmlinux.gz
of X86 that I should load? Or is it "/usr/src/linux/vmlinux" that is not
compressed that I should load? And what RAM address should it loaded at?
Since it is linked at 0x80200000,Should I load there or at somewhere else?

Thanks very much.

machael
