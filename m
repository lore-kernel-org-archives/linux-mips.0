Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717325208C9;
	Tue, 13 Oct 2026 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897541; cv=none; b=nUKOwEoXGywiFTeNVyyc85G/9dv7JT+DfvPgsHDu06EKg2gTn9VoSSWJKofcv+HZU0bWguY46VfXXRwKnyO/oWWcXPN5aQi+jdlZ+U3NjpefaFsptmJg+JffbchP3qYLdwPvTtvF3LQkvPQuB7YDWhQJ59KPD5XwE2Y/k2UC6EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897541; c=relaxed/simple;
	bh=IL5pJrVeowNm7HB0gGdTKuMNOaYGJJg1aZf0ARtg5S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4Yu14y323yFq32Z25tlmXBVbCVWzl8DXh1Ak3oUNxICFJLsdB/VR7a4WcfDUq3Y4S0cVaK4gnumMxhhlii41XLz3MeL4PoukBfJOQOGHn2cQDGhSHFTnJmixArF1usW2kx+4LkIcbs+sXrtwGh4ilXNTO3ARoIE7zKEYBCXkwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5ASJmhP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5ASJmhP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8EA1F000FF;
	Tue, 13 Oct 2026 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897540;
	bh=nK7JyA5RsdIh4U/tvz6Lf7hRH416A/K/R6YPf9lAQ9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c5ASJmhPjLlo2T60iZ1VYLn4p1h987N15vMMEWwh57/hYp6RYuhFULG1qAm8zBdKu
	 PjoYFeLkBt9IygmXf+rja3tdfp/6YDFGnztpoZyhVSXKoE2Tc8qGvwQZGaOaMIWxVE
	 FtWBS7F4btc2BOmPsLx9HFQmbLj9qGuJZ20uHwEc6Kgyr3OPwFVHiOEiL5+SMOi+iW
	 bOQAUJRa7md5PgkT+CzV48BHRD8FnA7EiAr2Ao6o/SxWhjupvzukop0dAo+yzQBL9l
	 NyXGomeP34xcndr88rR/675ARXviPB8vwb4iqXgfoMm8Qyk96Akb1HwL2hgM5EUerE
	 rYUdFZ0Kn0aVQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 15/53] MIPS: SGI-IP27: put a Bedrock hub's boot CPU in slot 0
Date: Tue, 13 Oct 2026 15:16:35 +0200
Message-ID: <bc6fc655269f474b62c3094c4658d25da4c806b9.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ip27_smp_setup() takes CPU 0 to be the boot CPU. On a Bedrock hub, swap
the boot CPU's sn_cpu_info[] entry, found by nasid and PI_CPU_NUM slice,
into slot 0, and give slot 0 master_nasid. The PROM's virtids run
densely from 0 in board-list order and so match the table's slots.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-smp.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 62733e049570..d49766cffd12 100644
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
 
@@ -168,9 +177,9 @@ static void __init ip27_smp_setup(void)
 	replicate_kernel_text();
 
 	/*
-	 * PROM sets up system, that boot cpu is always first CPU on nasid 0
+	 * The boot CPU is CPU 0, on the node it booted from
 	 */
-	cputonasid(0) = 0;
+	cputonasid(0) = master_nasid;
 	cputoslice(0) = LOCAL_HUB_L(PI_CPU_NUM);
 }
 
-- 
2.47.3

