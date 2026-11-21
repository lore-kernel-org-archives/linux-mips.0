Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795275183;
	b=pq8zR6y8cfoYtgVX5c69vZ0Fa8SiljwlRMYZ6XXI0NG0SPsDm8xmdhX5zMdwSlAPR3MS
	 fkViogz7gJcoacEItwk9NDksOHhNrMXcuD6yCoSyKYaD1k+C2PdzwCj+H+IQnOZgR25gl
	 fQJtkUSklH9bHk3H/RLhvXGnnjJb/14o2PiYi/c1oP1auNJhlaFiWKbyVVuu6G4vXgOoh
	 k9AUviISnvHZ7plBewB+MpPsV2u26uApvCfHoa4oAWFFd0xJlW4oq2QZzsqlsdlaZn2BZ
	 Jc8BdD+ZCu7h+W0UehM3JMZ3FulbH9S+/3C38iZI/JzRjexwaiIxt2qXI7kRqVZdHCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795275183;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=vUHbwCt1gUBPm4AL4aKrqCS0BGBxDO7R03nJZSC+zeY=;
	b=BQV/AJNmm5MWssd7vPlsuN8vFP2gYezTbhPFwYgvq3tkpl2MzK/urwp/isU5vZbESpTT
	 X5DvhbVaGybbJD3pS2H27hi8gvt9/3Of2zM9NnlKWWRx2QNlBK7patdF+r3YXXL3YQgK3
	 qq8g43y5LTcdIOnZABkFQ/8nQ3h2zSRjojHxJRPhMJ1sVMbMXUSv3pjayVv55tPlT92TU
	 693UclJ2feYXJVpK6ListIENwP5xABFVxhRfQwYzjmf0Cx7gQXnbdAsYVIlGH2KkahKrQ
	 VSVMMtc93TCX16DTAJBCjbwdnj2p2BinfHejP3fD+h4Momm4sHd9RmWiZJ8OoM3hwTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FETeDNtN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6554E606A320;
	Sat, 21 Nov 2026 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FETeDNtN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795275183;
	b=Ha+JSxnDOWWGSR0dGezS9EL0L34iWApCziQKtT2cYWusPw/Dei3nmhjBszc4+X/uFk0W
	 M7GZ5Jq99s1G4BX085zSCLyftwCOIjeRQdFoGurUamOrjZ93i8lo56Gou4oSNMZ5eCWZo
	 T1hRqEaJReUAZ3IjbcwZVod7yXHy8ntq1o38DgyNY3+ONEGk2dmCiIb1gMR4mXw2uXFXr
	 44U3IFYjqabHqWKvu8hNQBFgJttol042E4mmhS4ITbMDGO+4wpaFyuiXQwPELomkX8JcH
	 gjLHadGFFIS+ZsoOA4NQspS51krsxboz6xVX6UPfxNSMjk8dDeTyINZ++ySMgpG8cdw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795275183;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=vUHbwCt1gUBPm4AL4aKrqCS0BGBxDO7R03nJZSC+zeY=;
	b=oM+jCx5rBEo9twBYjkiYO92KXgXPd8ml6OAlHadXOSW2lZ3Jx95NlRTtWBvC94vPg+cM
	 JhKS+QfN1h60CQNi5xZknxd9VUQ6rEfvCLpqddvJhhrU5OrUKG1C5MhYuLoPpFhfv816U
	 qWwt3h2IdR9kNhEyxgw+d2sKTxK9GOruSTUurXuKw66kfeS18awlmQQ/EzZqzeiHvFt2Y
	 EJsz/Jp10u0v/GZAU0foJNqGmNT4T5wSJb5HgM+wanu4jtuqvp2ptVWQAtG0KcNpASmAe
	 mc+lcl0Zx0vemH/tpi3Bz6tBCRJzQRaFa11mFy1jc+TnbBkY0zB6WacUYonZktkT49g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A9951F000C6;
	Sat, 21 Nov 2026 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795275183;
	bh=vUHbwCt1gUBPm4AL4aKrqCS0BGBxDO7R03nJZSC+zeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FETeDNtNgDSXC0HH+esF5M2g76+RFWzLxy9WAcdEhSbIP3Tkro44NUQgf3HZsWq3a
	 hEiS7D46dn8/qSH4ckYWSolEXJjGadjyHVsB2TPUIw3ZWKSL44ERl5r3lJ5IRbpHRH
	 zllsKLCd/ERjUyI1BaKoOWkvwPuSHArAgMdaAw40wrKzPO9cmYelgOyOMQvOhI/LE/
	 iMUVOZvQUw8uycjSTWQzIXO01l/4MHVHc4WHG/dU9LxnAKe+WTxp7HC2D0zIJN41Yt
	 08nD/0riaenxwQlsrPjdx7sYkSaSMGK62cztdEgvPtVJymjGcfGrmIizHyI5zhXmR+
	 YJGjrIqa9i/Pw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 09B954BCE3;
	Sat, 21 Nov 2026 15:33:02 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:33:02 +0000
Subject: [PATCH 2/2] MIPS: rtlx: Call finish_wait() when rtlx_open() is
 interrupted
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
Message-Id: <20261121-rtlx-v1-2-bc05d6763ec1@gmail.com>
References: <20261121-rtlx-v1-0-bc05d6763ec1@gmail.com>
In-Reply-To: <20261121-rtlx-v1-0-bc05d6763ec1@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795275180; l=1294;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=JgIEyO6aUO99OgeO8YLTPRZSiqUg8Z8PnNHmmpccaUs=;
 b=ZRE64yLtB4g7UK57d6Ub5C+FeZeabJw0hXAmX9dHszWGgo3mnRLduQpqWoTqe1juvQx8m2is9
 nYkLp04QW0YAkPrIUkZvboLSBquz/yjUF4FmCl8hMuXuazcU5snY/jt
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

While rtlx_open() waits for the SP program, it calls prepare_to_wait()
with a wait entry on its own stack. If a signal is pending, it leaves
the loop with:

	ret = -ERESTARTSYS;
	goto out_fail;

and skips finish_wait(). The stack wait entry stays on
channel_wqs[index].lx_queue after rtlx_open() returns, and the task is
still in TASK_INTERRUPTIBLE state. A later wake up of that queue then
walks a stale stack entry.

Call finish_wait() before leaving the loop on a signal.

Found with a static analysis tool and checked by hand.

Fixes: 9e3468202657 ("[MIPS] RTLX: Don't use volatile; it's fragile.")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 arch/mips/kernel/rtlx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/rtlx.c b/arch/mips/kernel/rtlx.c
index a1da56163f19..d5ea99bde129 100644
--- a/arch/mips/kernel/rtlx.c
+++ b/arch/mips/kernel/rtlx.c
@@ -138,6 +138,8 @@ int rtlx_open(int index, int can_sleep)
 						schedule();
 						continue;
 					}
+					finish_wait(&channel_wqs[index].lx_queue,
+						    &wait);
 					ret = -ERESTARTSYS;
 					goto out_fail;
 				}

-- 
2.34.1


