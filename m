Received: from mailapp01.imgtec.com ([195.59.15.196]:14310 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006702AbbEVABa7Bfxn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 May 2015 02:01:30 +0200
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH 0/9] clk: pistachio: Assorted changes
Date: Thu, 21 May 2015 20:57:34 -0300
Message-ID: <1432252663-31318-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <Ezequiel.Garcia@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, sboyd@codeaurora.org
Cc: Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, Govindraj.Raja@imgtec.com, Damien.Horsley@imgtec.com, cernekee@chromium.org, James Hogan <james.hogan@imgtec.com>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Message-ID: <20150521235734.0Umg9gTfAsGmycr_7mLYS4tsUh68ZC8GcVKFOJEPIuQ@z>

This patchset contains a bunch of clock changes for the Pistachio
clock driver.

The nine patches in this series are not really related, but I wasn't
sure it was worth to prepare a separate patchset for each group.
However, if this makes it harder to review, I can send different groups
of related patches.

Here's a brief summary of the patch groups:

Patches 1 and 2 clean up the PLL lock handling.

Patch 3 implements PLL rate adjustment, and in particular allows to support
small (i.e. neighbor-constrained) changes of the fractional PLL rate.

Patch 4 to 7 implements MIPS PLL rate change propagation and introduces
a table of MIPS PLL rate parameters.

Patch 8 adds some very useful sanity checks on integer and fractions PLL
set_rate(), to make sure the parameters are modified only when it's legal
to do so.

Patch 9 fixes the list of critical clocks.

None of these are urgent fixes so this is all v4.2 material.

Damien Horsley (1):
  clk: pistachio: Correct critical clock list

Ezequiel Garcia (7):
  clk: pistachio: Add a pll_lock() helper for clarity
  clk: pistachio: Lock the PLL when enabled upon rate change
  clk: pistachio: Implement PLL rate adjustment
  clk: pistachio: Extend DIV_F to pass clk_flags as well
  clk: pistachio: Add a MUX_F macro to pass clk_flags
  clk: pistachio: Propagate rate changes in the MIPS PLL clock sub-tree
  clk: pistachio: Add a rate table for the MIPS PLL

Kevin Cernekee (1):
  clk: pistachio: Add sanity checks on PLL configuration

 drivers/clk/pistachio/clk-pistachio.c |  63 ++++++++-----
 drivers/clk/pistachio/clk-pll.c       | 161 +++++++++++++++++++++++++++-------
 drivers/clk/pistachio/clk.c           |   5 +-
 drivers/clk/pistachio/clk.h           |  33 ++++++-
 4 files changed, 205 insertions(+), 57 deletions(-)

-- 
2.3.3
