Received: from mailapp01.imgtec.com ([195.59.15.196]:40443 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010210AbbGJPxExCUh1 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jul 2015 17:53:04 +0200
From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 0/2] Default platform MAAR implementation
Date: Fri, 10 Jul 2015 16:52:37 +0100
Message-ID: <1436543559-26886-1-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Burton@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20150710155237.3gilRTx6bDnvgQwLrksqvc-goVwJYme9r2iEVzxRyno@z>

The kernel has previously required platforms making use of MAARs (Memory
Accessibility Attribute Registers) to configure the MAARs in a
platform_maar_init function. This series provides a default/weak
implementation of that function which reuses the data platforms already
provide to the bootmem allocator, and switches Malta to use it. The
result is a reduction in the duplication of data provided by the
platform about the memory map, and a corresponding reduction in the
amount of code needed to support a platform.

Paul Burton (2):
  MIPS: mm: default platform_maar_init using bootmem data
  MIPS: malta: use generic platform_maar_init

 arch/mips/mm/init.c                | 36 ++++++++++++++++++++++++++++++++++--
 arch/mips/mti-malta/malta-memory.c | 25 -------------------------
 2 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.4.4
