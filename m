Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.242
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158652;
	b=meqf3u3rJnwJbk4HBSLPWnwkwcDt4anve4idviVl99uzNlppEZ8CsGnPF68m7pssmDK+
	 6IOYk/mNe6piJpX3YlzOvlPz/X+aOfeZlwMgO8iAeUHiPTvwSPLTWDnjAapvTdCqStJIc
	 IlPofC2+f9uiymWBugneGESGvm8DADaAvd6Qsy7aVQDy/emxAwj3AgHi9iDePrerTpCjl
	 zhNJOgZBHYPsjvEThU0ONOe9OXVBtiQ4c1AfagkMnVIAA3nr5I5Nlxe+UnOCRITSlU12l
	 3syIL3W1Ydjp/sZFhznPjkgPoUJrRXQHQAK+LPgiubGkVB5yDm2N8hUthi1WuccyaQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158652;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:In-Reply-To:References:
	 Date:X-OQ-MSGID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=0b8pS7EWD3XHkPrQLqMzimmGYgo96DFsdxG1lwkDwgY=;
	b=l9MmXFSuehDbvNxSX2lNdBDPB9EfAmx1ldLLVwf0CWi9IzvPBtIu0C2xfm6MblR4WlJR
	 J22Nliive2vJ6Y+YrrHVKY+MMDFKPU2wXk8L6y8419Fm17dfPRUMoh2RmspvfhcuaXVie
	 Yp2vebWVqtepUz6BqZcatsanyCD8JhFpl4avKsVZyHtVMTdopm4afJMRm5dxVczNFyROp
	 OQymQ27HYQZVvSEXMYVH9gkK8fRGZQNE9A4ZP9WxUPyehYA70adAvNh+KWE0O6Y2mPIG8
	 36fUbL4iAZ72VnhMnhc7N9kozh7tLjsDUxSAgd6AdhFwwKdPazbMZHhmT2iuI/d5LGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="nS/ZZOnw";
	arc=none smtp.remote-ip=203.205.221.242
Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8AF606A320;
	Sun,  8 Nov 2026 17:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD8AF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=nS/ZZOnw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794158643; bh=0b8pS7EWD3XHkPrQLqMzimmGYgo96DFsdxG1lwkDwgY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nS/ZZOnw28Rr+3Gmmm50LrvL3F9QXGGyL6fefJIfRWQff3wPpmEunlw0zKqp4TrIO
	 Oyg3d1LwN41kJ0eGzJm8IHQXIUlTFFKLUWRxqZc8AcgmPq6PKk/pASxenSMzAUtbSY
	 1rvEOXt1DFStARNOH7pAFZVjufSS05UNueREW9v8=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5F906C5D; Mon, 09 Nov 2026 01:23:57 +0800
X-QQ-mid: xmsmtpt1794158639twzz43hgg
Message-ID: <tencent_347EB4680C325257C8890470FCD7A0B2A105@qq.com>
X-QQ-XMAILINFO: OLHLRPgEm/lFdJAz8vaQpSvtTCsvGZUTg6ICSWRUqdw6nYO+oVQJQCEADIeJUQ
	 xfR+XsjxYdjV983AUTJFMn35YVK27IJF09L9QMtgvDgiZwnDhC6tlmFl+J4dPh9drvN5RT2+oJsv
	 /xpiF+J6Kb7PqI1tPYrbSiCxG7k51w0qnW6D69eTSPYtc46dgTEuelnMjuwWGO2iCm86hBYJ1gP1
	 Nq4ygC16ckiLfPdnheqPnYtNBcJfGDWG05RrwwSVBXwPoi1z8chrC98m7+cYl+xhAXGZzk18EWDN
	 WXOoUyMYyNzDWZom8xK1PTfImjtozYVT42N5QS+6NWwRKUyVF17B2UDXkD/I++2gV3Bwqntigrgf
	 USQREURidXI17/4xEHCNbysqcIX+weQmgw7uYe0gm33ml/wTUblFvpxbY9Vb5XEuDPfmsbwzDhGE
	 VA1X3Dq4Wq2Hn6Syv6q+vNvM1fiPiqFT6Lg3rZ7aT5wBKkuvpllR+ImToV9QII0+NJqX+SDkV1yq
	 +zSPN6WWhLaHdwiCoyfkg5OLThQYnv3/ZTYXCIewjj8YBjWuWXpS4djaCDNPQIvmcry913Fv+jCd
	 Yfa5lZLYgiahdX4PEcUxQXIGgYM/r01A19rNn4htZlsUFKcVrCDzJ44FwbqLtGc8wSgVxksEUqe1
	 OopbdyXfvFjR9aRygKWAdLM9gDLUMcoWgZkR0FQH5wU5b5aZngrPY6RPutPzajN1gpGPA32WUmxD
	 LTXtIc1DWH1/KPG/kRqc2M7eWF6jx8rfpMb3mjfClQklKaeWCle2ai6zU9/UDC3Qcjl/9nqEYBIK
	 rdqd6yeM9MX0Qj3t9AVJT7Toy3whnXzyB3FPOs5H3nnG+V1XEyP5mkLNJhLaBdBOeHrVlrPHbv/S
	 JIyHf+HTZPwkMPoKAEFLaa+cWTmgCn9lPN5zOEpjHqn3DeGOMrPvE6OKZdi8CVmMP/ZoPvqDCTAx
	 1wTZQi8IBhcTI07go6R3aqe3jThywlDWanx3MlHLf4rr6LQkmlzzYjH6YY15QY9HveuHJ2amA/2+
	 WIED+x1BIEEFn6Ra/C
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Jiawen Liu <1298662399@qq.com>
To: Frank Li <Frank.li@oss.nxp.com>, Markus Elfring <Markus.Elfring@web.de>
Cc: Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>, linux-mips@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Li <Frank.Li@kernel.org>
Subject: Re: [PATCH] dma: jz4780: handle clk_prepare_enable() failure in probe
In-Reply-To: <tencent_BE00B17EBF2A95EADD8B80203B745B9C7609@qq.com>
References: <tencent_BE00B17EBF2A95EADD8B80203B745B9C7609@qq.com>
Date: Sun, 08 Nov 2026 21:22:12 +0400
X-OQ-MSGID: <179415853264.5.9453351927658731117@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Frank, Markus,

Thanks for the suggestions. The dmaengine subject is clearer. The current
probe path still ignores clk_prepare_enable()'s return value; I'll check
the relevant clock failure and cleanup paths and the introducing commit
before deciding on Fixes and stable tags.

Thanks,
Jiawen

