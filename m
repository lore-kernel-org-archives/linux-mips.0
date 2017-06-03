Received: from mail-pg0-x242.google.com ([IPv6:2607:f8b0:400e:c05::242]:33194
        "EHLO mail-pg0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990506AbdFCCSN5XVUu (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 3 Jun 2017 04:18:13 +0200
Received: by mail-pg0-x242.google.com with SMTP id s62so3449274pgc.0
        for <linux-mips@linux-mips.org>; Fri, 02 Jun 2017 19:18:13 -0700 (PDT)
Date: Fri, 02 Jun 2017 19:18:07 -0700 (PDT)
From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 1/7] lib: Add shared copies of some GCC library routines
In-Reply-To: <4448bb28-fa2f-3a4c-753e-46bc4c3815a3@imgtec.com>
Message-ID: <mhng-30ac217d-aaf3-47bd-bfe7-cc86e4660f58@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Return-Path: <palmer@dabbelt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: matt.redfearn@imgtec.com
Cc: monstr@monstr.eu, ralf@linux-mips.org, liqin.linux@gmail.com, lennox.wu@gmail.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Message-ID: <20170603021807.ExuX9NDapUlvgBZwI6ntZ7tVuj00DSrx7hUw7MHplBk@z>

On Wed, 24 May 2017 01:52:13 PDT (-0700), matt.redfearn@imgtec.com wrote:
> Hi Palmer
>
>
> On 23/05/17 23:05, Palmer Dabbelt wrote:
>> Many ports (m32r, microblaze, mips, parisc, score, and sparc) use
>> functionally identical copies of various GCC library routine files,
>> which came up as we were submitting the RISC-V port (which also uses
>> some of these).
>>
>> This patch adds a new copy of these library routine files, which are
>> functionally identical to the various other copies.  These are
>> availiable via Kconfig as CONFIG_LIB_$ROUTINE, which currently isn't
>> used anywhere.
>
> Note that, on MIPS, we had to mark the compiler intrinsics as notrace
> (see commit aedcfbe06558a9f53002e82d5be64c6c94687726) because if the
> compiler requires the intrinsic in the ftrace path, it then tries to
> trace itself leading to infinite recursion and stack overflow. So I'd
> suggest you mark the generic versions notrace as well.

Sorry, I didn't notice that.  I got a bit swamped responding to the RISC-V
port's code reviews, but assuming nobody has merged any of this I'll submit a
v2 patch set that fixes this (and some other errors I believe I introduced)
once I get through all my email.

Thanks!
