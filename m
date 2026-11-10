Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281789;
	b=3G+sZLw44+RjYB4QxLbiZt6B1Wy8g0ELfj0liox8WgfkAPSWVhiL4OuSvfW9nusIfteF
	 8/hYAvGvm9jUnC+RJj0QZOMoE2yb+nKYB/RvUAySGXIImLB37+WgZvX/OmufczZDf52ef
	 gZ6Lms8kJzDI1i/d7R8CmVqJnlLFB6wHldZKghG/uKEM4vWMHjEXRHaelYE4+WfD+6FGL
	 fh8e27AkeDpDXs2AwdKHMYBMM0Xq8CbfcmwfX+gG6w90LrBtkHJoJ0N12JSigNH4R69Jy
	 US4PNlTeiqo4Jv0CxCQauPi3uJZmHTFe2mDwqubZn5+BUcRjwbDYC34Bwmtr5Ak6f1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281789;
	h=DMARC-Filter:DKIM-Signature:Date:Message-Id:X-Original-From:Received:
	 X-Mailer:Mime-Version:X-Change-Id:Content-Transfer-Encoding:
	 X-B4-Tracking:Cc:To:From:Subject:Content-Type:X-Lms-Return-Path;
	bh=MdV1iw1oXPABltdcxTTrq3FhwCi0ueZwwK+wh2OJ4xs=;
	b=MEXVFL18af27YY9y9ttVfGwDWwPDazp2J43XU+QCoX//BkxhwwAuJFP23+T87N5z4TGO
	 clhpij7AA0MZtWU1gteBE04OPZIBAs1/WZo2Scll7hJsYuQBA4x0qhdZmbUhDvZR2ZhCa
	 eZvoLPYRvX05TwoRQ3gjQLFZPTsc9essvW5ej28WSrDASs5S7oO0vSu1oR4jqrCHtS07j
	 9gpqrfkjgpY4dHtw+0eYhdIV9/0YJukaq5u1ZTjF3+odFejNDoo3xKEoFksAKuT0iTnxu
	 kvwYeYZj7/ABuhw3Ob1J4mcus59ZldzcL5PO8QIAifHjzlc1xZcW4oQtIrpL+T2R/Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=aSoarAY1;
	arc=none smtp.remote-ip=209.127.231.48
Received: from va-2-48.ptr.blmpb.com (va-2-48.ptr.blmpb.com [209.127.231.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D3A606A321
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 03:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D3A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=aSoarAY1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794281781;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=MdV1iw1oXPABltdcxTTrq3FhwCi0ueZwwK+wh2OJ4xs=;
 b=aSoarAY1N7nykvD0mvVJXBEGXim0UVefv5YiJ0tT8jiK0LUvO8mDvp7KFMoeM4STG8ynbZ
 wKghSO7RUu5obEW1B4dURcHApQK42SmyA83i1A7P3HV/06ZVbdY/sHavhgXtCjz4gIM3sY
 CW7n40bv1e8lVxgFRxuDrfq5bfR0wsVPu9OSFk9SqUeVtmeayLlAdQp6EV+z1uQbwGFV+3
 Z89ad9xngujbFOucrEuBRj58u4pMMxPG7hVx5zkdWNXdOXvkHS3f1dmFV+NpgQsMW0vXi6
 /IuZ0vBvLRLXURRMNY/tRPWnpoEGX897DpFAIa/h93nMvD6YhlB10z3X7fWpew==
Date: Tue, 10 Nov 2026 11:36:01 +0800
Message-Id: <20261110-mips-ntlb-only-vtlb-v1-1-41a40980f072@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Received: from [127.0.1.1] ([1.192.71.23]) by smtp.feishu.cn with ESMTPS; Tue, 10 Nov 2026 11:36:18 +0800
X-Mailer: b4 0.17-dev-ce4c1
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Change-Id: f0ec6aac-mips-ntlb-only-vtlb-e1d248e397f7
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMBCE4Vche3YTECPiqxgOpUxhDRTSBaIhv LtFbvMd5t9IEQRKz2SjgFVURh+RXRKynfEtWJpocins3RjLg0zKfu5rHn3/5fVYyJrr7YG8LFx B8TkFOPn8q6/qtC71G3Y+UrTvP0RzGpx3AAAA
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, 
	"Markos Chandras" <markos.chandras@imgtec.com>, 
	"Paul Burton" <paulburton@kernel.org>, "John Crispin" <john@phrozen.org>, 
	"Leonid Yegoshin" <Leonid.Yegoshin@imgtec.com>, 
	"James Hogan" <jhogan@kernel.org>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH] MIPS: tlb-r4k: Only apply 'ntlb' option to VTLB
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26af29133+2a7ce6+vger.kernel.org+rongrong@oss.cipunited.com>

FTLB entries cannot be wired and thus are inapplicable to the 'ntlb'
option.

Print a notice message when FTLB is enabled, and ignore any ntlb value
larger than the size of VTLB.

Fixes: 75b5b5e0a262 ("MIPS: Add support for FTLBs")
Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/mm/tlb-r4k.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 78bafa317fa6..288fcfb8990a 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -839,8 +839,17 @@ void tlb_init(void)
 	r4k_tlb_configure();
 
 	if (ntlb) {
-		if (ntlb > 1 && ntlb <= current_cpu_data.tlbsize) {
-			int wired = current_cpu_data.tlbsize - ntlb;
+		int tlbsize = current_cpu_data.tlbsize;
+
+		/* Disabling FTLB will suppress the message. */
+		if (current_cpu_data.tlbsizeftlbways && current_cpu_data.tlbsizeftlbsets) {
+			pr_notice("FTLB is enabled. The 'ntlb' option will only apply to VTLB\n");
+			pr_notice("Consult 'noftlb' to disable FTLB when desired\n");
+			tlbsize = current_cpu_data.tlbsizevtlb;
+		}
+
+		if (ntlb > 1 && ntlb <= tlbsize) {
+			int wired = tlbsize - ntlb;
 			write_c0_wired(wired);
 			write_c0_index(wired-1);
 			printk("Restricting TLB to %d entries\n", ntlb);

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: f0ec6aac-mips-ntlb-only-vtlb-e1d248e397f7

Thanks,
Rong
