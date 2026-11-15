Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794770763;
	b=s2AS8KpCW6RKY5LODaXCCXrGsyiEC4DJ4LnCfwNbbgXTLCx0gECOf0npjlBapPA+7fgR
	 j6/JxL37p+Dt0qviouH8NQTfzswz3I2tB+dbptC15CNlyw1zc9TMcb7fDY4B6OaMeElZ2
	 w6YmW+uyqCrnrEO8LK4w8aR2BAxvLNRKRkOtjyeeyxQtE5zFVdtAJANeYozugdeu/0ova
	 LX9WQZXNL2ndm52tX20p1O7zeblLoQIBB9ex9EDgR9KMxOvRzr4n4WD16inwKsj5qOPIn
	 HUtQr5neWMRXvVmKUXqN2FKBCMOYdE2TgDTb7XDIH+QlYH39tA2g5VRndGFfzPx06Qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770763;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=SZlXnOJ2ipQNhSON5gMptolkL7kKMOiRpRLHivkQi2A=;
	b=RR/nsnaYdiyXWcCEpKR3/RNX4ctuGjGE+nyJZttNVJfWSL4hIX4FCRKKgSZCAjCAge/r
	 6j+pLEcC6N+1wUFpUiYFwiM43GaOF1VIQU+MZsodgSN/rh3FeNF8drvQ/TrGXDDTsJuYG
	 0T7HqSuUfkzbCLgp8IV+AMOJOCtLSXtASFhutD+ALkEieyoHOHeKQcLgMiTgTMOsYCL0i
	 2YoBREoh2VFm2Shk6CLc40KOCbdSIR5TI3ybhTepXE8MEJO6H2S3kcITd/1RlzKocKEhI
	 bng8tZz7Ar6csTPd6UX8QOjFpNqaRmeSyx+rqWLexn8XuFXemNfbdvhF0EZ0kAmTCRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekYL9ZAd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C945606A329;
	Sun, 15 Nov 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekYL9ZAd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794770763;
	b=ljyVkKvp3pPLy87ndXTmKkZc8lqknW8/S7UJrwtz0aJTgjIoPVjCDF5uJJjss5B215Wa
	 t38fUHFHFiS/SWoqyqy4rFN6wPxVxid+OQkMvdTd1P9jTCBPFty3UOAF4Pso3YA4+EFRP
	 DXrUlHcwAnalJIbVYEmPiFA4P4hJofoRICoKqV/JbgoMsTgxx0R1Cdyv5DNetWi8K7vhr
	 UDSprY23vSnjklo7lxtAQTL52VBb2E2B+uhevNb5NxuwOyqG4HY8zRAbpXvZ6Odno4m1y
	 ExYmyHdyoOCzhEwtCb6CcNzKYx++5R3kPaGhaaKT8okkg+XhZ0BEvjhMAa8y4c7EuJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794770763;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=SZlXnOJ2ipQNhSON5gMptolkL7kKMOiRpRLHivkQi2A=;
	b=DU8SjmDgvdfEPtnmeJtzNUGF1a/Be3kQBsnl5aLnZ3ellJmzp5pu3N7jfObazmB2p40k
	 +Kf6vainBSINvGk2KyLI2/7NAcFlcp0F0iOYKKC2NGnzYYKPSROu3PeouxoyMdsw0pt8x
	 loCAscgCD6MQLUMcB6cXfaeqxOtj80BrHm+z7j7y4emTwe+ThACoZoMhTFZXI7CQg4ldX
	 ULUxPEsJA6UeFRzNgRDrxivAMIeboPYBZ8XocxKRZtDocztUsF/I+VHiQrXsU+7hd70Rk
	 i2RXvP5CvlCbQPgdNjO9gUVSW8+iKRDKoNiSeS4OUbNX8sRAMdlSmINPoDM0zXzTWMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EA311F000C4;
	Sun, 15 Nov 2026 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770762;
	bh=SZlXnOJ2ipQNhSON5gMptolkL7kKMOiRpRLHivkQi2A=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ekYL9ZAdcIRXabaqsjAzxmnl0UBbdGOV/7X1xZbPPs+emICIo+OftUyldfkegis+o
	 AM3ilRTBSE9kGBhDMaYGmZgTW2ZSvWAmEYVWHQit7j9eOnnEw5NFgAcDNXenmXWmq5
	 Q+Z+tntfhvp8PF4tj8XPNhHTrsuYRqn2Q3TnteNNvbt89gYfXiPLLhnv2IbbUxVEzF
	 uoOB4RRGWABWCN3DyzfDMOSx/39OC0zmtbPXztiLKKotI+ZuGukd0zh7gau8m9PEm7
	 tGnUHpeFq3HJNXiVqSOWocP4rsUPl03m5NdrFvS1ps/yvqfkAhwiA8QkHQkYG5McLE
	 BOKVBrB+64ZxA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7080F4A160;
	Sun, 15 Nov 2026 19:26:01 +0000 (UTC)
From: Akshat Singh via B4 Relay <devnull+automobilehacks.gmail.com@kernel.org>
Subject: [PATCH 0/3] irqchip/econet-en751221: Deliver odd interrupts
 without VEIC
Date: Sun, 15 Nov 2026 19:26:00 +0000
Message-Id: <20261115-en751221-intc-all-lines-v1-0-dc03a40f47f0@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgH+moC/yXMwQrCMAyA4VcZORtYIp3MVxEPbY0zo0Rppghj7
 27V43f4/xVcqorDsVuhyktd79ZAuw7yLdokqJdm4J4HIgoodgjETKi2ZIylYFETR477wIFTn8Y
 MrX5Uuer7dz6d//ZnmiUv3x1s2weaewXKewAAAA==
X-Change-ID: 20261115-en751221-intc-all-lines-2a35252b0b9c
To: Caleb James DeLisle <cjd@cjdns.fr>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Akshat Singh <automobilehacks@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794770761; l=1983;
 i=automobilehacks@gmail.com; s=20261115; h=from:subject:message-id;
 bh=37nXMvHe9COOysw+x+zYU6STNDAgT/YyB1vW+x/B7yk=;
 b=uT2JglyePJzMDk4/2T4qCA1bMjsDQ3m0H/e5/goeML6gCtolC6/TMhF00OFbOihB05ndcW7Zl
 yQcHmxFvCz/BUDUrVfPml9kFgXquydbW37lc63I8vHzQyO8bn3ojjrm
X-Developer-Key: i=automobilehacks@gmail.com; a=ed25519;
 pk=wYmYXn6wy/XN0edTCg6D7UtE9nYLei8mbfqydGGCdf4=
X-Endpoint-Received: by B4 Relay for automobilehacks@gmail.com/20261115
 with auth_id=1535
X-Original-From: Akshat Singh <automobilehacks@gmail.com>
Reply-To: automobilehacks@gmail.com

the en751221 intc puts the number of the pending irq plus one, in binary,
on IP2-IP7. with VEIC the cpu takes that as the vector, but without it the
driver only chains IP2, so odd irqs (qdma 21, xhci 17, first pcie port 23)
only get handled when an even one runs the handler, usually the next timer
tick.

on a nokia g-140w-c the 34kc doesn't report VEIC (no veic in
/proc/cpuinfo), and ping to the box kept cycling through 1-11ms. chaining
the handler to IP2-IP6 brings it under 1ms. VEIC mode is untouched.

tested on the g-140w-c with openwrt's 6.18 kernel, where the non-VEIC path
is the same as in mainline. on 7.4-rc2 it's build tested (W=1, no new
warnings), and dt_binding_check, CHECK_DTBS and checkpatch --strict are
clean. Caleb offered to test it on his boards:
https://github.com/openwrt/openwrt/pull/26744

Caleb: arch/mips/econet/init.c says the en751221 is a 34kc with VEIC, but
this one doesn't report it. is that something the bootloader or a soc
register turns on? if VEIC can be enabled here that's probably the better
fix for this board, but the non-VEIC path should still deliver everything.

the binding patch has to go in first, the dts change fails CHECK_DTBS
without it.

Signed-off-by: Akshat Singh <automobilehacks@gmail.com>
---
Akshat Singh (3):
      dt-bindings: interrupt-controller: econet,en751221-intc: Allow up to 6 parent interrupts
      irqchip/econet-en751221: Chain the handler to all parent interrupts
      mips: dts: Connect the EcoNet EN751221 intc to IP2-IP6

 .../interrupt-controller/econet,en751221-intc.yaml |  9 ++++--
 arch/mips/boot/dts/econet/en751221.dtsi            |  7 ++++-
 drivers/irqchip/irq-econet-en751221.c              | 33 ++++++++++++++++++++--
 3 files changed, 43 insertions(+), 6 deletions(-)
---
base-commit: fa2933aac170dd19c6a7f0d7b81a8f537e40915c
change-id: 20261115-en751221-intc-all-lines-2a35252b0b9c

Best regards,
--  
Akshat Singh <automobilehacks@gmail.com>


