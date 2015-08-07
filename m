Received: from mailapp01.imgtec.com ([195.59.15.196]:26289 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012295AbbHGQU52NnVx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Aug 2015 18:20:57 +0200
From: Govindraj Raja <govindraj.raja@imgtec.com>
Subject: [PATCH v2 0/4] clk: pistachio: Fixes for pll calculations.
Date: Fri, 7 Aug 2015 17:20:09 +0100
Message-ID: <1438964413-18876-1-git-send-email-govindraj.raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Govindraj.Raja@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Zdenko Pulitika <zdenko.pulitika@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Govindraj Raja <govindraj.raja@imgtec.com>
Message-ID: <20150807162009.41lUbiu0_tuNcjt1P1fiA29_kyR4ACpWoxNNO-wb6Zw@z>

Patch 1/4 to 3/4 are pll calculation fixes for clock settings.

Patch 4/4: Is a reword and repost based on earlier thread:
http://patchwork.linux-mips.org/patch/10108/

Series Based on 4.2-rc5
Tested with Pistachio Bring-up-Board.

Changes from v1:
---------------
Fix comments from Andrew.
Topics:

* http://patchwork.linux-mips.org/patch/10888/
  (Remove long conversion for pll_rate_table variables)
	
* http://patchwork.linux-mips.org/patch/10889/
  (reword pll to PLL)

* http://patchwork.linux-mips.org/patch/10891/
  (squash 4/6 to 3/6)

* http://patchwork.linux-mips.org/patch/10892/
  (squash 5/6 to 3/6) 

* http://patchwork.linux-mips.org/patch/10893/
  (Add missing signed-off)


Damien.Horsley (1):
  clk: pistachio: correct critical clock list

Zdenko Pulitika (3):
  clk: pistachio: Fix 32bit integer overflows
  clk: pistachio: Fix override of clk-pll settings from boot loader
  clk: pistachio: Fix PLL rate calculation in integer mode

 drivers/clk/pistachio/clk-pistachio.c | 19 ++++++---
 drivers/clk/pistachio/clk-pll.c       | 75 ++++++++++++++++++++++++++---------
 2 files changed, 71 insertions(+), 23 deletions(-)

-- 
1.9.1
