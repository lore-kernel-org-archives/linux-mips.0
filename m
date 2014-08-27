Received: from mailapp01.imgtec.com ([195.59.15.196]:62292 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007029AbaH0OE6xN2kB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 27 Aug 2014 16:04:58 +0200
Message-ID: <53FDE583.9060908@imgtec.com>
Date: Wed, 27 Aug 2014 15:04:51 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: [request for stable inclusion] MIPS fixes for 3.16
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
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
To: stable@vger.kernel.org
Cc: linux-mips@linux-mips.org
Message-ID: <20140827140451.dm03RXpcxzR3W-43wZKqj4m_XdABFJYWLUZgRQYsj_E@z>

Hi Greg,

Could you please apply the following patches to the 3.16.X stable kernels?

- MIPS: EVA: Add new EVA header
(f85b71ceabb9d8d8a9e34b045b5c43ffde3623b3)
- MIPS: Malta: EVA: Rename 'eva_entry' to 'platform_eva_init'
(ca4d24f7954f3746742ba350c2276ff777f21173)
- MIPS: CPS: Initialize EVA before bringing up VPEs from secondary cores
(6521d9a436a62e83ce57d6be6e5484e1098c1380)
- MIPS: scall64-o32: Fix indirect syscall detection
(5245689900804604fdc349c8d9b8985b0e401ae2)
- MIPS: syscall: Fix AUDIT value for O32 processes on MIPS64
(40381529f84c4cda3bd2d20cab6a707508856b21)
- MIPS: Malta: Improve system memory detection for '{e, }memsize' >= 2G
(64615682658373516863b5b5971ff1d922d0ae7b)

Thank you!

-- 
markos
