Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E4E50EBFC;
	Thu,  1 Oct 2026 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871222; cv=none; b=L9e6AQLyi/sp+cHcfSY5FK/qWSmE8DINoDxQuFTatc3L6iRNeizWSWTMlSGC3tk9BATnIvyhC4TJV16mxqRDRhaqxpAJ8OLlLd0hZi8gDivVcsKpYy0ex97WKjc2IYNgI6KRng+fS4sz6gjAhNWldTjw7XahftQPap5L8pwTT50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871222; c=relaxed/simple;
	bh=W/vR5+EzveJN9ZZEMEG4my32nfhkos+q9FVeoPuxxNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=as6C1zgypfOE7Rn3HKZg2sJxRZxm4E7uBujgoRBBFGOzR4fx/ou0kZhhFfgyCJVd2/lEayXLgx1M0W+5/5dskIMa5DZGWuW1mNHQnlIxeW8bwcAIgfQAA9h1qWLd/c3Vv4FTWmcKPlfzZ/1zMTYsXuZW3sE6/EBGxuxHET8/JW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NG1WoSyw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NG1WoSyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC5E1F00898;
	Thu,  1 Oct 2026 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871220;
	bh=Pk59Y38lHd1p9TKvGGt4XVnubn9JB0UvV5JrmUu1oCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NG1WoSywCLL9+7DP6Af2AKf8C7SxbPkOlX9gxEoVXigBZb3Q0TOnBXjJNMCIZhb4k
	 I1/OKDjC6/nQo6ZklTMDfra1v71XfJKzgk1+iNXkgaJCpxcM9ZYVwAC+TcXNdRG3xB
	 TmFlozExhSGRPEetj4bTm92SGozRlW297Zt7YSWu03qrcl4Wd93XKHkpClB5NpK1ut
	 y07cJYpH4vqFuetIjRHd6tTtugQhaxPKBQuboppoo5KI3VKYH4oQz60PP+Zt/eUN+L
	 eEvs+PzzHVcsTBThr7OSIkdHUKvy0dpZ1avKH1bsLysVPZaKM/M0vpbzeFOCRfD9AA
	 9kaB7SJlYJyIg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/38] MIPS: SGI-IP27: put a Bedrock hub's boot CPU in slot 0
Date: Thu,  1 Oct 2026 18:11:45 +0200
Message-ID: <83610535fa4ce658f99cb36c3bbd8023abf4b382.1790857966.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790857966.git.kaloz@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ip27_smp_setup() takes CPU 0 to be the boot CPU. On a Bedrock hub, find
the boot CPU's sn_cpu_info[] entry by its nasid and PI_CPU_NUM slice and
swap it into slot 0. The PROM's virtids, which set the possible mask, run
densely from 0 in board-list order and so match the table's slots.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-smp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 62733e049570..159dbd6ddda8 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -80,6 +80,15 @@ void cpu_node_probe(void)
 		highest = node_scan_cpus(nasid, highest);
 	}
 
+	/* The boot CPU must be CPU 0 wherever the board list puts it. */
+	for (i = 1; system_is_ip35 && i <= highest; i++) {
+		if (cputonasid(i) == master_nasid &&
+		    cputoslice(i) == LOCAL_HUB_L(PI_CPU_NUM)) {
+			swap(sn_cpu_info[0], sn_cpu_info[i]);
+			break;
+		}
+	}
+
 	printk("Discovered %d cpus on %d nodes\n", highest + 1, num_online_nodes());
 }
 
-- 
2.47.3

