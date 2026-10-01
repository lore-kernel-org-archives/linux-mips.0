Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC1452B1D7;
	Thu,  1 Oct 2026 16:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871231; cv=none; b=A7Iph7fv7BEwVoN9s9LSrw3WQzKyNQ5ceIi6x1CMeZQ0C7olztlJ6+ymX+7o3vDzbZ/ChPOw0+lO9lz7QwOZ6RN14y4csZnhUWm9wgg1dkK7t8YO02wWyzgVb9aeILuZZawWKGZmxC/ojoWRfa+yxMRVE0oHLqLgwrMWigj7Wi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871231; c=relaxed/simple;
	bh=wSrELT6+sjhbjyiW5BUYcAuK6hQIQfF7DIAbpMEKDZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWF3U+A2FwEQC65T7AVBw/XeT2fQ/BxeDxnqk77KH5L1+2tuDNVmC5TaxVP1OTPtw6OLhNPln/3g7At+tjp4NVt8ZdDAOK84wiR22QUpJN9jRbW/l/qF7elKGOiRyo/ootqZXBJmy2H/OYraHPe8dMFJDOVlqx4PDAqyn5fFRZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4P1FnFJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4P1FnFJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D6E1F000FF;
	Thu,  1 Oct 2026 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790871229;
	bh=3nuZZMqTUR9ik1K+bS/lSh6+V3lpBnjptzggzytIWvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H4P1FnFJmjBlNgVZwSS9eNKJm8DGrEBj6yXmhDnY6EN1zcALdCK4rJN36N9cTPQXq
	 IR1A1emOuix3ZOGkR+OWgESrP++CcWMg8RzuU0xi3tI3sdgGpd4Xbd0x3pNVfH20bJ
	 26scqqTNEPy1AvjhApxWZjvGF1ZEGTrixDetoglGFk29tDipKWpcZVbUzvsy9Sl69a
	 paz/ezKMggrEo/yg6D6H7hiL4Y8lgH3V2y37lRH2ZgYzEMIk4SqHQjzfSWPHjVDeAO
	 8WpIK9k3RZH/qCb60d/MNWBNkZTfQNMKoEJrzMcLDrOIKIRWvGrDxS305D4XNx7765
	 0Z6+L0mJ3JoYw==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/38] MIPS: SGI-IP27: take a CPU's node from the CPU table in per_cpu_init()
Date: Thu,  1 Oct 2026 18:11:50 +0200
Message-ID: <87f286c446980eb1c1b1b840241b888efa505f75.1790857966.git.kaloz@kernel.org>
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

cpu_node_probe() records every CPU's node before the first secondary
launches. Take it from there, so a CPU coming up inherits its node from
the boot CPU's scan instead of reading the hub again.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip27/ip27-init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/sgi-ip27/ip27-init.c b/arch/mips/sgi-ip27/ip27-init.c
index 88d79c50d9a7..15811fb3cdee 100644
--- a/arch/mips/sgi-ip27/ip27-init.c
+++ b/arch/mips/sgi-ip27/ip27-init.c
@@ -81,7 +81,7 @@ static void per_hub_init(nasid_t nasid)
 void per_cpu_init(void)
 {
 	int cpu = smp_processor_id();
-	nasid_t nasid = get_nasid();
+	nasid_t nasid = cputonasid(cpu);
 
 	clear_c0_status(ST0_IM);
 
-- 
2.47.3

