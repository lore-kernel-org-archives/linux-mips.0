Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576491;
	b=bAni5j2O3BXo8n2yhbtynw3HLD33Go4mLYn+zFfNnAkYKOzHyxcz430koar8BueL+ME5
	 gni9XkxvZePN7PjFlW4WpGzLB4U1Qi6AnIFLb8KnwXZJSdYrybYbbbeOoZBDnlo0Xc7zu
	 7qdfygT9vRxOmGC5oRvpgK5DQ6LZphXvJACppMs7kz1WXxphjndYIOF9wMFwjV9p5E1yt
	 bqf5Yk2fcz09UqnlG2KOEUeCkHcVcSoF7WrMDpapFYAu60ywvMZrBCehmDzE1VwpWvHuT
	 ysqOflSA7ynOGddb9wIakN64zdyXV8iIhK60iQxW3srcRcVn+/kkrQO1uzJ8vMqaO5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576491;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=9LjiGBOCX96rSSNvEfoUYGWvZrwuFjXNaoxWrBLQT6A=;
	b=OQ09DGtX5hd+sdHBT+4zx6P7PrNpcBY/zKHUDZk+6PXDtJWbbsfis5GNkwp7OmLB0kv2
	 hKtfScRkl3UfHnEgx8hb0APZmd9IjlwXQ7mP9OfcSWv0mWKhRig/DVtJQCZe7fqzGqiGg
	 MRhJg1MtYTxbokDDnrpMih3w8yiGdu2PhPTcQI2FMRRKfATFF9TbeWmtsGN2AiI5gOxYZ
	 XiubUsdPkUhSZkUMb0ZrPasLMKhgrplUTlYgVbGZIHsLCKc+SFuBWnTyWBFUNPvH36k9i
	 qpNlXu6Ld6xsBcvRo4RsbAPG83dU4HbcsOI95OHUhE+L2zUk5jL5H2sThYj05Yuuf1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=N0YpG+6V;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ov0C+g5q;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9D960A6F65
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 13:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD9D960A6F65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=N0YpG+6V;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ov0C+g5q
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DA28A140011B
	for <linux-mips@vger.kernel.org>; Fri, 13 Nov 2026 08:28:09 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 08:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794576482;
	 x=1794662882; bh=9LjiGBOCX96rSSNvEfoUYGWvZrwuFjXNaoxWrBLQT6A=; b=
	N0YpG+6VotxmnaMHi3/JC2VdweYEB7M8XRDkaof1NUGOOcd0ZBtmR9r/lMmcYckv
	EOcvdPvz2o3IaVYaMO3UffHmetwLHTJ0/3zxtjhEQd5VOdayFxW7UIrUl/pxJNKd
	4kdMs3Jz83wfA/zXnSoxeXAUPq1WyxtvKHIO9qXFJyC36EUUc65djl4ts8Ivz85H
	u8UII1h0IdXQ12zdPLCnAQmAde50Da7Udy9ijunLM57mxGQzxKxhIpjWznZOZA98
	87w2sRKcK3nYCP9x5vxmWKyuWJ1X8G1RpuLB9N4rushPYrIItGdsfDK/CdWIu7an
	VxxuUBie12c6guR2UrRnvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794576482; x=
	1794662882; bh=9LjiGBOCX96rSSNvEfoUYGWvZrwuFjXNaoxWrBLQT6A=; b=O
	v0C+g5qI9tqFVe2d85pPGKqA+YvASu2BW8zrxQKSSqQg13rvrpm/2QZNtgQe2OM9
	g2EfTzMrDzcZjjkyd7gSjpYA/0LBhZmezlnCI2vxI3EYhE45NbG3LIBWMqVU/iVP
	6JiBhtl6gHglEpqIMgGRtMffnrTbdsP6VMpglQMXLWmf45DuAW4NfrNB6TbXvrrH
	B11c4W79p65GZdDuB/PrluWyuQfZAUUu84klK530xk3aXBqqN7SbP/f7/lUTkoAC
	GzRlSVJjJKcXLnzXJQQPTbGT0A01XL1PvmBSdNF8d3htGwV+NERn0eyC59qvetI3
	J7rQuIqDwG3GO1vl3dr9Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794576482; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:ch24h9+OrdJgYwDOlVZA9AwejN2abn3u1znlF3UugLGmWq+
	p+PgY9XTNekkPPYdz3PdwdaRxiRHFS5VmxaEyHUX9FDl+yEOuqVjMebVf6DmAa2X
	2qmMl1Zomo3my1ZFfwxKsJIUhDy/TgkkQp48F6J3t5NA40APhYrzaLw4bmyiAx/9
	1nzINT549NRnXywIKttAtUaC0nifP7GzsWw7Eyh8wA/odd1+lkbpLoCbQ0QlwVgM
	pACEZx1eODB4MiNET36yNVWDv3lFTJB9UJKdE6k6swYskSUU4Wji+ZNlyAV4a8id
	zZhLCVl4d5dq45fAgw7YdpH/lc89WfTwi+ZafLw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:+RjTD/Q6NsCEgZiZA8pRig93q5sJxLp5l6HZSEV+DLA=:O/OcHSU8JkRF9PSdP1ksG6mZ2UARTkzPpJRFqU1qOjI=;
X-ME-Sender: <xms:WhD3auR40-FcGgLStJFAEfcRvrMX8H0mvFM410_VV1FS_ePeLU19Tg>
    <xme:WhD3aukkZitBMSw0JDPCHF2enaff40UalIqHetZytUZZoz0QwbSiM6fvxx0JiQ9ex
    Hyc7pInqRfaKe6cOLxuInmZ24kvcCI314Al9tWrn7W61VyduTfYvOtK>
X-ME-Proxy-Cause: dmFkZTEFJNUm4FXXB3dty2rNQcE/EDDYqXdEkDcBe16pFUwLRr8Gp2x7ZSZu7gpf0p9f3Y
    4d3ODBGKp/oGuX3xSeKhp3H+liRpNaxKLVbDIUNvU0I8zLx5fVOuQww3Hz2rhgRfM84oAQ
    8k9XMWFDehywM8dzGAaWn0vmtnRDaTStO47BqZE5YhQVXiLdlnIY690QOItxDwiBdv9MMU
    Z7UBxInI0ppBw6Hzow2yH3bF1UoA8At/iSCZ/JZhU5L9ecn3HGyThco2v/BekIAmvRmWJn
    nqjGEapPHQzjNwlOabfCBHeMGt0FdoKp8KmgOym8Z5y0YmImYFgOmkdj7tnXi6IxKTWRD0
    FbDPdpE4QNo6ffD4xFhSS1Xh34bByPoh6wcTCQeK3fm/52BwrTKvIEyJHoO+HeR8MyM+W0
    NyMk8FRVDuj7m/xh9ao5EA7sxN/q2x+5PRZ26NAHI/Qo7U/0iWi1x07RBjIQhu5ZVY7A6A
    6llRu3LXnxwAf2QcHbVGqiJAj83dWlPQssUKTurtC84L+XkNoEuw4KfIxLQHwoyU0H3vW8
    q7+OKIuSNeUqb4GIfWSfcB5DlxiE+KxnQrb/r8Nbe7Ocjyr7+oCMrSVg2CuiLbOshXKZWu
    eE0hF5SgnEempN0hxu1pQPY2zmLIoXsGm/rC9GYOfy4sdCJD92ElePHltaCg
X-ME-Proxy: <xmx:XRD3an1fDyF-neVerilFGd5u0Zop4xn_s-2N7L6zT8xywKb734yc0g>
    <xmx:XRD3avdB-CET59b-lFOEC3kIhpBrb1VS0j98K6ijbHfbYkv_YljGyg>
    <xmx:XRD3agY-q1NvVxBmJthtyWKnQP9znqQPX5d7i8tFfmRNv17Yxic3aA>
    <xmx:XRD3asVKYxec1BSUm6fqriuiDdr9xHzbjhrW20-xFWGhJQj7zhit-Q>
    <xmx:YhD3apEu49FoFTAFU0avFw9DZejfgIEmbd-iCLg5FOUGeyh2yVwZFjGp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6893A32A0099; Fri, 13 Nov 2026 08:27:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A1iXVo9thhaB
Date: Fri, 13 Nov 2026 14:27:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Davis" <afd@ti.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Philipp Zabel" <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <c7d332ad-09df-42ca-a73d-2dc48ff2c245@app.fastmail.com>
In-Reply-To: <20261112214223.765100-1-afd@ti.com>
References: <20261112214223.765100-1-afd@ti.com>
Subject: Re: [PATCH] reset: Remove ARCH_HAS_RESET_CONTROLLER Kconfig symbol
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 12, 2026, at 22:42, Andrew Davis wrote:
> Many ARCH_HAS_* symbols change some behavior based on what an ARCH
> supports, but ARCH_HAS_RESET_CONTROLLER is used only to set a default
> for RESET_CONTROLLER. Those ARCH symbols that select this can skip the
> middleman and directly select RESET_CONTROLLER, and many already do.
>
> Replace all selection of this symbol with a direct selection of
> RESET_CONTROLLER when it is not already in the selection list. In the
> latter case when RESET_CONTROLLER is also already selected we can simply
> remove the ARCH_HAS_RESET_CONTROLLER without changing existing behavior.

This is fine

> Some ARCHs "select" this symbol when they actually "depend on" the
> RESET_CONTROLLER framework to build, in those cases the indirect select
> could lead to broken randconfig builds. In cases when it is not needed
> for building the ARCH code, these selections can be switched to the weaker
> "imply" to allow it deselected for minimal builds without reset support.
> Additional checking will be needed to find such cases.

Please don't recommend the use of 'imply', this is rarely what you
want and everyone misunderstands what it does.

If you want to have a default, please add another symbol and use
that as the default value, such as

config ARCH_WANT_RESET_CONTROLLER
      bool



       Arnd
