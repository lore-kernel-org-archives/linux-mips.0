Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:29996 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23990686AbdBFUYokY9xc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 6 Feb 2017 21:24:44 +0100
From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [RFC] mips: ath79: clock:- Unmap region obtained by of_iomap
Message-ID: <5fac1423-00e9-e5b2-161d-5ddc2f47bfc9@wanadoo.fr>
Date: Mon, 6 Feb 2017 21:24:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <christophe.jaillet@wanadoo.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: antonynpavlov@gmail.comantonynpavlov@gmail.com, albeu@free.fr, hackpascal@gmail.com, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-mips@linux-mips.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kernel Janitors <kernel-janitors@vger.kernel.org>
Message-ID: <20170206202435.5T4oLrZl5aaV574WHeSb8FezWKDm6klaHEppFt5-0jU@z>

Hi,

I had a patch similar to:

https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/arch/mips/ath79/clock.c?id=b3d91db3f71d5f70ea60d900425a3f96aeb3d065

in my own tree.

However, mine was slightly different and was also freeing the memory 
mapping in the normal case, when 'pll_base' seems to be no more useful.

Best regards,

CJ

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index c1102cffe37d..b5d81acb2d7a 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -508,9 +508,11 @@ static void __init ath79_clocks_init_dt_ng(struct 
device_node *np)
          ar9330_clk_init(ref_clk, pll_base);
      else {
          pr_err("%s: could not find any appropriate clk_init()\n", dnfn);
-        goto err_clk;
+        goto err_unmap;
      }

+    iounmap(pll_base);
+
      if (of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data)) {
          pr_err("%s: could not register clk provider\n", dnfn);
          goto err_clk;
@@ -518,6 +520,8 @@ static void __init ath79_clocks_init_dt_ng(struct 
device_node *np)

      return;

+err_unmap:
+    iounmap(pll_base);
  err_clk:
      clk_put(ref_clk);
