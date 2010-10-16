Received: from [69.28.251.93] ([69.28.251.93]:52877 "EHLO b32.net"
        rhost-flags-FAIL-FAIL-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491852Ab0JPVoX (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 16 Oct 2010 23:44:23 +0200
From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH resend 8/9] MIPS: Honor L2 bypass bit
Date: Sat, 16 Oct 2010 14:22:37 -0700
Message-ID: <a87064966b36ed9982d8cf05169c5524@localhost>
In-Reply-To: <17ebecce124618ddf83ec6fe8e526f93@localhost>
References: <17ebecce124618ddf83ec6fe8e526f93@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Return-Path: <cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20101016212237.m9KLyVi0fMXAeOSsYkXMDV6UqRgIl3GGlPlJATS2xtg@z>

If CP0 CONFIG2 bit 12 (L2B) is set, the L2 cache is disabled and
therefore Linux should not attempt to use it.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/mips/mm/sc-mips.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index 5ab5fa8..d072b25 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -79,6 +79,11 @@ static inline int __init mips_sc_probe(void)
 		return 0;
 
 	config2 = read_c0_config2();
+
+	/* bypass bit */
+	if (config2 & (1 << 12))
+		return 0;
+
 	tmp = (config2 >> 4) & 0x0f;
 	if (0 < tmp && tmp <= 7)
 		c->scache.linesz = 2 << tmp;
-- 
1.7.0.4
