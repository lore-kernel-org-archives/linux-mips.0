Received: from mail-wy0-f177.google.com ([74.125.82.177]:50545 "EHLO
        mail-wy0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1490991Ab1AGRKG convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 7 Jan 2011 18:10:06 +0100
MIME-Version: 1.0
In-Reply-To: <4D2665CF.2080703@am.sony.com>
References: <4D2665CF.2080703@am.sony.com>
Date: Sat, 8 Jan 2011 01:03:36 +0800
Message-ID: <AANLkTimTYox05y2_O8Tt+Ox1XCBVUmL-jFjtWZrPjTj7@mail.gmail.com>
Subject: Re: [Celinux-dev] Proposal: fastboot parameter cache for Linux
From: wu zhangjin <wuzhangjin@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <wuzhangjin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Tim Bird <tim.bird@am.sony.com>
Cc: CE Linux Developers List <celinux-dev@tree.celinuxforum.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips <linux-mips@linux-mips.org>

Hi, Tim

This is really a wonderful idea, I have thought something similar
today, except caching the parameters in some place, we may be possible
to ask gcc to re-compile the kernel with these parameters(or we can
call them 'run time statistic data') and eliminate some of the
unnecessary branches and calling paths.

To record the persistent parameters at run-time, we may be possible to
mark those parameters as __runtime_fixed and put them into one section
__runtime_fixed_param, once running the kernel, those parameters can
be dumped out with a standard interface(/proc or /sys?), some of them
can be stored in some place and the others can be used to re-compile
the kernel.

For the persistent parameters, the variables marked as __read_mostly
can the candidates, but may be not most of them. so, this may need the
kernel developers carefully mark the variables as __runtime_fixed to
get better optimization.

For the re-compiling stuff, the MIPS specific cpu-feature-overrides.h
strategy is really a good example, lots of macros have been defined in
a common cpu-features.h, e.g.:

#ifndef current_cpu_type
#define current_cpu_type()      current_cpu_data.cputype
#endif

If no static definition of current_cpu_type defined in the board's
cpu-feature-overrides.h, the probed value will be used and the probing
is necessary, otherwise, the related branches and calling paths will
be optimized by the compiler. As a result, both of the boot time and
kernel image size will be saved.

Currently, in mainline linux-MIPS, this cpu-feature-overrides.h is
added by users manually, but why not provide an interface to dump them
out? yup, we can, I added a new kernel config and allow users to dump
the macros for cpu-feature-overrides.h automatically via the
traditional /proc/cpuinfo interface:
http://dev.lemote.com/cgit/linux-loongson-community.git/commit/?h=tiny36&id=56ab52376298dee38aeb27d065c1a20ef94739c3

But perhaps we can take one step ahead, that is we can mark more
run-time-persistent variables as __runtime_fixed(is this name okay?)
and dump them out, cache them for kernel to avoid probing or
re-compile the kernel with them for further optimization.

BTW, I will send a proposal about "Linux-Tiny for MIPS", I have
already done some work on it, that is:

http://dev.lemote.com/cgit/linux-loongson-community.git/log/?h=tiny36

I have forward ported most of the Linux-tiny patches from 2.6.23 to
2.6.36, has made --gc-sections -ffunction-sections -fdata-sections
work on MIPS, and also, some MIPS specific size & boot time reducing
methods has been applied: allow the software or hardware fpu support
be configurable, add more macros in cpu-features.h and allow the users
to dump out the macros and get a cpu-feature-overrides.h
automatically.  The next step is trying to make -fwhole-program -flto
work instead of the old -fwhole-program -combine(gcc doesn't work well
with __attribute__((externally_visible))).

Best Regards,
Wu Zhangjin

On Fri, Jan 7, 2011 at 9:01 AM, Tim Bird <tim.bird@am.sony.com> wrote:
> Fastboot parameter cache for Linux
>
> ; Summary: Fastboot parameter cache for Linux
>
> ; Proposer: Tim Bird
>
> == Description ==
> This proposal would be the creation and mainlining of a fastboot
> parameter cache for the Linux kernel.
>
> The purpose of this cache would be to store values which are
> detected in one boot of the Linux kernel, so they can be
> quickly accessed and used on subsequent boots of the kernel,
> to reduce kernel initialization time (specifically, to avoid
> unneeded probing for non-changing hardware.)
>
> The idea would be to provide an internal facility (API)
> inside the kernel that drivers could use to query for
> hardware parameters, prior to probing.  If a value is found,
> then the probe can be avoided.  If not, then probing is
> done as usual.  It would be important to have a very unintrusive and
> easy-to-use API for this.
>
> The mechanism would need to support a method of persistently storing
> the values for future kernel invocations (for example, by storing
> them in persistent memory, in a device tree, passing them on the
> kernel command line, or attaching them to the kernel boot image)
>
> This can be seen as a generalization of the way probing/autodetection
> is avoided by using a command line parameter for loops_per_jiffy.
>
> Andrew Murray proposed this under the name "boot cache", in August, 2010
> to the kernel mailing list.
>
> == Related work ==
> * See Andrew Murray's talk at ELC Europe 2010 - The Right Approach to Minimal Boot Times
> ** http://elinux.org/images/f/f7/RightApproachMinimalBootTimes.pdf
> * See [[Preset LPJ]] for a description of how preset loops_per_jiffy works
> * Andrew Murray's RFC and discussion on LKML:
> ** See https://lkml.org/lkml/2010/8/31/347
>
> == Scope ==
> The mechanism could probably be developed in 4 to 8 weeks.  Mainlining it
> might take 4 to 6 additional weeks.
>
> == Contractor Candidates ==
>
> == Comments ==
>
> [[Category:Project proposals 2011]]
>
> _______________________________________________
> Celinux-dev mailing list
> Celinux-dev@tree.celinuxforum.org
> http://tree.celinuxforum.org/mailman/listinfo/celinux-dev
>
