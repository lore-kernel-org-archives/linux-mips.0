Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471050;
	b=th/JPz3q6i78m6YExBhQVENsmLcYdqS8jrNiDsE5B5I2HLIkOCnUbsfnKbNgKsJTx3lQ
	 TYq9Sx9SKIulHVnVfxdzAtQOuCLmAaCBZSmM3GV0sdX3HDGnHL1/IcgBqLXMJWzWP19Xz
	 h6dMgBm8x3S4zEdJ3zSWeP5IehYn8kC9c10C4TTDOerUqPOvm6kv/dJm4+LZUhJWYDpEu
	 6UvttrcwNeVsW6IE/WJIwIupU2TxHxnoHwDWDjCD747OsozZUnmc/XOTvFVJLS7xEGG3p
	 62ITt8OcQ0/skrVIS4iCDaoQE439mjwBP747Q676HwcTOO6Axq1Wj8+0xTdrs3a76qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471050;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+j8/fJhR8UQX2Q/xDYKDp5x+c21RfWgMErPB9xHKBEI=;
	b=t7eg13bMcUPy2uUEydZVjBOG6mWcJF+iN/XixxdIG2J2ceZaeAFZyR7zUED3XVgsmFE9
	 vC99bAhNJsjOGnexSqFsAW02HRWOHxiNxngeHvHgQLoQmC5aPEKhEaUbdSBKUa56HEqcK
	 3EFkKUJNvV93eiB35s4b9f3Q3zJKZbXJ3Dc9NUhX4szUFCB3URKEDC9/PdynT+LATOhrP
	 uYYslxUw3CHjVFpffluGgq6RyTUt5Mz5LflcRWDXE0VMvOn1WpOo15i7XTwXza8GduhAO
	 dx6spef/bvyDO7XekGBDx+8lmH7U4J58QZINzu6YV7OUK6/venflhlGbifZaUqILkkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Qso0KxD0;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=zGr+1dnH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.171
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B34606A881;
	Thu, 12 Nov 2026 08:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B34606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Qso0KxD0;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=zGr+1dnH
ARC-Seal: i=1; a=rsa-sha256; t=1794471035; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kQUTErHlJy11MxruRT7iVEoeOE8JYr8VW45aXYhaIijtYLvMBAlZjz4hrPKktbrNjY
    Qn7Vf73IWvNBE7L2qmOBOuE0GGKOXipH1OVY7lX+rgpeI9iRaHcgtrT0M2C9RbOSTvay
    I1/Eo8B02roP0TOLE8JryqaJTSIP4rLok21z51z70W4Ba36Fi/gONOS4fB87seCpPEcl
    ysNYIa287TopU95MhF3wZpgYDYi0cuQ4cWScisx6u355Flch4+me4nqShXAFfOUt68Ez
    /zeQfvBANwxbwzLm+S+Btwft8vPgPgWGjY3nb73dJb0PdAJl9g5Ogj094CHa1xQSDQKx
    LWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471035;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=+j8/fJhR8UQX2Q/xDYKDp5x+c21RfWgMErPB9xHKBEI=;
    b=ozezEb91dBxQHwgEu5i5EummVmB62K31O372APva4tnubg6ZLucedhCWsDrcHv+L1R
    CLzqFY3UV9+aKLUHOHskw8Y3rb6Vhp1yhIGgzBIGlTQ+4ff9kwQxUQYXwCV3ytgleRHg
    eEWfOaeGfePuzMCi0V+dGv9jPvN1DjcJZNH4z//QsiATSofX0GBkHfJFqhaZGC5/UVJF
    fthyq2K58ocyD+n+6iq2B4A9WZRQbdWCKEMqHIz+NTM6b20vAUl4SoEtQ4XB9++6LvOa
    X0fqlqanHSyEExZJI7rQAhmxKzJrKU+Q85i6Bu3N3sylIy8ef9oLbDNZJnvfVQZXQp+1
    75Rg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794471035;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=+j8/fJhR8UQX2Q/xDYKDp5x+c21RfWgMErPB9xHKBEI=;
    b=Qso0KxD0wjN3L0tFh27Ad1s53Jn8f1wuxM7Y8BzYdlCbYuQFdCfwsS+khzXoInaUMc
    f5cG886E0VtMdJ+QeVFszIesXMVPdPyh/UoNAltrVRBw35eVB+iI9M+4ngs9LqyoOdBH
    J19p6wdO3Jm8aqnoXjVo8q5ZkzpOKExyGfuVvcsnjk9tlUx0ajC63wFfaLsgFAlte3xY
    T55vdlccVAJPpsH9E5H6zpF7ikWTyp1bi9FJhSWMuukeyCnVI2rWU963Y9fuRTw+Voof
    EeqZX+PKTfFBtI7XuzVLmwY1PNf6oonqThxNqlCFbEg0uD+0YsA6xGcQ3FXLGtXj1iaL
    uMfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794471035;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=+j8/fJhR8UQX2Q/xDYKDp5x+c21RfWgMErPB9xHKBEI=;
    b=zGr+1dnHnFI4p29SkoZc4TxHe90b6cjHAmVEH+uD0WarMD8LC9PS4n+biIL70Q9Qjz
    i/4LGJJ/RNEewLuOGoCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV35pZz8iNKp1rK7chac7b5mVucO+Qp4KTQNe8"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AC8AZAbe
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 12 Nov 2026 09:10:35 +0100 (CET)
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
Subject: [PATCH v2 5/9] MIPS: Ingenic: Update Ingenic XBurst implementation IDs
Date: Thu, 12 Nov 2026 09:10:27 +0100
Message-ID: <2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794471031.git.hns@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

Add PRID implementation constants for Ingenic XBurst and XBurst II
processors and handle the corresponding implementation IDs in
cpu_probe_ingenic().

The PRID table is updated based on Programming Manuals and hardware tests:
- jz4780: 0x3ee1024f (confirmed on CI20 board)
- x1000:  0x2ed1024f (unconfirmed)
- x1600:  0x00d00000 (confirmed on LX16 board)
- X1830:  0x00d00100 (unconfirmed)
- X2000:  0x00132000 (read out from LX20 board)
- X2600:  0x001320xx (confirmed 0x00132000 on LX26 board)

Additionally, clean up extra spaces in the comments for
PRID_IMP_XBURST_REV2 and PRID_IMP_XBURST2.

Distinguish XBurst1 implementations with different SIMD ISA revisions
and identify XBurst II processors using PRID_IMP_XBURST2.
The XBurst II classification follows the Ingenic vendor kernel.

Keep the existing writecombine handling unchanged, since no
independent evidence justifies changing the cache attribute for
XBurst II.

Public references:
- Ingenic Community, public SoC datasheets and programming manuals:
  https://github.com/Ingenic-community/datasheets/tree/main/X
  Includes the X1600 programming manual (X1600_PM_20220117.pdf)
  and documentation for other X-series SoCs, including X1000,
  X1830 and X2000.
- Ingenic, XBurst1 CPU Core Programming Manual:
  https://cdn.hackaday.io/files/1855627939084608/XBurst1_Core_PM.pdf
  Documents the XBurst1 core architecture and CP0 configuration.
- Ingenic, XBurst Instruction Set Architecture Programming Manual:
  https://www.setphaserstostun.org/ci20/X1000_M200_XBurst_ISA_MXU_PM.pdf
  Documents the original XBurst SIMD instruction set.
- Ingenic, XBurst2 CPU Core Programming Manual:
  https://www.manualslib.com/manual/2646351/Ingenic-Xburst-2-Cpu-Core.html
  Documents the XBurst2 core architecture.
- Ingenic, MIPS-LINUX toolchain R6.0.0 release notes:
  https://www.ingenic.com.cn/news-detail/nid-343.html
  Distinguishes MSA, MXA and MXU/MXU2 support in the toolchain.
- Ingenic, MIPS-LINUX toolchain R6.2.1 release notes:
  https://www.ingenic.com.cn/news-detail/nid-348.html
  Documents MXU3 support and identifies X2000 as an MSA target.

The public references document the available CPU, SoC and ISA
information. The PRID implementation handling follows the Ingenic
vendor kernel.

AI assistance: ChatGPT was used to help review the PRID definitions,
compare the Ingenic vendor implementation with the upstream code,
and draft the commit message with public references. The code changes,
hardware observations, and final patch were reviewed by the authors.

Co-developed-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes in V2:
    - removed the PRID_IMP_XBURST2_R2 definition and hints for an x2100 as
      there is no public reference
    - merged into single commit changing the PRID definitions and code
    - reviewed details and rewrote commit message
    
    Open Issue:
    Olivier Louvignes <olivier@mgcrea.io> pointed out that he has
    simply reused the definition of the X1830 for the X1600. This
    sets c->writecombine differently (_CACHE_CACHABLE_WA) from
    _CACHE_UNCACHED_ACCELERATED as we do here.
    Both settings appear to work but it needs expert comment which
    is the right/better one.

 arch/mips/include/asm/cpu.h  | 9 +++++----
 arch/mips/kernel/cpu-probe.c | 7 +++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index add26f08e8029..79fd9a0747cf2 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -47,7 +47,7 @@
 #define PRID_COMP_CAVIUM	0x0d0000
 #define PRID_COMP_LOONGSON	0x140000
 #define PRID_COMP_INGENIC_13	0x130000	/* X2000, X2100 */
-#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4730, JZ4740, JZ4750, JZ4755, JZ4760, X1830 */
+#define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4730, JZ4740, JZ4750, JZ4755, JZ4760, X1830, X1600 */
 #define PRID_COMP_INGENIC_D1	0xd10000	/* JZ4770, JZ4775, X1000 */
 #define PRID_COMP_INGENIC_E1	0xe10000	/* JZ4780 */
 
@@ -186,9 +186,10 @@
  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
  */
 
-#define PRID_IMP_XBURST_REV1	0x0200	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA	*/
-#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst®1 with MXU2.0 SIMD ISA		*/
-#define PRID_IMP_XBURST2		0x2000	/* XBurst®2 with MXU2.1 SIMD ISA		*/
+#define PRID_IMP_XBURST		0x0000	/* XBurst1 */
+#define PRID_IMP_XBURST_REV1	0x0200	/* XBurst1 with MXU1.0/MXU1.1 SIMD ISA */
+#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst1 with MXU2.0 SIMD ISA */
+#define PRID_IMP_XBURST2	0x2000	/* XBurst2 with MXU2.1 SIMD ISA */
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_NETLOGIC
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 489612ed9d498..69b68d00b66f7 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1768,6 +1768,13 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 
 	switch (c->processor_id & PRID_IMP_MASK) {
 
+	/* XBurst®1 with ISA */
+	case PRID_IMP_XBURST:
+		c->cputype = CPU_XBURST;
+		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
+		__cpu_name[cpu] = "Ingenic XBurst";
+		break;
+
 	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA */
 	case PRID_IMP_XBURST_REV1:
 
-- 
2.56.0

