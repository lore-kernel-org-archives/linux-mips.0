Message-ID: <000901c12704$bf95c2e0$8021690a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
References: <000701c11c8b$77e039e0$8021690a@huawei.com> <20010804071016.A1275@bacchus.dhis.org> <001501c126ca$4a5331a0$8021690a@huawei.com> <20010817052635.A2931@bacchus.dhis.org>
Subject: Re: Where is the first entry point for linux-mips boot?
Date: Fri, 17 Aug 2001 18:09:48 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010817100948.YMzAA8QJS804bY3kSUfFzTTCHWJsl_7TQgctmz0uizI@z>


----- Original Message -----
From: "Ralf Baechle" <ralf@oss.sgi.com>
To: "machael thailer" <dony.he@huawei.com>
Cc: <linux-mips@oss.sgi.com>
Sent: Friday, August 17, 2001 11:26 AM
Subject: Re: Where is the first entry point for linux-mips boot?


> On Fri, Aug 17, 2001 at 11:11:21AM +0800, machael thailer wrote:
>
> > After my custom board  finished initializations, It should load "linux
> > kernel" into RAM.
> > The question is :  Is this a compressed "linux kernel" just like
vmlinux.gz
> > of X86 that I should load? Or is it "/usr/src/linux/vmlinux" that is not
> > compressed that I should load?
>
> The standard MIPS kernel doesn't support compressed kernels on MIPS.
>
> > And what RAM address should it loaded at?  Since it is linked at
> > 0x80200000,Should I load there or at somewhere else?
>
> Obviously to the address it's linked for.  You can adjust that address
> as you need.  With compressed kernels it may be necessary to choose a
> different address however so the decompressed kernel doesn't overwrite
> the compressed kernel during compression.

If I load the kernel to RAM address 0x80200000, is this a virtual address or
physical address at this time? Since my RAM can not be so large, I guess
this is virtual address,right? Should I enable MMU in my board
initializations?


Thank you once again.

machael
