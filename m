Received: from mail1.windriver.com ([147.11.146.13]:60704 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27025308AbcC0RBFd9Nkn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sun, 27 Mar 2016 19:01:05 +0200
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/2] scsi: remove orphaned modular code from non-modular drivers
Date: Sun, 27 Mar 2016 13:00:23 -0400
Message-ID: <1459098025-26269-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Paul.Gortmaker@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-m68k@vger.kernel.org, linux-mips@linux-mips.org, linux-scsi@vger.kernel.org
Message-ID: <20160327170023.CRCv9u16dYYKB2yVjir62700dhO5EZLYHpzNosznohI@z>

In the ongoing audit/cleanup of non-modular code needlessly using modular
infrastructure, the SCSI subsystem fortunately only contains two instances
that I detected.  Both are for legacy drivers that predate the git epoch,
so cleary there is no demand for converting these drivers to be tristate.

For anyone new to the underlying goal of this cleanup, we are trying to
not use module support for code that isn't buildable as a module since:

 (1) it is easy to accidentally write unused module_exit and remove code
 (2) it can be misleading when reading the source, thinking it can be
     modular when the Makefile and/or Kconfig prohibit it
 (3) it requires the include of the module.h header file which in turn
     includes nearly everything else, thus adding to CPP overhead.
 (4) it gets copied/replicated into other code and spreads like weeds.

Build tested for mips (jazz) and m68k (sun3x) on 4.6-rc1 to ensure no
silly typos crept in.

---

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@linux-mips.org
Cc: linux-scsi@vger.kernel.org

Paul Gortmaker (2):
  drivers/scsi: make jazz_esp.c driver explicitly non-modular
  drivers/scsi: make sun3x_esp.c driver explicitly non-modular

 drivers/scsi/jazz_esp.c  | 43 ++++++-------------------------------------
 drivers/scsi/sun3x_esp.c | 44 +++++---------------------------------------
 2 files changed, 11 insertions(+), 76 deletions(-)

-- 
2.6.1
