Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EF046F487;
	Tue, 28 Jul 2026 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785264639; cv=none; b=TwzdW3J1BfHwv0yfHGNqbsRo1+82/ZzLaQJ6cZmT5B6+pHrltZFjzr2YQJZfToEusn8aCoGb8aVH58Zh1jWgmrjpAZDcsE+3f2o62qiALV+YT/jgqOuQdo0on61KoTQwosn9JFvlXwHrDqtJoKaWun8l4lGF/nOzJjE+CXxNV4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785264639; c=relaxed/simple;
	bh=W3hNuNXXIEX/+UHWPisYfC7tQz3MebgbrXAZfwJPUaA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y12ofzEvvN77rseFIQEkGa1+wp6VFoRqz6hIOOwDWaOoxtirIvLG08jfLunj09Di69ypRjhbAs5vYnK2vHQ1THUe6gMNjssYDNLm2xurndqKsfbjFYxFz7dlYtNB2QA3KPmUt0DQNhvGDKZV0Q96caTgk8reHC6qOjhgvpkiXCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=O2FYTJ71; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="O2FYTJ71"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3131A6D0E0;
	Tue, 28 Jul 2026 20:50:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1785264628; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RuTVEjwfbPzwFnpflj+GQn/TkzLRIqU3KsVEWJig2ZA=;
	b=O2FYTJ71BieuiOAiOEsIB+2kbUMzMGAPA42IQ9y5XFpr9GSLU9nNeioH+qnjxi7YkFdI00
	d3tE0SHyfDRcvOeGF1yakBzJjAjP8LFLRD2CCoIGR6Stk3CZ/0/m21MS3KAMLaSn0lbeFY
	xr8Ei2NRYppkpxvllVtPogNiYYUfLz4HArkFMUPyGugKIHUNRWMF7HF8xQL7pviLrvJUsO
	9NCrne47Kk4uL4xtyiRhNGeEtivsMD8nJrPZ0BkVk5llJrnhD6tH0TJvuCuY+TtGYkR5/N
	3zBflEQV+a/isZUw2su0yJ4NYj248zWheqDks2GyDl2l+7zI/9yOnRgTwL18bw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 0/2] mips: econet: add multi-vpe capability to EN751221
Date: Tue, 28 Jul 2026 18:49:57 +0000
Message-Id: <20260728184959.102441-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The EN751221 is a MIPS 34Kc so it supports MIPS_SMP_MT, but until now
this was disabled because to enable it requires the interrupt
controller to be in VEIC mode and previously only cascading mode was
supported by the interrupt controller driver. Since
commit 2ee2a685ee83 ("irqchip/econet-en751221: Support MIPS 34Kc VEIC mode")
the intc driver now supports VEIC mode. Add SMP_MT to init.c and
update the Device Tree to recognize dual VPE.

Caleb James DeLisle (2):
  mips: econet: add multi-vpe capability to EN751221
  mips: dts: econet: Describe dual-VPE 34Kc processor

 arch/mips/boot/dts/econet/en751221.dtsi |  7 +++++
 arch/mips/econet/Kconfig                |  4 +--
 arch/mips/econet/init.c                 | 42 ++++++++++++++++++++++++-
 3 files changed, 49 insertions(+), 4 deletions(-)


base-commit: 27c61f8565a438b2d1dea6f6a47af0e6dc12c112
-- 
2.39.5

