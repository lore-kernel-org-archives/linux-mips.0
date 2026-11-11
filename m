Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794385655;
	b=t7V62s/pOYFUtGy+EpgV+xjjVnHtwVbKDS3aRmvExRH4jsNZ4T5J0+6u92K+FLg17bnm
	 rtLuMrgyb4cuy9k9ZYHXrr8JXxESvZu38ytL8LtB+qKZxZr5Bbdn2alXguUynbBWDggBM
	 bmPBlWmwF3UrbiloyqpeA4oMZqDzNjserhZVt4tAibPh5DiFs1L1cdbGj0uj3hUo2Cv3q
	 pF3IOLCa2K4IUG/idE61Jer7HL3lFnTTfcCbDTEe0zxsjtghzKxWoj72iFv31C+r/w0A8
	 uj75mrCMZfVvXDKMzOROlVi1+UNqbS7wTI53N6k7URx9yMsua2fkLqMTFgEgn71kUZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385655;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=duDFZn/9vifFKrXrrq9JNvuX6O2EDASRPRiym+nRd4U=;
	b=AIzko828X/JBH3QEcoG/uyV3e5G7YhoUDIzyXFbIqxrEKahzc0SP4ERtTc1JSti99D1V
	 PeasLKcEUKbk9b99c8vl1efi96gPFovjtVQwXtIOOZbh5H58IeCzsa1NeUpb3EYn0oRPr
	 b4vLgI75bPF/6W2pcwwE04tWssw6axYvI5tetPP/uOtmFM4FFmYmdCpq/bM1SuJW6BhS1
	 fGlC0vCrxYmJhTTv8EAgeip1Ddy57poTpvOujAar4+YbjdO4xoRBuYbOJnNrcLW270UjM
	 ngdNpAFYkAPMYBNDFEzQ9DFhTn0B/LNpqwzMLTjzGOLIz6G9RE+0yP32CxpfyHpOMYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpPSoa5Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6329606A324;
	Wed, 11 Nov 2026 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpPSoa5Z
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794385655;
	b=i1Ut91JGq5AGjcaDKvdOxmxE1OcJz1fvHWuZORTVqyV+ge4UfIj7cGX1HX0O/yRCCJT2
	 zMGfxUOFntpds6jA6sJ71ev3Q0ujJpEX2wWffHvUg9IH9l8x7NUz0IGIdzH4KZPsiCoXK
	 KO/2iNZu/2eJGuTt7kl6HhrrRx2KyS0J/oY/OWeLWvgmoRW/L7YjaSmCZe2IqrDLlfS6K
	 ATQ+BGrhotS/0jF6ICmZwmh/O+6k5g2wEn2iCoe7HoTYuroSYpLrFEmlceLir0vdjmYuh
	 KWWh2M5ekX45qXf/tmeaQuGuiaxsKcpOnWcTkyrojJlbxGhz0G2mb0DEMkiI2UyVaIw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385655;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=duDFZn/9vifFKrXrrq9JNvuX6O2EDASRPRiym+nRd4U=;
	b=Pm4fYJxdnRYhtl4Yz8EpO3vNpaQa0vdeatdRvLZny8cAC9bBM4puEEp3XC0wz++klkGt
	 eEsdI1wkiMD0YcLfM1OvUinWzzujWa2IKVFHqRB/ZYGsi3LxCh369XOzTNaK5Ygd76LFP
	 Xewyz330+9fo3UBnFiIURk8izfuJj2OBUCyPKF7KIMSgyaL3luC26f2YmN7UrQC0r/gVa
	 IKoUzWgK9bqUJTCQN09gifO2WZ5HaK5Fdr4yNuuoiX9TDO6mV9RDOZNEpMrBRdwsJ4Dh4
	 BQec8lI8V3gUIUpJXfHZbzpZrbXo65NvAb/+WcRZYS5jKeDWzcgeDcNptdp3SBKLTTg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB7851F00A0A;
	Wed, 11 Nov 2026 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385655;
	bh=duDFZn/9vifFKrXrrq9JNvuX6O2EDASRPRiym+nRd4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KpPSoa5Zran2TuHJLm7a93Rmdf43xOicSOLoUZNY1FD8Y06n4uK5FBpjg/bSJ7lRi
	 u4B8PdS7/H2ijccr51lKA66DgLZcbuDgtCWKcUW7nYq/N1Kji8+mo7ilyDJHDBpXmE
	 gcv42smzNZbNkVcasRWkh4enU25LR0UJqEOtt+xbJ2iKT2VXzoVXC3B8ZRWCbx7FPq
	 QOC9uIo1NUcvDWdkS3ofWNPWrFfp7B1h28oJUXe4YsVl9K0iK8UOrGj/nxdffqJhIo
	 LqbELPCzrvX8qdbgXhR9KfCbraLywywRwgbaMxIviHz3nX4S1BeeUqcniAPuuqrnBO
	 GW3lRIK0l8DNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4F02148EA8;
	Wed, 11 Nov 2026 08:27:33 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Wed, 11 Nov 2026 03:27:18 -0500
Subject: [PATCH v2 4/4] MIPS: configs: Add sf19a2890_defconfig
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-sf19a2890-mips-v2-4-36730fa4f5a6@telaak.dev>
References: <20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev>
In-Reply-To: <20261111-sf19a2890-mips-v2-0-36730fa4f5a6@telaak.dev>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794385652; l=1372;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=jrZFDuNOVQSJQnzMtSdYByrN6lytb/mj6TbF+QbIufc=;
 b=fRtO233xcWqqziTzm7CZbFUCGAVR2y5D3Xox+oMdW8p/mwK5zwVUX5a6KRuQOxjRy6kUw8vgI
 z9/NHHJC0mRBBDIume8oj2+9/DTpSrNYE++HxTwRz0LVsRNbKyuYsL6
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

Add a defconfig for boards with the Siflower SF19A2890. It boots with
the device tree appended to the kernel, as the GL.iNet GL-SFT1200's
U-Boot passes none.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 MAINTAINERS                           |  1 +
 arch/mips/configs/sf19a2890_defconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 23ad08c7d8d1..4c8daaae5501 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25704,6 +25704,7 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/siflower.yaml
 F:	arch/mips/boot/dts/siflower/
+F:	arch/mips/configs/sf19a2890_defconfig
 F:	arch/mips/include/asm/mach-siflower/
 N:	sf19a2890
 
diff --git a/arch/mips/configs/sf19a2890_defconfig b/arch/mips/configs/sf19a2890_defconfig
new file mode 100644
index 000000000000..ec0992ac6340
--- /dev/null
+++ b/arch/mips/configs/sf19a2890_defconfig
@@ -0,0 +1,15 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_MACH_SIFLOWER_MIPS=y
+CONFIG_MIPS_CPS=y
+CONFIG_NR_CPUS=4
+CONFIG_MIPS_RAW_APPENDED_DTB=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_TMPFS=y
+CONFIG_PRINTK_TIME=y

-- 
Git-155)


