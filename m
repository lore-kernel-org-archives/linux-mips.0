Received: from nivc-ms1.auriga.com ([80.240.102.146]:36335 "EHLO
        nivc-ms1.auriga.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008504AbaLWM3emj5Mv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 23 Dec 2014 13:29:34 +0100
From: Aleksey Makarov <aleksey.makarov@auriga.com>
Subject: [PATCH 0/3] MIPS: OCTEON: flash: syncronize bootbus access
Date: Tue, 23 Dec 2014 15:26:58 +0300
Message-ID: <1419337623-16101-1-git-send-email-aleksey.makarov@auriga.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <aleksey.makarov@auriga.com>
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
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Aleksey Makarov <aleksey.makarov@auriga.com>
Message-ID: <20141223122658.wtgNexqUcYkpzNET1gleEOB-HZ0e2VhkGCDOc2wXzIQ@z>

- Use semaphore to protect access to bootbus.  
- Use device tree to probe for flash chips.

David Daney (3):
  MIPS: OCTEON: Add semaphore to serialize bootbus accesses.
  MIPS: OCTEON: Protect accesses to bootbus flash with
    octeon_bootbus_sem.
  MIPS: OCTEON: Use device tree to probe for flash chips.

 arch/mips/Kconfig                     |  1 +
 arch/mips/cavium-octeon/flash_setup.c | 84 ++++++++++++++++++++++++++++++++---
 arch/mips/cavium-octeon/setup.c       |  3 ++
 arch/mips/include/asm/octeon/octeon.h |  2 +
 4 files changed, 84 insertions(+), 6 deletions(-)

-- 
2.1.3
