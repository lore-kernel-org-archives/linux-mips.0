Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=85.215.255.101
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792956087;
	b=widswk0tppE4YSzgnSPnvkozoMhgK1BlUhhW5bA8OUV67I36d6W2ZegdInXOJxBXTtxa
	 lC0YDN7AxK2PenBilYHOdfX2kdkHwMh1SY3d1Z9ow68GE5zuu6EfNx47hLHBY3AjoksoJ
	 Eap7/w1YXtYwHMl/WSqtoJFjsaGQPY1YXMPI6paXSeU3HZnus0CLpUttKl0vwb2BzOmfs
	 rpmGQKZ+64hbxEFujOgevd619TG335lyzjAiqJRO3Y0ZP4LYf2mGOg88WUUVo/mxiIEld
	 hGwdNjb/5csJLZFD/zsPaKihjVhYOEfO4W4KgBI7MKutLr52dIo2/L/zSDTsRXWBmqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956087;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NwMFhsnASpexXkE4rGhHxhCfMKwDUJ4c9cU5m7RHZyM=;
	b=RliVj+yHl3Id71ehyrzz+k0l31+H5Qs4CohdH05CyyTSYjNrpDEdcRJE2mxFTSoDP/mR
	 ohnmJxAgF7F4TR7Qi9Mz9lamjwATcsG3eUyGT/z1GdVDrAljUNZTaqcI76SIcgmM7ZdL7
	 NRT1hQGB4yMbjMz8J+OfgfuUzqMQW0GXIEsThdCfa3E5OH5aubvGyRda4ayGY3ejMdqMp
	 UAAzNI23KlM2Hbcu8svCt9YqXuRxR2ePrL2NayMlMcjWD7aUey4bwgKFKBoxSQJqy548M
	 B+FJxCWdMLBZsAN7Y3UZ9wxgZcZezbRAXXmmO3cQORwGcityVPK65yaZizXkP/xfrBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oZdZvYbu;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=8zmHgstI;
	arc=fail smtp.remote-ip=85.215.255.101
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de [85.215.255.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA54C606A329;
	Sun, 25 Oct 2026 19:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA54C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oZdZvYbu;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=8zmHgstI
ARC-Seal: i=1; a=rsa-sha256; t=1792956063; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ihf6FkW/k77g7BDcl6r3LAGV1nppfa9idrbKhT0IQxscYjpC/tAwNh1ugPvBJtUVdx
    31MpeKyMUtLXUh0JDYDvckdH5Cikuyv6aNQlMSO5XNEZdU5T6hPJLVK/ziGqdJ/QBFqS
    /EdKjzad+N4m7LCUtQMX+Eitms2sCKnt+4/W0bNbMbuj62SBRe5d5kMQVQvgGjQ6WAQx
    kEw+Hvh0Io0laLKg6vordCx6lEf5C6ZxZw1TFTO2AGbE3gWsWhACwzWHHpfPagQzb5sY
    inPxRNvGxwyx+UhaCp30GIOvB0q8vjetqGojQgW55kbWjGTVKuIobkJYKPjx1w/xSxkk
    kl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956063;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NwMFhsnASpexXkE4rGhHxhCfMKwDUJ4c9cU5m7RHZyM=;
    b=gDx731Gf+t5zfUXGaOlr66UvJ3d/+Z8F/pCTxx70J0n+JhIwIIHQV3D+ybC0JHuuvH
    huRxnUYd+6OgS8n9IuuQ86W8RpVJEZzVt/GeIk9BUzO9CPjEY/6T2p7nroMv2d36bpKG
    qZYTjmIGg0S/SxYsvd0ms/75NG4k/6eStdPGPRU9aVMh6sSNjhIPAwkEEV6ayRuGsllH
    wLn8frC81fqM8j0sSKMUbmaREBWOtEBq8+Rtr0GNs/7/QM4PrJoYjNWdYNfUBmU2TO0U
    58X4J3Txh74RB+6UZgUuZ71svyp2tiBy91hKkGbIWs+cgBvHl5DmfXYVIwGZIK9NnSbk
    r/IA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792956063;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NwMFhsnASpexXkE4rGhHxhCfMKwDUJ4c9cU5m7RHZyM=;
    b=oZdZvYbuxlDtbMH6p0/fcZUTjin7ljNv7OE/YwM1q3z2nsyzoSLcvxdsMRbZtLorVc
    HmXpPKlGpKhDuU9Zm0enzVoD3SwXy/SM68ish7td63T5VsyIfDQEo/kJnZE37GrIMVF4
    VdwAFqJgCepltK0Nhno3S6WeJpMDCfzLPWL12nh1jbSND/oz1TSIxjJFxsnbfLPcu160
    bcmKjsm5B9kWgqwgG0S61BFjSYji4h0YdofgddOCPo/CJVu7J0Tueu2je9Pr3Oe0fA6p
    elhFDtkTPPpwZLYBAnQUCi9XVYe7V/oaRzhG9ucEgGf+rhQ+MO2Su1iXqK/tcJaBZXXU
    1T6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792956063;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NwMFhsnASpexXkE4rGhHxhCfMKwDUJ4c9cU5m7RHZyM=;
    b=8zmHgstIhw+rTSUkkAyRKbJ1b+rfchU43UDIYiKZQsD1vNmCbNh6svAUYBjeot3o4y
    ZCDVkL9E6Guim3I2R0BQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJL2zRD
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:21:02 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 2/6] MIPS: Ingenic: Add and update PRIDs for XBurst II R0 and R2
Date: Sun, 25 Oct 2026 20:20:51 +0100
Message-ID: <fe608d0f4a0023a00b448862bb7f1c2635705e1e.1792956055.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792956055.git.hns@goldelico.com>
References: <cover.1792956055.git.hns@goldelico.com>
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

Add support for XBurst®1 and XBurst®2 architectures featuring the
MXU3.0 SIMD ISA, which are used in Ingenic/Lumissil MPU series.

The PRID table is updated based on Programming Manuals and hardware:
- jz4780: 0x3ee1024f (confirmed on CI20 board)
- x1000:  0x2ed1024f (unconfirmed)
- x1600:  0x00d00000 (confirmed on LX16 board)
- X1830:  0x00d00100 (unconfirmed)
- X2000:  0x00132000 (read out from LX20 board)
- X2600:  0x001320xx (confirmed 0x00132000 on LX26 board)

Additionally, clean up extra spaces in the comments for
PRID_IMP_XBURST_REV2 and PRID_IMP_XBURST2.

Note: PRID_IMP_XBURST2_R2 is imported from the vendor kernel and
is assumed to be used by the Ingenic A1 SoC family because of the
SIMD512 instruction set (MXU 3.0).

Co-developed-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/include/asm/cpu.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 0fd9f9bbd21f1..1b88966116ffa 100644
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
 
@@ -186,9 +186,11 @@
  * These are the PRID's for when 23:16 == PRID_COMP_INGENIC_*
  */
 
+#define PRID_IMP_XBURST		0x0000	/* XBurst®1 with ISA */
 #define PRID_IMP_XBURST_REV1	0x0200	/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA	*/
-#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst®1 with MXU2.0 SIMD ISA		*/
-#define PRID_IMP_XBURST2		0x2000	/* XBurst®2 with MXU2.1 SIMD ISA		*/
+#define PRID_IMP_XBURST_REV2	0x0100	/* XBurst®1 with MXU2.0 SIMD ISA */
+#define PRID_IMP_XBURST2	0x2000	/* XBurst®2 with MXU2.1 SIMD ISA */
+#define PRID_IMP_XBURST2_R2	0x2100	/* XBurst®2 with MXU3.0 SIMD ISA */
 
 /*
  * These are the PRID's for when 23:16 == PRID_COMP_NETLOGIC
-- 
2.56.0

