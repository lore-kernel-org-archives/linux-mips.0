Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1183F23A6;
	Tue, 13 Oct 2026 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884820; cv=none; b=fdHkJnac6yynIUZz03ksQjSPBinXqnx4abJah/frsCmjaY11XTaoUmKSzLmiHg40+aPQDB1EH/Poe1Mdpvc1XkbijKS/rVlTVLv/FWoJY8hZ5I3RfoXUEK+Ww9/eBLIGfT7a687bIEsqpzELk4+tyZ+q24RMxwM1TKqzn9aaIoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884820; c=relaxed/simple;
	bh=ZoRijTvFMVSF36rmlmsX7UruURMXloDTH7efd3GqdSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3KEdo17XGZFMBAo96n/1OVgL+M0+osLoQJqgaDo6F+AdGfw30hsMetm4yoYQHQYxME4EoV1Z1V9wVcPjHtM5bHZy3jNs8CzS4woL83u7OlYBcJ2by5FAZuEF44h8kg1vT8i9/OWFNzGCRbgn2jgV1yE+vzKwamKS2a6QEBzqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bItXDgxu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bItXDgxu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBBD1F00893;
	Tue, 13 Oct 2026 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884818;
	bh=Yf3BSUcMO7iXJFRyFvn79gGRYGAkEFJKNWDxEjLk3RY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bItXDgxu1R5PhNzfVyKFi85VFlOxzntr+tmzSyja5O0RBzRBFbQVyeKIAaVMFc+SG
	 o7S4qyCIMEy6eFF9iKuwbWRMv1CJeCeGLMDsiPyblKhyyLAqW5aOMY0Reg7ofKHkPJ
	 eAjpk0JiUlcI6yN1b2D5cInBvUPec24wUuquLrmXLcnKDeUaQZ7QH2q3yI8E00yYDw
	 0bTb+qR7Et1pD0IL7+57u7u6pNh5lsfkbB9QbFXCxlGhW3TU8BXouLkqNyPz2s0gwk
	 gBqjgT51QVwy8Wmv3wIsX7fWHZMmvAT1sjbylKUOcAs6Vypo/93UR4IdoNJu1VJZc8
	 Q6zS2UMV655EA==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] MIPS: sgi-ip32: Clear latched CRIME errors at boot
Date: Tue, 13 Oct 2026 11:45:52 +0200
Message-ID: <20261013094554.16804-2-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013094554.16804-1-kaloz@kernel.org>
References: <20261013094554.16804-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Errors already latched in CRIME when the kernel starts are reported as
new, as a "CRIME memory error" or a "CRIME CPU error", once the error
interrupts are enabled. Clear both status registers in crime_init().

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/sgi-ip32/crime.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/sgi-ip32/crime.c b/arch/mips/sgi-ip32/crime.c
index b8a0e4cfa9ce..d9f5fe939bfe 100644
--- a/arch/mips/sgi-ip32/crime.c
+++ b/arch/mips/sgi-ip32/crime.c
@@ -34,6 +34,10 @@ void __init crime_init(void)
 	crime = ioremap(CRIME_BASE, sizeof(struct sgi_crime));
 	mace = ioremap(MACE_BASE, sizeof(struct sgi_mace));
 
+	/* Errors latched before the kernel starts would be reported as new */
+	crime->mem_error_stat = 0;
+	crime->cpu_error_stat = 0;
+
 	id = crime->id;
 	rev = id & CRIME_ID_REV;
 	id = (id & CRIME_ID_IDBITS) >> 4;
-- 
2.47.3

