Received: from david.siemens.com.cn ([194.138.202.53]:48004 "EHLO
	david.siemens.com.cn") by ftp.linux-mips.org with ESMTP
	id S20038965AbWLEDle convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 5 Dec 2006 03:41:34 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: The difference between mips*-gnu and mips*-linux when configure tool-chain
Date: Tue, 5 Dec 2006 11:41:12 +0800
Message-ID: <96E7D5519FC3D741BEE27AB88C7387970167840A@PEKW934A.cn001.siemens.net>
In-Reply-To: <20061203170514.GA11258@nevyn.them.org>
From: "Fu, He Wei PSE NKG" <hewei.fu@siemens.com>
Return-Path: <hewei.fu@siemens.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Daniel Jacobowitz <dan@debian.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20061205034112.KE_1-yJjBtXQykd3YJYFhObnsMiqYB34FEx5j3_NQck@z>

Thanks, sorry for I missed the mips*-elf for mips*-gnu.

I think that for ld,the difference between mips*-elf and mips*-linux
produces only some minor impact on the default ld script, for the
behavior of ld itself, it has not serious impact.Is it my understanding
correct?

But for bfd, does the difference of these two config-choice have impact
on the behavior of two different bfd-target? . 

-----Original Message-----
From: Daniel Jacobowitz [mailto:dan@debian.org] 
Sent: Monday, December 04, 2006 1:05 AM
To: Fu, He Wei PSE NKG
Cc: linux-mips@linux-mips.org
Subject: Re: The difference between mips*-gnu and mips*-linux when
configure tool-chain

On Sun, Dec 03, 2006 at 05:15:07PM +0800, Fu, He Wei PSE NKG wrote:
> Hello everyone.At the time of building tool-chain for mips machine,we
> can choose mips*-gnu or mips*-linux, I want to know what's the
> difference between them? The original idea is that mips*-gnu for
> developing firmware which has not OS-surport, and mips*-linux for
> developing software on Linux, but it is not suitable for firmware such
> as bootloaders.But now I think I'm not right,it seems that configure
> with mips*-linux suit for both linux and bootloader, and configure
with
> mips*-gnu means build for OS such as IRIX surport, I'm not very
> clearly,can anybody help me figour out the difference between them?

mips-gnu is the GNU system (the Hurd kernel).  mips-linux is used for
the kernel and userspace of a Linux system.  mips-elf is used for bare
metal targets without an OS.

You should be able to build a Linux bootloader using a mips-linux
compiler.

-- 
Daniel Jacobowitz
CodeSourcery
