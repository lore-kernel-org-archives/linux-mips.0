Received: from mailapp01.imgtec.com ([195.59.15.196]:54603 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010933AbcBAA4cWVzOW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 1 Feb 2016 01:56:32 +0100
Date: Mon, 1 Feb 2016 00:52:28 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Differentiate between 32 and 64 bit ELF header
In-Reply-To: <1454074137-16334-1-git-send-email-daniel.wagner@bmw-carit.de>
Message-ID: <alpine.DEB.2.00.1602010038230.5958@tp.orcam.me.uk>
References: <1453992270-4688-1-git-send-email-daniel.wagner@bmw-carit.de> <1454074137-16334-1-git-send-email-daniel.wagner@bmw-carit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Daniel Wagner <daniel.wagner@bmw-carit.de>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160201005228.Rq288k0q4vutEicQzye7D7pCFFLvyY_kS9wGGqvpUEo@z>

On Fri, 29 Jan 2016, Daniel Wagner wrote:

> Depending on the configuration either the 32 or 64 bit version of
> elf_check_arch() is defined. parse_crash_elf32_headers() does
> some basic verification of the ELF header via elf_check_arch().
> parse_crash_elf64_headers() does it via vmcore_elf64_check_arch()
> which expands to the same elf_check_check().
> 
>    In file included from include/linux/elf.h:4:0,
>                     from fs/proc/vmcore.c:13:
>    fs/proc/vmcore.c: In function 'parse_crash_elf64_headers':
> >> arch/mips/include/asm/elf.h:228:23: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>      struct elfhdr *__h = (hdr);     \
>                           ^
>    include/linux/crash_dump.h:41:37: note: in expansion of macro 'elf_check_arch'
>     #define vmcore_elf64_check_arch(x) (elf_check_arch(x) || vmcore_elf_check_arch_cross(x))
>                                         ^
>    fs/proc/vmcore.c:1015:4: note: in expansion of macro 'vmcore_elf64_check_arch'
>       !vmcore_elf64_check_arch(&ehdr) ||
>        ^
> 
> Since the MIPS ELF header for 32 bit and 64 bit differ we need
> to check accordingly.

 I fail to see how it can work as it stands given that `elf_check_arch' is 
called from the same source file both on a pointer to `Elf32_Ehdr' and one 
to `Elf64_Ehdr'.  However the MIPS implementations of `elf_check_arch' 
only use an auxiliary variable to avoid multiple evaluation of a macro 
argument and therefore instead I recommend the use of the usual approach
taken in such a situation within a statement expression, that is to 
declare the variable with `typeof' rather than an explicit type.  As an
upside this will minimise code disruption as well.

 For consistency I suggest making the same change to the `elf_check_arch' 
definitions in arch/mips/kernel/binfmt_elf*.c as well.

  Maciej
