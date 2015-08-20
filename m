Received: from mailapp01.imgtec.com ([195.59.15.196]:35476 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012396AbbHTOqgc3pN4 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Aug 2015 16:46:36 +0200
From: Nikola Veljkovic <Nikola.Veljkovic@imgtec.com>
Subject: RE: [PATCH] MIPS: personality syscall discrepancy on mips64-o32/n32
Date: Thu, 20 Aug 2015 14:46:26 +0000
Message-ID: <19CDB9880DBFC241860D925D8FAA94A00342F48A@BADAG02.ba.imgtec.org>
References: <19CDB9880DBFC241860D925D8FAA94A00342EAB8@BADAG02.ba.imgtec.org>,<20150818125605.GA25978@mchandras-linux.le.imgtec.org>
In-Reply-To: <20150818125605.GA25978@mchandras-linux.le.imgtec.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Nikola.Veljkovic@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markos Chandras <Markos.Chandras@imgtec.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, Chris Dearman <Chris.Dearman@imgtec.com>, Raghu Gandham <Raghu.Gandham@imgtec.com>, Miodrag Dinic <Miodrag.Dinic@imgtec.com>, Petar Jovanovic <Petar.Jovanovic@imgtec.com>, Lazar Trsic <Lazar.Trsic@imgtec.com>
Message-ID: <20150820144626.V92K1UVkjiDOr7_HaiGqA1rIQN1ao_Y2hA1e69gwfxM@z>

Hi,

 > I am not sure what the implication will be to userland with that change...
I could not find any code that explicitly checks for PER_LINUX[32]. Of course,
I might be missing something. Any suspects?

 > I presume you also need to fix the n32 case and then completely remove the 
 > sys_32_personality syscall from linux32.c. 
New patch below removes the syscall.

 > Moreover, I think you also need to fix the arch/mips/include/asm/elf.h
 > code to set LINUX32 for O32 and n32 (for both 32b and 64b kernels.)
Other archs (arm, intel) do not do that, so I think we should follow, and set 
PER_LINUX, but let userspace change this if it wants to. On the kernel side this
only affects uname. From the discussion [1] it seems like the right way to go.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2012-August/114506.html

 > If you are going to submit a new patch, can you please create a proper git patch
 > (using git format-patch) and include your Signed-off-by line as well? Thank you
If not obvious, my first post here, thanks for the tips.
------------------
