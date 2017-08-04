Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:60730 "EHLO
        ste-ftg-msa2.bahnhof.se" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23995079AbdHDNpzSY8WP convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 4 Aug 2017 15:45:55 +0200
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: Update PS2 R5900 to kernel 4.x?
From: Fredrik Noring <noring@nocrew.org>
In-Reply-To: <b0356404-42b6-6e8b-e15b-57cf98b7d6e6@gentoo.org>
Date: Fri, 4 Aug 2017 15:45:41 +0200
Content-Transfer-Encoding: 8BIT
Message-ID: <2CA3040B-8EB9-456C-A4DE-BFE0D097971C@nocrew.org>
References: <A4F10467-06DE-4880-B740-10B32CAC9208@nocrew.org>
 <0d0fdd50-929f-da92-dd35-88f2878da8c2@gentoo.org>
 <64C2A7A5-46FD-406C-9B51-5F45AEBA70F0@nocrew.org>
 <b0356404-42b6-6e8b-e15b-57cf98b7d6e6@gentoo.org>
Return-Path: <noring@nocrew.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Joshua Kinard <kumba@gentoo.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20170804134541.WO0ihcm1YF54Abc07DyAPJom7Dells3cdxtYlDXpLIg@z>


> 4 aug. 2017 kl. 04:04 skrev Joshua Kinard <kumba@gentoo.org>:
> 
> Am not knowledgeable here, unfortunately.  If you have a Oops report and can
> trace through a debugger and look at the underlying asm, that might highlight
> something.  I've not had a lot of luck doing that on my SGI systems though.

Applying v3.9-rc1 commit 64b3122d gives this memory fault crash:

    [...]
    rtc-ps2 rtc-ps2: hctosys: unable to read the hardware clock
    RAMDISK: gzip image found at block 0
    VFS: Mounted root (ext2 filesystem) readonly on device 1:0.
    devtmpfs: mounted
    Freeing unused kernel memory: 248k freed
    Memory fault
    Memory fault
    Memory fault
    [repeats ~30 times]
    Memory fault
    Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000ff00

The parent commit boots to Busybox without (apparent) problems. Commit 64b3122d
is small and I've also tried to apply the child commit 50150d2bb9 "mips: switch
to generic sys_fork() and sys_clone()" which is related (perhaps required), but
the crash persists.

A question is whether there is a problem with commit 64b3122d itself, e.g. the
handling of MIPS register 29, perhaps in the patched R5900 assembly, or
whether the commit depends on some previous change that hasn't been updated in
the R5900 patch, e.g. the system calls in arch/mips/kernel/scall32-n32.S which
(originally) seems to be a modified version of arch/mips/kernel/scall64-n32.S.
Several previous changes by Al Viro switch to generic system calls:

    git log --author=viro v3.8..v3.9 arch/mips/kernel

I'm not quite sure how these changes would apply to the R5900 patch. That's
where I'm stuck at the moment. I'm trying to figure out what is causing the
memory fault. Are there any kernel parameters that would be helpful for
debugging this?

> Could be doable.  I forget, was PS2 big -endian or little-endian?  I primarily
> work with big-endian these days due to my SGI systems.  I've got recent stage
> builds at several different ABI/ISA combos and even a working netboot
> filesystem.  Haven't had time to get kernels rolled yet (IP27 always spoils the
> fun).

Great! R5900 hardware is endian configurable according to the Toshiba manual

    http://www.lukasz.dk/files/tx79architecture.pdf

and the PS2 R5900 patch is little-endian which is probably simplest to start
with for interoperability with its BIOS etc.

> I have one of the PS2 debug machines in a closet somewhere.  Basically a normal
> PS2 with 4x RAM and says "TEST" on the side in the PS2 font.  Can't remember if
> it still works or not.

Why not give it a try? :) Linux on the PS2 works without a dvd. A simple setup
is a PS2 memory card (for the boot loader) and a usb memory (for the kernel and
a root file system). Later PS2 models have built-in ethernet.

> And it's insanely way out of date for modern Gentoo (by ~14 years), but I keep
> an archive of the original attempt to run Gentoo on a PS2 from ~2003 here:
> http://dev.gentoo.org/~kumba/mips/ps2/gentoo-ps2/
> 
> The "ps2dev.diff.bz2" patch might be of interest, as it has the changes for the
> toolchain in it.

Thanks!

Fredrik
