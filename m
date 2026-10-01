Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249A653B34C;
	Thu,  1 Oct 2026 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871275; cv=none; b=oma6pZPYIpH3khayrztMmaTI7oproJSP4uEG5kOj8xbKaqYVfiOE0c5/8UH/qHSQvYIpo4qQNGzqrUyFguN0QRtpFIgGoitLtN3RIGYduP1CpZmf/6hYh9T+1fMt51qky01lAwvh6u3PEeEsMvXZ4Mn+NPfNneZqEKBGK4H0d5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871275; c=relaxed/simple;
	bh=hvl7klOnsRGeC7afDTU6u9cxF5Vc2CDsxOtyEC/EVQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJw2/TTCYxZ0tZxu5JA7qPntQIwCTAJRfOpHWddk5Lb/bvhii37LGXpM/ULnN5Rw1iKAOEX7RZkRwsFYAa3FgKkpVVcMAD4RqShToXzf+54Wmn5aNgyWdIGUq+fsChFjlN7IW/IudWuqyuJ4hpTMUsd2yoZm+u+wfb+uYtecEk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUX3KMZp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUX3KMZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109241F00898;
	Thu,  1 Oct 2026 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871274;
	bh=Dk2SZxlci565vWEUgbx3Rs+Cb8TFFI7MWdCempWF3ME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kUX3KMZpc9I8FUhZKfVyyLKTXysHQiRYGNYGitwVuPL9DFmcV8TDUTYOuKTaluYvy
	 R4kLDeqe2A9miwVgciUoPqE/X2jS6PQf4tTTbYsAxrqLW+8b5RQ/G4sqfPrA3Te3Gp
	 mehET6WTKJET8BJnup8E1b8fDphUUlkwYOOCS+4lruo3cAVHWZ5AID5M2/dWiaYZTJ
	 TeO+3J7re/U5xXmEXJ48PuHwehLnJKGRI33NDdipRuP6I2a4MFNeyVm+U23vvqH6mb
	 pJcZxPwYojhkPQlV5WnTaP3kDnHaQwsuEOwZisvq+fnZF6RPhjjI6UxXJxh0OZF6Od
	 yZ/hd5SHEXMhQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 38/38] MIPS: SGI-IP27: give each CPU its own topology package id
Date: Thu,  1 Oct 2026 18:12:13 +0200
Message-ID: <945161f0ef976080fc95480559b9aaec84fa8ada.1790857966.git.kaloz@kernel.org>
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
index fc4d9379a93e..c155582699d4 100644
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

