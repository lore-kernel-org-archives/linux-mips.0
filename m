Received: from mailapp01.imgtec.com ([195.59.15.196]:15313 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013082AbbESVNtoJPOW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 19 May 2015 23:13:49 +0200
Subject: [PATCH 0/2] MIPS: MSA: bugfixes of context switch
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Date: Tue, 19 May 2015 14:13:42 -0700
Message-ID: <20150519211222.35859.52798.stgit@ubuntu-yegoshin>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, rusty@rustcorp.com.au, alexinbeijing@gmail.com, paul.burton@imgtec.com, david.daney@cavium.com, alex@alex-smith.me.uk, linux-kernel@vger.kernel.org, ralf@linux-mips.org, james.hogan@imgtec.com, markos.chandras@imgtec.com, macro@linux-mips.org, eunb.song@samsung.com, manuel.lauss@gmail.com, andreas.herrmann@caviumnetworks.com
Message-ID: <20150519211342.T37IW9LSa6D1WMPG5DquKD4eso9CLschsrXLSHXgaOM@z>

Two bug fixes of MSA registers set handling during context switch.

This fixes are respones to multithreading MSA application crash.
It was traced to incorrect handling of MSA registers set during
thread cloning. See inside.
---

Leonid Yegoshin (2):
      MIPS: MSA: bugfix - disable MSA during thread switch correctly
      MIPS: MSA: bugfix of keeping MSA live context through clone or fork


 arch/mips/include/asm/switch_to.h |    1 -
 arch/mips/kernel/process.c        |    1 -
 arch/mips/kernel/r4k_switch.S     |    6 ++++++
 3 files changed, 6 insertions(+), 2 deletions(-)

--
Signature
