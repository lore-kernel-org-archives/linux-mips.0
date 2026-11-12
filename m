Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.164
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471046;
	b=uqhlzd1JeLb5idMUzYA2OpF3KZZDGyuC1Vlwpcw6Jk9DaLgIJCjmGuLnZ5ZYESYBbYZ+
	 WIEySYwArl2Fz5qD/8fzWz6pfCpFX6q8TjmE5W6NocTW3u9zzV4xg6fiwPdd+irHf6Z3G
	 YB3qgBW7u2iRECmntwjw+zDtp47rX0URwD45s9OoWaN0r27zuqVnRmlPDZBAMZeTzuxL4
	 QvuHfTQThpPcaeNMH73SbRfST6287QLcJPBraxeJkUYBnYxMTs2sr9DskicBLo1lbUpl5
	 l7uwocvv9Gv7/LxR7QhFJHCPmc+I8aWoqAyJO8c4oGD/oiaZ6g5+Gyppsh5NLYlVNLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471046;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=KKbXoLi/o/F4tUEc0WXbaOVqO1cHoHFZMlMuRD/E/6A=;
	b=YYzRIpWpFJ479TVMj+LKMDdHZCs2huMfAAuusEF86FIeHHPfewNq70Q6UUn0KQXr1bpl
	 jO+oOKthUkHOIu2rz+pGbRXM6vASDaPRplnS/EF2r0YiMj72TqPfnCXY7+OSalNuF802h
	 V5qKE24E7ry2Jyrf6GaE2l4AY2dVU7yVNp+ZyMSMkEN+LeAElXCgHza9HOvfqQ+VIQbhS
	 9uZhEz4L1cW+erCqe2n2mKBQo28PSXtanUpmDb590XqqcLx85Uk2jy+QZ17sVoFAtlHYh
	 x/aRO83pjynV7zCBWFjmGhWvHxxxOkKeSrx95LWOMpIEq9JWIt/lpwGggsoGgmcPPQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=NFPsL3pW;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=dITluR6B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.164
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9113E606A32E;
	Thu, 12 Nov 2026 08:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9113E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=NFPsL3pW;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=dITluR6B
ARC-Seal: i=1; a=rsa-sha256; t=1794471033; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hnw9Xxdh1yRShJROWepnAtFPXxM4iMofnsTDv5GEsgWwipX+Po+hm8kYT0hf4R26AQ
    NXE+1kivFXycWnoVIMBGt6/PC45JpTyRqhNhk14Vjh4wmj2p4pTjoFLgfl6Qle95QCus
    KlcJnR8pSpLoMYlm0q6iUoXCZ5J7aXCh422M8qKWAcy2XJc9Tl23ZQ6SmTW4XLzuQrov
    rh0B4mmGTfdG2YKHsuWsUuOHVOy2iFcE48e7WrscHrrl9zbUcwmUM4IjFEQORWHKnxfn
    BCDVTHeINo5z4VN9pkNkKKa1H3xzCIPZHU4hVHFGGasvDRSEARbmnjbNL3/n7Ix4Q+JM
    WXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471033;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=KKbXoLi/o/F4tUEc0WXbaOVqO1cHoHFZMlMuRD/E/6A=;
    b=o2ywCsVqBbpVHDRdsGwbESt1s6/hgYOLbW/8uGQ5RXUKsrX+Cjgv5h8vo8l8DEmuhn
    vwNLvQG7E68fCW2wmk/a7wfF/I6kHr5AAxUEyI3k4KTWzBvQHVyPMXjjKk1KeuBsGLji
    zS6dSXJwpQgmHjHUChF012C+aHXhfrANauYe2++8N3IumReDc3Rr4YpTSZ3wVuRPZzlW
    cI/yB9drpyp38X560r+7P6hh1vxhM23fpwJnUcRrweJcdohVdFb2FBfOtSya+T14QFZs
    OCO1VwPqbrfFBRby0V5VX5oKjXa9EowB7hDEU3COB1X9d32+M/uMZ/TsrHypnGBIAqdt
    jL9Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471033;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=KKbXoLi/o/F4tUEc0WXbaOVqO1cHoHFZMlMuRD/E/6A=;
    b=NFPsL3pW7kj6XsBRbST1WJEQietTklM0ewLqG8AHm3vGrll47epLPJYA9vb4J1tLSu
    xMBa5FAvuZ/kLMcVcivuUKNiLmPIRHlxq0+kP39o//Aaq16zx7innsiSQN/OGBiOfvTc
    dNDkDqYGo0OzPsmnAneJiV2Xj8BXn7tswv8ynTh+y8viq7DIctkP1UDAMABLnenf2/5Z
    e8yvK6GTBc2w890hopZ4PcW2/dm7CFfswTwmLrUW9RF2ykd3dhhQ+ECny2TflU2r55IV
    62ihsCdsqwxkjJwuzk7+n9Y1jvE7Rnq2U96hngHWrgqpUo9U38CEn6PoLP10N5fyJBzx
    3WMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794471033;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=KKbXoLi/o/F4tUEc0WXbaOVqO1cHoHFZMlMuRD/E/6A=;
    b=dITluR6BOZhPZoRzV18kd9hz3WsFhsE0mQzhXRrt+/NR+NRXSz16tMT17kXmo6jUFu
    QfiRj5Jwwtd+mapZjAAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AC8AXAbZ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 09:10:33 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	"Christophe Leroy, David Heidelberg" <david@ixit.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	周琰杰,
	Paul Boddie <paul@boddie.org.uk>,
	Olivier Louvignes <olivier@mgcrea.io>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: [PATCH v2 0/9] MIPS: Ingenic: Add XBurst / XBurst II infrastructure and improve overall Ingenic SoC support
Date: Thu, 12 Nov 2026 09:10:22 +0100
Message-ID: <cover.1794471031.git.hns@goldelico.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PATCH V2 2026-11-12 09:10:31:
The series updates the Ingenic platform support to allow clean transitions
between bootloader-provided Device Trees and built-in fallbacks. It provides
the foundational Kconfig, PRID, and CPU-probe blocks required for newer 
Ingenic/Lumissil hardware generations (X1600, X2000, X2600) and adds JZ4730
for completeness.

Changes to V1
- allow user selection of BUILTIN_DTB (suggested by Paul Cercueil <paul@crapouillou.net>)
- added the CPU_XBURTS2 type here to solve an issue reported by kernel test robot
- removed PRID_IMP_XBURST2_R2 and merged into single commit
- reviewed all PRID_IMP with data sheets and programming manuals
- added full x2600 and jz4730 definition for completeness
- added platform makefile and load address for X1600, X2000, X2600

PATCH V1 2026-10-25 20:20:55:
The series updates the Ingenic platform support to allow clean transitions
between bootloader-provided Device Trees and built-in fallbacks. It provides
the foundational Kconfig, PRID, and CPU-probe blocks required for newer 
Ingenic/Lumissil hardware generations (X1600, X2000, X2600).

The first patch corrects an inverted Kconfig condition regarding appended 
and built-in DTBs. This fix is necessary to allow configurations where 
the kernel relies entirely on a Device Tree provided dynamically by the 
bootloader instead of forcing a built-in fallback.

The remaining patches implement CPU-probe initialization, correct PRID 
mappings (including vendor-kernel values for the Ingenic A1 SoC), 
platform load addresses, Kconfig updates, and generic board match updates.

Structure of the series:
1. MIPS: Ingenic: Fix inverted MIPS_NO_APPENDED_DTB logic in Kconfig
2. MIPS: Ingenic: Add and update PRIDs for XBurst II R0 and R2
3. MIPS: Ingenic: Expand Kconfig for X1600, X2000, and X2600 SoCs
4. MIPS: Ingenic: Add cpu-probe setup for XBurst and XBurst II R2
5. MIPS: generic: Add MACH_INGENIC type and compatible for X1600
6. MIPS: Ingenic: Add Platform makefile for X1600 and X2000

Testing:
The series has been compile-tested for generic Ingenic targets. PRID 
values for jz4780, x1600, X2000, X2600 were verified on real hardware 
(CI20, LX16, LX20 and LX26 boards respectively).

Please review and consider for inclusion.


H. Nikolaus Schaller (8):
  MIPS: Kconfig: Allow user selection of BUILTIN_DTB with description
  MIPS: Ingenic: Configure CONFIG_BUILTIN_DTB=y for Ingenic based
    devices
  MIPS: Ingenic: Do not force BUILTIN_DTB in Kconfig
  MIPS: Ingenic: Update Ingenic XBurst implementation IDs
  MIPS: generic: Add MACH_INGENIC type and compatible for X1600 and
    X2600
  MIPS: Ingenic: Expand Kconfig for X1600, X2000, and X2600 SoCs
  MIPS: Ingenic: Expand Kconfig by MACH_JZ4730
  MIPS: Ingenic: Add Platform makefile and load addresses for X1600,
    X2000, X2600

周琰杰 (Zhou Yanjie) (1):
  MIPS: Ingenic: Add a new CPU_XBURST2 type

 arch/mips/Kconfig                      | 25 +++++++++++++--
 arch/mips/configs/ci20_defconfig       |  1 +
 arch/mips/configs/cu1000-neo_defconfig |  1 +
 arch/mips/configs/cu1830-neo_defconfig |  1 +
 arch/mips/configs/gcw0_defconfig       |  1 +
 arch/mips/configs/qi_lb60_defconfig    |  1 +
 arch/mips/configs/rs90_defconfig       |  1 +
 arch/mips/generic/board-ingenic.c      |  8 ++++-
 arch/mips/include/asm/bootinfo.h       |  2 ++
 arch/mips/include/asm/cpu-type.h       |  1 +
 arch/mips/include/asm/cpu.h            | 13 ++++----
 arch/mips/ingenic/Kconfig              | 43 ++++++++++++++++++++++++++
 arch/mips/ingenic/Platform             |  3 ++
 arch/mips/kernel/cpu-probe.c           |  7 +++++
 14 files changed, 99 insertions(+), 9 deletions(-)
 create mode 100644 arch/mips/ingenic/Platform

-- 
2.56.0

