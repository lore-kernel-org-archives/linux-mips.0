Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1C5293ED;
	Tue, 13 Oct 2026 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897601; cv=none; b=Ux1EP4lGtBcyQ/8xAYCZIsgBK3NVIfJ8H94yNU8OxZyl3xETPNAWv1BfE8CafyIYa9RxWlWaSjZOn2Oed2ckpu/RwViBPKu4C35VVJe1k2eEmKDQAktuWICCcML69XyApVa4aAZV0VoQQo5H3+WB5qrwIg0WkgSSx7ZwelNaQAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897601; c=relaxed/simple;
	bh=NtdDOGwgWT34XeeRg0QmpUJvCIesNmdTfHf/105RBsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5OW8+qLDv1sWPXpNKfe4zSthKsekfxCBtZsikVlgj3NdSwQkSIqDV35Jm9kua+kFyI9xlmgTwc4vxm2S7EFVJ121pYGxfXMAxPlcb7mrX85UksvH7K9mGLQZbNf5I/Qt9KdaEOns2ufWZSv6JdCsxtwCxxEm7lDzz0NLHkM5mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biP7WryD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biP7WryD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899AA1F000FF;
	Tue, 13 Oct 2026 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897600;
	bh=2VLEnxgRJVX6X3qu7c8Ejb0F4UdBq9TbqlEQsB4ecx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=biP7WryDSBkmJClhQVqHK08wCwShGIxdzEpqBpPizSutwq5XT7ayln+WPNfjP3D7q
	 m1MNTVZ5JKLk8Np6mFH89jLOvwjjRy8F9NUrbJrKm1rAfR0BKSnGydSrzPdXh85zIR
	 Ncp5CyiHeVQbyjhfmne5vLZDQxa7OYKl36ANIKe53hl++5zgP0WPWx7p2tQqc79Rjd
	 6rJXqqkrpfzvVvNAgWkNseD3o4wYQq1Y/fE46b9sYJ4A8wgHK0VAj7TSgQYLQqxFAj
	 bYPv0W28/bWKzqbtjxhso0X2n+Uv/DTK1+9Ti047zgdwIlyqsAvN9yOkNOKaZPv/4v
	 V62L0bcZVMe/g==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 44/53] MIPS: SGI-IP27: give each CPU its own topology package id
Date: Tue, 13 Oct 2026 15:17:04 +0200
Message-ID: <0e4c29476c0746ad05c9432bab685c86a398d03a.1791890466.git.kaloz@kernel.org>
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

cpu_data[].package is left at its zero-init default, so /proc/cpuinfo
and cpu_core_map treat every CPU in the system as one package, though
each PI slice is a separate physical processor. Derive it from the
klconfig nasid and physid node_scan_cpus() already records as the
CPU's slice.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-smp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
index 13b85e3ba311..7739ac9618b8 100644
--- a/arch/mips/sgi-ip27/ip27-smp.c
+++ b/arch/mips/sgi-ip27/ip27-smp.c
@@ -47,6 +47,13 @@ static int node_scan_cpus(nasid_t nasid, int highest)
 				set_cpu_possible(cpuid, true);
 				cputonasid(cpus_found) = nasid;
 				cputoslice(cpus_found) = acpu->cpu_info.physid;
+				/*
+				 * Each PI slice is a separate physical CPU
+				 * package; these processors have no on-die
+				 * multiprocessing, so core is 0.
+				 */
+				cpu_data[cpus_found].package =
+					(nasid << 2) | acpu->cpu_info.physid;
 				sn_cpu_info[cpus_found].p_speed =
 							acpu->cpu_speed;
 				cpus_found++;
@@ -85,6 +92,7 @@ void cpu_node_probe(void)
 		if (cputonasid(i) == master_nasid &&
 		    cputoslice(i) == LOCAL_HUB_L(PI_CPU_NUM)) {
 			swap(sn_cpu_info[0], sn_cpu_info[i]);
+			swap(cpu_data[0].package, cpu_data[i].package);
 			break;
 		}
 	}
-- 
2.47.3

