Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696439;
	b=wSkX0XX1+R45K/OKvHoncgUEL7+ucdWMbA1rUGt0iWOBysnUzJko0Kauqr1pn9yBN1fm
	 POb74ZbwkW4LdqcZT94c4N8c5dfUx4zmQUT+5CM7gQm0p9eSbOuKyug2TG99j2hM8x47J
	 y4z8vWpG6Y3qwT5agrjqeZeRs08TcRe7lDf/iaF0k2Q0dlLm49/8mnYx7vR7IFz++ZZ4w
	 RvSuxr3NuZtWLILC3OsuCbMvA4fHxBxLA5O7GZEk0AKMMFK4pYy47pD4vgHuicTr/OWyv
	 5dxsPoqKRNRDSAJNH1+iFSMGLzJgNbtSSh7Jw+y7CiBUfKZ48RKPaeWeuz1ou5TFsog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696439;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=bxuO/eMtCdN1SSNjlwCQtcpvLlVffuhiDJmn+tcU5YA=;
	b=YId4y7K7V3uwbqekqzCrulmcfN8AHgAoq3hPrJ494sZ2qvYgwbzDHcbrQtVbAkAIkRq4
	 B3zb6c2INbtiuQv+nJ338+WFpXwXssiMOGNRp2anL6u8o1NgsaCcyLoWltEydKZNw2C8P
	 Zjha5omTstNxQxpRlcY3JTx1ziTUX4D5vQgdKwSHkACqT1U1u/JyY0my8WPTo8pBVK07C
	 AOZky8SUV9FhRNqVzb+TOccWGfx1sabN+ihkGiKyIf69sdV7VsDlXMLFgEaU4HFO5nsQp
	 pYrf1fhCP9GpjmRjxM9ma3gXYpCb5q/mUl8f6ntT2e6GyhPVYqHkZ3t3w65R4Xbv1vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=glider.be;
	spf=pass smtp.mailfrom=glider.be;
	dkim=pass header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b="Oda+RLp/";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4sg1hd42;
	arc=none smtp.remote-ip=103.168.172.137
Received: from flow-a2-smtp.messagingengine.com (flow-a2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C681606A31C
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 12:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C681606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glider.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=Oda+RLp/;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4sg1hd42
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 314F9138066A
	for <linux-mips@vger.kernel.org>; Thu, 26 Nov 2026 07:33:58 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Thu, 26 Nov 2026 07:33:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glider.be; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795696434;
	 x=1795700034; bh=bxuO/eMtCdN1SSNjlwCQtcpvLlVffuhiDJmn+tcU5YA=; b=
	Oda+RLp/+e3H8qYw4NF21iRG04zhSJTi9XQDRr4vP+3hAPoKJYLqdaWGL0kkGw9D
	UNIQ8E8TP/gQePviRLLo9FDl9pCMmREigTiYzbzfnsfo5wzTgJXEeFo3t7r0Kv8P
	YwU63FEp/LkDrv/Af+UPiRkYUp6brSXgC6Ww4UvMcm9KniAKT34BAGzPweVYxKKi
	z0V2j/3tKlC1tB2LkhvJ49boWfh2Tgz0sHXNYKwtjTb49LIHI10K72LHgQZmeGJJ
	RMdxTNvIv9TAjspxeBizMOCxpDGu+f0W1reP2EE6OdztfBzejGbLGwTJIe5jZ584
	wA572B8GhhUWNS64U3u8Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795696434; x=
	1795700034; bh=bxuO/eMtCdN1SSNjlwCQtcpvLlVffuhiDJmn+tcU5YA=; b=4
	sg1hd421xNPk+u2L1KnNse4L25kINhak5Y/5sDaCVgTNkw6+aUh41M/ioyAPVGo6
	+9nXnGhX2AaI3EUo15N9I1C/FCSWA2HpBlqXlgtcvh+fSAxs0q0o1R3qMs8ZD2Qo
	CZ4LkK7rq2XZ/EnPQKTegza+4lRR/Us18EMBbdsENfIuLnAwVj2Jm3ADX1/QILeg
	u391wZuMe3SspEk+VpkHyGHo7sQl9hAcyJYybPhYNPtQvC5wVSkQwG/DKfi4FNnj
	Rb/gYKexT6scXBDcGsrbFffaobPERquOhaHqGfN9YIYF5uvj84Bgn3APPcr6DctH
	l6OCaK7gchWQaT5oFe6MQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=glider.be a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795696434; d=glider.be;
	mf=PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg==;
	rt=PGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:Z0+yr2+ca1dWIyz1KVvuC4XcH5O9el3rDY/if+rm06TL06f
	M3lswUQC7Xo64nFgczwOmYRdYsq5XxRtpLL3FsOeVBd++e4NJicAqV6IjG8rJxdB
	T8I1YjY8XJ3TgZV/teAMY2mZPctYI3F+k0nGaowyzuL+819yWWl/ekDAqbOxHJHn
	bgN5UhoUTSbRmFWo3fzlEWNwiakn+tcRbluwUlv8xzo9TmYv1ZCKj5mOesAejAk7
	pnY9EHljLSVHt02r2XocxqjOExpHmHqlxqrPtLJzG0Wyok5+KI+SF4nBt/8Sc1a3
	GTdCg5fHeDjwfKzJPlSbdyzblCbJ+hVgBqBd8bw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ePTbHzscXAVZtn97Vp9Y6wtuwrL2+dR8EE828H4xdfc=:ifP9/9FSA7At88pXfkk6ca4U3+Cfkqb6GIuLmWGSff0=;
X-ME-Sender: <xms:LycIa7XhidQ-nB9zu3n4yuYn5p9czekissq5MaS5y-4C29-r8T-fYA>
    <xme:LycIa-aL6ENFvO1mvdhk-5rftm3VRfYBbr3dlxwnugwCih-wu14AxNEiBDrg_grvg
    N7oWtG_2Kwv6C4M6BqiSOtOkor0RpHj0eReWgkf-IkBPaBUz0vnJxV3>
X-ME-Proxy-Cause: dmFkZTE7xsRG0uNkJ/fpRuVbeafD4lJg3qKMhLbNyGqdspvhp33mDVa8EYKbye5565J4aA
    sxRv9AvKQPQhz+gQlvhgw6fvE/NgrsTb/Uzgu/jGoZR6DfDzSUJOu8fVU0IUUE7enqT6y8
    gvqjTBBqO3OxSW8oXAq1kJPNLANsRXkJxDjm6x7txVAbZNRwx0XW6i7WgKicUJHBpATgLi
    r6d9kyWwoUnEvh3y6YGi0Z4uWYKN1+Cv9OrRJf9CIfVWtyxT3fC2TBvj0xfzXz06RxTAyd
    zERb10lchC2QPil9D7xXfcOQjo2+ylVQlzqy4/hHXYnSsYksH5bnNZM7KyDJAFp0QDoWg4
    /1Z1Hm/lzoSTdj9IPL5tCKf6v7r25UPn52kMvMSSsKxEwdt8eSWWviZZA2Tt8eL5dbrVvT
    wuva5f6aOX33AlrSVRqPFXu3icnu8BobLGmtV6AaQxBX/hkTh+E4A3kzGPw4qAq2zLIL1i
    M9sb5m3WPX2tGgWGosq+yhL2MLMrAGV5eBo4AL1HycIocOuN63T7w2/T9XtfsGYVv9Oy6K
    Fe+wcLITW2AU62e/X2F6Ib8wjIWmyUTjReyFa2dCvCSfA3XddH7Xm/+GiZepNdUsgM4bmq
    K1n3X9Urwc6YUAgDYLgf0pNsxfb772pE1C2PAgMSHkpat+OqPDUD1VY464Tw
X-ME-Proxy: <xmx:MCcIa-orJND_s1N4vqP41D16rCUmv2L_X5VKBKcK9wCu7JJ1kZn2pA>
    <xmx:MCcIa2oMfPuRYCDagqxIZjBha-gGonP5cHW-KRUfdfw8Un2pBgJdGA>
    <xmx:MCcIa50T7wzzdSL0aum1kNv2TLVj3U1c7HZ01vQOTDJWuAWl3QMVBg>
    <xmx:MCcIa8Fl3miBb9SLJZZEq5dLIJWCvouFnS9_PlzJkSg-lEY0HqQxww>
    <xmx:MicIa-MJtW0dWsOaO70kMGMcMozMTBhjG4NkmSrfm1jNMnSNjtRFLZhx>
Feedback-ID: ia0f84a9e:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 64771F800A1; Thu, 26 Nov 2026 07:33:51 -0500 (EST)
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
X-ThreadId: ABkkc5LjRZH-
Date: Thu, 26 Nov 2026 13:33:31 +0100
From: "Geert Uytterhoeven" <geert+renesas@glider.be>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: "Arnd Bergmann" <arnd@arndb.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 linux-mips@vger.kernel.org,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Linus Walleij" <linusw@kernel.org>
Message-Id: <b2b26ab1-a32f-4d5b-ad09-edda96a064a0@app.fastmail.com>
In-Reply-To: <20261124143432.3234864-1-arnd@kernel.org>
References: <20261124143432.3234864-1-arnd@kernel.org>
Subject: Re: [PATCH] mips: txx9: drop linux/gpio.h inclusion
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2026, at 15:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This header is going away soon, so include the appropriate one instead.
> The legacy interface is no longer needed since the conversion to a
> lookup table, but the consumer interface is still used.
>
> Fixes: 0caeacb11691 ("MIPS: TXX9: rbtx4927: Use GPIO lookup table for SIO DTR")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> This was previously part of the patch to remove the header,
> but we ended up splitting that up again.

I had that one in my local tree for the past few months, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                                            -- Linus Torvalds
