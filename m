Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:56845 "EHLO
        mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6859952AbaFRMfkwbMrW (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 18 Jun 2014 14:35:40 +0200
From: <ganesanr@broadcom.com>
Subject: [PATCH 0/3] XLR/XLS network driver update and fixes
Date: Wed, 18 Jun 2014 18:43:55 +0530
Message-ID: <cover.1403096668.git.ganesanr@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <ganesanr@broadcom.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: kristina.martsenko@gmail.com, gregkh@linuxfoundation.org
Cc: Ganesan Ramalingam <ganesanr@broadcom.com>, jchandra@broadcom.com, linux-mips@linux-mips.org, ralf@linux-mips.org, netdev@vger.kernel.org
Message-ID: <20140618131355.7Bg9-E3eDOpgyOKsr7kjSyUNWTOqMR2xYJNd-t2tiOk@z>

From: Ganesan Ramalingam <ganesanr@broadcom.com>

Patches has following changes:

 * Fixed compilation failure caused by change in COP2 API
 * SGMII PHY address calculation was wrong, fixed
 * Updated the driver to have single parent device for a XLR/XLS
   network block with multiple network devices under it
 * Fixed comment format

Ganesan Ramalingam (3):
  Staging: Fix compilation error
  Staging: PHY address calculation fix
  Staging: Move all the netdev under single parent device per
    controller

 drivers/staging/netlogic/TODO           |    1 -
 drivers/staging/netlogic/platform_net.c |  213 ++++++++++++----------
 drivers/staging/netlogic/platform_net.h |    7 +-
 drivers/staging/netlogic/xlr_net.c      |  301 +++++++++++++++++--------------
 drivers/staging/netlogic/xlr_net.h      |    8 +-
 5 files changed, 292 insertions(+), 238 deletions(-)

-- 
1.7.9.5
