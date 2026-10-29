Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309048;
	b=0nq8tJYydT5NiXblpFYTAyMSSjDPLJMAJE6z2tpUU5FCQC5grpFIeEqa3/nC4iUeptZB
	 fc+oTOKAm5emFww4ebNke1RDoAcCTsaLpiMTl6P9wLvTqnaVp1mMLRvwcf65+C/Hw3ufL
	 OMKVSBCHbgfjdDjoDtpg/KNSAhoTm7HUhKRq/JnVzZwr7isHh+QM/L3s8H/W7nqaV8QqN
	 KGQ0Ma8Z2keB06H0RlrtF1Qu9LNKD0BUgmyD4BEacoSYEds9kJh4Xfx+Eucyq6gwbR5Rw
	 ZvEe4JCvn9enro/9qcS7FAIM6a9GGMjHPOrp1HMr7OUSnvY/rJ9YJmPtCO7dB5czd3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309048;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=AkXpuXURJ437YTXLDinP9a0pkk+kcCHPLEtUmcdgPlE=;
	b=vffWdlY8n5wfrIAiMlWziS1+xQv/NTo0a+h2Q3hQtFnPOxfSS6TdHReY28VHkCWejksh
	 CNZ+5KhmE2iHGAAA2wuWcESXPXGkcVwqoKxQepAiMlp+PkILamlQwTqNZfp52hgkkaskI
	 gHEGKq6Oxp3tQ/oRXQRNO24deUmTSBFmft3yQEPijA6TVrHdlksBC2u7BcoOhGwhGOQuZ
	 U0TFKbiiUKzyJaDuU+5X8s9HJLM3PyBsGrx+UTlB6u1P5NkiRmiXesHeMRPY5mJueEcm1
	 65DBUAR8E/BMuMw5G+nk3nBrJgteiMuvbMPqiPLyZ/42lqvz0/Gp/fqyhNMtOeNpZ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUd8zVRg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11D9606A31A;
	Thu, 29 Oct 2026 21:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GUd8zVRg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF3E1F01824;
	Thu, 29 Oct 2026 21:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793309047;
	bh=AkXpuXURJ437YTXLDinP9a0pkk+kcCHPLEtUmcdgPlE=;
	h=From:To:Cc:Subject:Date;
	b=GUd8zVRgI9QTmIZZqQvZ/pw85d7SLT2LZXEirGWFSDg3/M34mZvDA+guvP5818Ev0
	 drbmYhOK6uhbXFPeylc1ySTwyC7gm4KfPUJJD3AgqPI7rYhxzpz57w0EYiLnyWTRxy
	 Rbhr4OGAY4aH1/9PFeIAvtskJ7RHFcwXzN8XmnYyj1a/mrnoN4M9lwtzfONau2WTli
	 6OuspiaTrfq+Ua2s9ls0v1drDjexlDrZBM8BtJNOJYnzpFOOSLBR7bjEW8X25ECaw6
	 KN65z033RhrBD/8IAS00aF9ATYjqFzcKLdCUq63iKLWAynwwiO5b3Awt0IbcGVlk3A
	 14y/d/SSH4aBg==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rosen Penev <rosenp@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 0/4] mips: n64: Clean up platform initialization
Date: Thu, 29 Oct 2026 22:23:43 +0100
Message-ID: <20261029212343.110095-6-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=397; i=blum@kernel.org; h=from:subject; bh=QPKerQrjXft0gqjnI5tZf38towPNsGp9V3Gmnm2RMqk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmPd8Zb9m9qeFa1Tu7GM/H301XmzX/G+0XeXK8uw1k10 F194uLtHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjARh72MDA3r95XL/dU0tQyw zHyz6ExH+wnB7XkTA9mMP1cnCma8zmT477tf1Kw1tP3Yt8yl+QuWJ65REhLxddv7dPbBTylNGYv PMgEA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Clean up and simplify the Nintendo 64 initialization code.

Thorsten Blum (4):
  mips: n64: Use DEFINE_RES_*() helpers
  mips: n64: Simplify framebuffer allocation
  mips: n64: Rename the video interface register helper
  mips: n64: Use SZ_8M in plat_mem_setup()

 arch/mips/n64/init.c | 81 ++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 55 deletions(-)
