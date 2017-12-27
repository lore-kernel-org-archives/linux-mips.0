Received: from mx2.rt-rk.com ([89.216.37.149]:34431 "EHLO mail.rt-rk.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23990394AbdL0Oi26IzO4 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 27 Dec 2017 15:38:28 +0100
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Subject: [PATCH v3 0/2]  MIPS: Augment CPC support
Date: Wed, 27 Dec 2017 15:37:50 +0100
Message-Id: <1514385475-23921-1-git-send-email-aleksandar.markovic@rt-rk.com>
Return-Path: <aleksandar.markovic@rt-rk.com>
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
Cc: Aleksandar Markovic <aleksandar.markovic@mips.com>, Dengcheng Zhu <dengcheng.zhu@mips.com>, Douglas Leung <douglas.leung@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, James Hogan <james.hogan@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, Matt Redfearn <matt.redfearn@mips.com>, Miodrag Dinic <miodrag.dinic@mips.com>, Paul Burton <paul.burton@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Ralf Baechle <ralf@linux-mips.org>

From: Aleksandar Markovic <aleksandar.markovic@mips.com>

v2->v3:

    - changed documentation file location from
        devicetree/bindings/misc to devicetree/bindings/power
    - minor commit message improvements
    - rebased to the latest code

v1->v2:

    - corrected wording in commit messages and documentation text
    - expanded cover letter to better explain the context of proposed
        changes
    - rebased to the latest code

This series is based on two patches from the larger series submitted
some time ago (30 Aug 2016):

https://www.linux-mips.org/archives/linux-mips/2016-08/msg00456.html

Both patches deal with MIPS Cluster Power Controller (CPC) support.
More specifically, they add device tree related functionalities to
that support.

This functionality is needed for further development of kernel support
for generic-based MIPS platforms that must be DT-based and will at the
same time make more extensive use of CPC.

This series is reviewed by the original author of the above-mentioned
larger series:

Reviewed-by: Paul Burton <paul.burton@mips.com>

Paul Burton (2):
  dt-bindings: Document mti,mips-cpc binding
  MIPS: CPC: Map registers using DT in mips_cpc_default_phys_base()

 Documentation/devicetree/bindings/power/mti,mips-cpc.txt |  8 ++++++++
 arch/mips/kernel/mips-cpc.c                              | 13 +++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mti,mips-cpc.txt

-- 
2.7.4
