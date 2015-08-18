Received: from mailapp01.imgtec.com ([195.59.15.196]:8845 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012310AbbHRM4MYiHU- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 18 Aug 2015 14:56:12 +0200
Date: Tue, 18 Aug 2015 13:56:05 +0100
From: Markos Chandras <markos.chandras@imgtec.com>
Subject: Re: [PATCH] MIPS: personality syscall discrepancy on mips64-o32/n32
Message-ID: <20150818125605.GA25978@mchandras-linux.le.imgtec.org>
References: <19CDB9880DBFC241860D925D8FAA94A00342EAB8@BADAG02.ba.imgtec.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <19CDB9880DBFC241860D925D8FAA94A00342EAB8@BADAG02.ba.imgtec.org>
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Nikola Veljkovic <Nikola.Veljkovic@imgtec.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, Chris Dearman <Chris.Dearman@imgtec.com>, Raghu Gandham <Raghu.Gandham@imgtec.com>, Miodrag Dinic <Miodrag.Dinic@imgtec.com>, Petar Jovanovic <Petar.Jovanovic@imgtec.com>, Lazar Trsic <Lazar.Trsic@imgtec.com>

On Tue, Aug 18, 2015 at 10:25:31AM +0000, Nikola Veljkovic wrote:
> There is a discrepancy in the personality() syscall on mips64.
> 
> For a 32bit process (o32 or n32) sys_32_personality() [1] is called, which
> converts PER_LINUX32 -> PER_LINUX:
> 
> ret = sys_personality(p);
> if (ret != -1 && (ret & PER_MASK) == PER_LINUX32)  // personality macro applied
>    ret = (ret & ~PER_MASK) | PER_LINUX;            // to make it clearer
> 
> This is different than what Intel and ARM are doing. They directly invoke
> sys_personality(). On Android, this causes a bionic test to fail for mips, as it
> expects PER_LINUX32 but receives PER_LINUX, when ran on mips64 core.
> 
> The code itself comes from older kernel versions (2.4), where it was also used
> by other architectures [2], [3], [4]. However, since kernel 2.6 other archs are
> invoking sys_personality() directly, for all ABIs.
> 
> Is there any reason why we should do PER_LINUX32 -> PER_LINUX on mips? Also, if
> we do change this for o32, should we change it for n32, as well? There is no n32
> support for Android, so it would have to be tested elsewhere.
> 
> Tested changing only o32 on Android, there were no regressions:
> 
> diff --git a/arch/mips/kernel/scall64-o32.S b/arch/mips/kernel/scall64-o32.S
> index ab93427..b94ee4e 100644
> --- a/arch/mips/kernel/scall64-o32.S
> +++ b/arch/mips/kernel/scall64-o32.S
> @@ -358,7 +358,7 @@ sys_call_table:
>         sys     sys_fchdir              1
>         sys     sys_bdflush             2
>         sys     sys_sysfs               3       /* 4135 */
> -       sys     sys_32_personality      1
> +       sys     sys_personality         1
>         sys     sys_ni_syscall          0       /* for afs_syscall */
>         sys     sys_setfsuid            1
>         sys     sys_setfsgid            1
> --
> 
> [1] http://git.linux-mips.org/cgit/ralf/linux.git/tree/arch/mips/kernel/linux32.c#n122
> [2] http://git.linux-mips.org/cgit/ralf/linux.git/tree/include/asm-mips64/elf.h?h=linux-2.4#n124
> [3] http://git.linux-mips.org/cgit/ralf/linux.git/tree/arch/x86_64/ia32/sys_ia32.c?h=linux-2.4#n1974
> [4] http://git.linux-mips.org/cgit/ralf/linux.git/tree/arch/ia64/ia32/sys_ia32.c?h=linux-2.4#n4005
> --
> Nikola Veljkovic

Hi,

I am not sure what the implication will be to userland with that change...

I presume you also need to fix the n32 case and then completely remove the sys_32_personality
syscall from linux32.c. Moreover, I think you also need to fix the arch/mips/include/asm/elf.h
code to set LINUX32 for O32 and n32 (for both 32b and 64b kernels.)

If you are going to submit a new patch, can you please create a proper git patch
(using git format-patch) and include your Signed-off-by line as well? Thank you

-- 
markos
