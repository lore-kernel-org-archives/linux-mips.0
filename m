Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:5250 "EHLO
        mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6870574AbaAJUf1spAyb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jan 2014 21:35:27 +0100
From: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH 0/3] MIPS: L1_CACHE_SHIFT updates
Date: Fri, 10 Jan 2014 12:35:11 -0800
Message-ID: <1389386114-31834-1-git-send-email-florian@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <florian@openwrt.org>
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
Cc: ralf@linux-mips.org, blogic@openwrt.org, jogo@openwrt.org, mbizon@freebox.fr, cernekee@gmail.com, dgcbueu@gmail.com, Florian Fainelli <florian@openwrt.org>
Message-ID: <20140110203511.hE99MDEfZQGUH2FEvngW_5hRfRf9pF5-J94jZh28CgY@z>

Ralf, John,

This patchset cleanups the MIPS_L1_CACHE_SHIFT values and also fixes it
for Broadcom BCM63xx DSL SOCs.

Thanks!

Florian Fainelli (3):
  MIPS: introduce MIPS_L1_CACHE_SHIFT_<N>
  MIPS: update MIPS_L1_CACHE_SHIFT based on MIPS_L1_CACHE_SHIFT_<N>
  MIPS: BCM63XX: select correct MIPS_L1_CACHE_SHIFT value

 arch/mips/Kconfig              | 27 +++++++++++++++++++++++----
 arch/mips/pmcs-msp71xx/Kconfig |  1 +
 arch/mips/ralink/Kconfig       |  1 +
 3 files changed, 25 insertions(+), 4 deletions(-)

-- 
1.8.3.2
