Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795275183;
	b=Vdn8iLG4BgURl67Jq2W2KlhMFGMnglBj4Ty017JHOqqPH6EaW8FPPoE7uFKFKer/gyiV
	 SmSzOMUqI7Br0q0756E/FpWsmeXPcTtsf5kZqy4jI8Y5w9houSAQMesmSqtmQYeqVXhXw
	 cdhfTw9HjeBCskE5CeOaU1HODOETN3gfDKguX5OgFZtBiVJsOfGd44n+VMvnGpFYGq9oZ
	 yJTTqvEvtnf9+A9hfhws7/8l4qcByO/TmWoNKtZwAsXhw4xplAsKZ3ho9+PHZhq1uxLK1
	 ouYhKCr+/V7xUtq4V2NCgFKkRbeGS9oKnX7JnSIFK4l+i23DePkoSi0NPWFknZUHHVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275183;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=WtWaISzwdQB788BIE1SYYCrMrf9mx6bn6Hchd9nYjYk=;
	b=m7DGRiaOMlPh/EVhoHGZ4i34k26ezX+Y+jrfpSjcUrCgCXiOpj/F1LF9U4bYWawNiGOt
	 HuIjEZ4HhpYkRZI4mlCcfaG9EZZZHoB1GbgNFLrrkEO7Xke3EyClFXcVmVvGbfutcG2ye
	 TSUhLbMo/j1hgR631Rpd8csnCu2rAIx2yxnOSsPTOfGMEWOvR592sC+m7jc+2ppZ5j6eM
	 KK7NoCAVHYdCn4iA6tEYndQCH887HdXPp/rz4VRBw/5ubvv1Cq6HQ8gUiV/p0ZEVjG1lq
	 9XS933Qm9Z5ZDpm0A+M8Zp5/JHlfUI6/yboH5dTVAOafXbUTJJDkg+0CFoNRE1pWR4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFwEdTqV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08D1606A331;
	Sat, 21 Nov 2026 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFwEdTqV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795275183;
	b=2MGPNgSFa4VKSclW9BYO/vz7bHzZSUDFuquys/49Xi0GzkuUgkH2UxeRMt3aWaNADDra
	 XpoQWhGMZf+dEWiEu3bWgGdtf3AmLkzCmbqV76EReK1OPx5hqsTe5M3RvLrNKWUaQm6O1
	 c9JheOw3DFwjRsXI4B0ua4eN0O1H1iFIgWkQRtvPkVDIPdX9lT9cxjmEu5m4eXRvvl412
	 dOcuydYArDDX5u3/0utjzMdjgwHhNE+4pLGU1w1ugb1ncU8DvAyWaYYH1iY0WN0LT2e68
	 wUM1xAJ2/NX7B9mgR3J7gweaFeWKOoH6CFsz9p21VAz5ZUyFrFAdkoZhQ4ysQK/0oEg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795275183;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WtWaISzwdQB788BIE1SYYCrMrf9mx6bn6Hchd9nYjYk=;
	b=IDkvrIFz9tj1YmuaLcnLmzoemE3a3thSr3xbFmeCeDokavB8hHSzdAC3rs3jIpRNjopo
	 EZvX0Z1DKFRqhfeSiue1iAnig1npHVeoaEbT+EhCR1kK/nA8z/ca18yOwnS+6Ysgxza77
	 lr8UV0X0WHnp5nB0PfXCMMUY9pvI7UPjDtjUu5V0hWVYWGiPK4Oax3OlFpeJU/haKvolM
	 aMQW2el8h7Xp625NJrkNLSYpOvkWkCHy7SATy1g7vWSPM+IS/fbr3LpsxRqA/VohyQkPO
	 mQHtu3/ElafnhFed/pHC0wxJWN3tbbhhciG5wUirGJmeQZ6OB8TCyRabknTS11RT4hQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5ED0C1F000D0;
	Sat, 21 Nov 2026 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795275183;
	bh=WtWaISzwdQB788BIE1SYYCrMrf9mx6bn6Hchd9nYjYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WFwEdTqV1SmumEqOuGHDwOpXgVvRr6T27JgUAuALjz6v0s1kPUoPybqHFcaTTPUvt
	 orJ8yQhlfOeGD1xsBlwzG7fkH/ch40dXpTPhW0Xi8o7nacIES3mcqCft8UvTz1k1Us
	 1kGSKzqLIgjQD2+dVnyKBCp8CFCuyO5+dKJN2coYP4dk/xzbaEgBNpWq2zjZkVHqZw
	 KBlACjgXP4yfmrdqZudcD6kQ1mYymfAy2LgEw8rOOExZY5YW/vCjYib3KmnPhRPsL3
	 vOQpaNSI15lqR4kBRL1YKBR1Z3VeIkFbvo1kTJ3rKGBDB5LLP8p/JQDJVkmMOn3VqK
	 VLnY36W1VJwNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF0594BCDD;
	Sat, 21 Nov 2026 15:33:01 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:33:01 +0000
Subject: [PATCH 1/2] MIPS: rtlx: Drop in_open count when rtlx_init() fails
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
Message-Id: <20261121-rtlx-v1-1-bc05d6763ec1@gmail.com>
References: <20261121-rtlx-v1-0-bc05d6763ec1@gmail.com>
In-Reply-To: <20261121-rtlx-v1-0-bc05d6763ec1@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795275180; l=1420;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=JD5qVzM6zgwsX4UmflbQor0ANyVYFEbJd9+2DIbxRVI=;
 b=5iR043Wt841g+UCP9SkKElIUd+CdajHIjhDXwDwTTnr8ZiXXasn0jhKEqwAzHjTMhgy440oYR
 KNRNolo1zd9Cz5oQRO4p3S2ZVHoVunO1VtIK28ozVuaAptDCAmRQay6
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

rtlx_open() raises channel_wqs[index].in_open at the start and drops it
again at out_fail, on both the success and the error paths. When
rtlx_init() fails, for example because the SP program has no valid RTLX
id, the code jumps to out_ret instead and skips the decrement.

After that, every later open of the channel sees in_open > 1 and fails
with -EBUSY, even after a correct SP program is loaded.

Jump to out_fail so the count is dropped, and remove the now unused
out_ret label.

Found with a static analysis tool and checked by hand.

Fixes: c4c4018b04f9 ("[MIPS] RTLX, VPE: Make open actually atomic.")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 arch/mips/kernel/rtlx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/rtlx.c b/arch/mips/kernel/rtlx.c
index 18c509c59f33..a1da56163f19 100644
--- a/arch/mips/kernel/rtlx.c
+++ b/arch/mips/kernel/rtlx.c
@@ -159,7 +159,7 @@ int rtlx_open(int index, int can_sleep)
 
 		ret = rtlx_init(*p);
 		if (ret < 0)
-			goto out_ret;
+			goto out_fail;
 	}
 
 	chan = &rtlx->channel[index];
@@ -175,7 +175,6 @@ int rtlx_open(int index, int can_sleep)
 	atomic_dec(&channel_wqs[index].in_open);
 	smp_mb();
 
-out_ret:
 	return ret;
 }
 

-- 
2.34.1


