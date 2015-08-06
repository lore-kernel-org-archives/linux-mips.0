Received: from mailapp01.imgtec.com ([195.59.15.196]:64618 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012169AbbHFNo0YlFXI (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 6 Aug 2015 15:44:26 +0200
From: Govindraj Raja <govindraj.raja@imgtec.com>
Subject: [PATCH 0/6] clk: pistachio: Fixes for pll calculations.
Date: Thu, 6 Aug 2015 14:43:28 +0100
Message-ID: <1438868614-7672-1-git-send-email-govindraj.raja@imgtec.com>
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
To: linux-mips@linux-mips.org, linux-clk@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Zdenko Pulitika <zdenko.pulitika@imgtec.com>, Kevin Cernekee <cernekee@chromium.org>, Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <James.Hartley@imgtec.com>, Govindraj Raja <Govindraj.Raja@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Govindraj Raja <govindraj.raja@imgtec.com>
Message-ID: <20150806134328.-72b9H-Y9HlBoIm_bDgTSS07IWCaNo9xXv7iKNvRjFI@z>

Patch 1/6 to 5/6 are pll calculation fixes for clock settings.

Patch 6/6: Is a reword and repost based on earlier thread:
http://patchwork.linux-mips.org/patch/10108/

Series Based on 4.2-rc5
Tested with Pistachio Bring-up-Board.

Damien.Horsley (1):
  clk: pistachio: correct critical clock list

Zdenko Pulitika (5):
  clk: pistachio: Fix 32bit integer overflows
  clk: pistachio: Fix override of clk-pll settings from boot loader
  clk: pistachio: Fix pll rate calculation in integer mode
  clk: pistachio: Set operating mode in .set_rate
  pistachio: pll: Fix vco calculation in .set_rate (fractional)

 drivers/clk/pistachio/clk-pistachio.c | 19 ++++++---
 drivers/clk/pistachio/clk-pll.c       | 75 ++++++++++++++++++++++++++---------
 drivers/clk/pistachio/clk.h           | 18 +++++----
 3 files changed, 82 insertions(+), 30 deletions(-)

-- 
1.9.1
