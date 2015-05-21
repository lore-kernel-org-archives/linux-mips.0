Received: from mailapp01.imgtec.com ([195.59.15.196]:49575 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013586AbbEVACwfBzK0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 22 May 2015 02:02:52 +0200
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: [PATCH 5/9] clk: pistachio: Add a MUX_F macro to pass clk_flags
Date: Thu, 21 May 2015 20:57:39 -0300
Message-ID: <1432252663-31318-6-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1432252663-31318-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1432252663-31318-1-git-send-email-ezequiel.garcia@imgtec.com>
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
Message-ID: <20150521235739.e55vw3ud4ZFDRA7phXCLiRqcVLfswYn58Xz-UMd9wXY@z>

As preparation work to support MIPS PLL rate change propagation, this
commit adds a MUX_F macro to pass clk_flags.

Signed-off-by: Govindraj Raja <Govindraj.Raja@imgtec.com>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 drivers/clk/pistachio/clk.c |  2 +-
 drivers/clk/pistachio/clk.h | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/pistachio/clk.c b/drivers/clk/pistachio/clk.c
index 380879b..c9228e3 100644
--- a/drivers/clk/pistachio/clk.c
+++ b/drivers/clk/pistachio/clk.c
@@ -82,7 +82,7 @@ void pistachio_clk_register_mux(struct pistachio_clk_provider *p,
 	for (i = 0; i < num; i++) {
 		clk = clk_register_mux(NULL, mux[i].name, mux[i].parents,
 				       mux[i].num_parents,
-				       CLK_SET_RATE_NO_REPARENT,
+				       mux[i].clk_flags,
 				       p->base + mux[i].reg, mux[i].shift,
 				       get_count_order(mux[i].num_parents),
 				       0, NULL);
diff --git a/drivers/clk/pistachio/clk.h b/drivers/clk/pistachio/clk.h
index 1589227..3bb6bbe 100644
--- a/drivers/clk/pistachio/clk.h
+++ b/drivers/clk/pistachio/clk.h
@@ -32,6 +32,7 @@ struct pistachio_mux {
 	unsigned int id;
 	unsigned long reg;
 	unsigned int shift;
+	unsigned int clk_flags;
 	unsigned int num_parents;
 	const char *name;
 	const char **parents;
@@ -44,11 +45,22 @@ struct pistachio_mux {
 		.id		= _id,				\
 		.reg		= _reg,				\
 		.shift		= _shift,			\
+		.clk_flags      = CLK_SET_RATE_NO_REPARENT,     \
 		.name		= _name,			\
 		.parents	= _pnames,			\
 		.num_parents	= ARRAY_SIZE(_pnames)		\
 	}
 
+#define MUX_F(_id, _name, _pnames, _reg, _shift, _clkf)		\
+{                                                               \
+	.id             = _id,                                  \
+	.reg            = _reg,                                 \
+	.shift          = _shift,                               \
+	.name           = _name,                                \
+	.parents        = _pnames,                              \
+	.num_parents    = ARRAY_SIZE(_pnames),                  \
+	.clk_flags      = _clkf,				\
+}
 
 struct pistachio_div {
 	unsigned int id;
-- 
2.3.3
